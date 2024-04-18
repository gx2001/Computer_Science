import java.util.Scanner;
class Board{
	public status head = null;
	public status tail = null;
	public int number_of_states = 1;
	public int number_of_parents = 0;
	public status kl_h = null;
	public status kl_t = null;
	
	public DefineConstants printerStatus = new DefineConstants();
	public Error error = new Error();
	public CostCalculator costCalculator;
	public ArrayHandler arrayHandler= new ArrayHandler();

	public int check_egkiri(int[][] B)
	{
		int i;

		  for (i = 0;i < 3 * DefineConstants.K;i++)
		  {
			  if (B[i][1] >= 1 && keni_thesi(B, B[i][0], B[i][1] - 1) == 1)
			  {
				  return 0;
			  }
		  }
		  return 1;
	}

	public int keni_thesi(int[][] A, int x, int y)
	{
		for (int i = 0;i < 3 * DefineConstants.K;i++)
		{
			if (A[i][0] == x && A[i][1] == y) // an yparxei kapoios kivos sti thesi (x,y)
			{
			return 0;
			}
		}
		return 1;
	}

	public int eleftheros_kivos(int[][] A, int nx, int ny)
	{
	int i;

		if (ny == 2)
		{
			return 1;
		}

		if (keni_thesi(A, nx, ny + 1) == 1) // an i apo PANW thesi einai keni 
		{
			return 1;
		}

		return 0;

	}
	public void my_read()
	{
		printerStatus.initializeBoard();
		printerStatus.printBoard();
		status temp;
		int i;
		int coordinateX;
		int coordinateY;
		Scanner keyboard = new Scanner(System.in);

		temp = new status();

		if(error.memoryError(temp) == true){System.exit(1); }

		temp.kostos = 0.0;
		temp.parent = null;
		temp.next = null;
		temp.kleisto = null;
		temp.monopati = null;

		while (true)
		{
			i = 0;
			while (i < 3 * DefineConstants.K)
			{
				System.out.printf("Dose ta (x,y) tou %d kivou: \n",i + 1); // (x = 0...4K-1, y = 0) h' (x = 0...K-1, y=1...2)
				do {
					while(!keyboard.hasNextInt()){
						System.out.println("Error input in coordinate x \nGive a coordinate X : ");
						keyboard.next();
					}
					coordinateX = keyboard.nextInt();
				}while(coordinateX < 0 );
				do {
					while(!keyboard.hasNextInt()){
						System.out.println("Error input in coordinate y \nGive a coordinate Y : ");
						keyboard.next();
					}
					coordinateY = keyboard.nextInt();
				}while(coordinateY < 0 );

				 temp.A[i][0] = coordinateX;
				 temp.A[i][1] =coordinateY;
				 i++;
			}

			break;
		}
		head = temp;
		tail = temp;
		printerStatus.printCoordinates(head.A,0);
		printerStatus.statusPrint(head.A);
	}

	public status take_out_smaller()
	{
		status st;
		status before;
		status cur;
		status best_comb;
		double smaller_cost;

		before = null;

		st = head;
		smaller_cost = st.kostos;
		best_comb = st;
		while (st.next != null)
		{
			cur = st;
			st = st.next;
			if (st.kostos < smaller_cost)
			{
				smaller_cost = st.kostos;
				best_comb = st;
				before = cur;
			}
		}

		if (before != null)
		{
			before.next = best_comb.next;
			if (best_comb.next == null)
			{
				tail = before;
			}
			best_comb.next = null;
		}
		else
		{
			head = best_comb.next;
			if (best_comb.next == null)
			{
				tail = null;
			}
			best_comb.next = null;
		}

		return (best_comb);
	}
	public int check_final_state(status st)
	{
		int i;

		for (i = 0;i < DefineConstants.K;i++) // oi kivoi me arithmisi apo 1 ews K
		{
			if (st.A[i][0] != i || st.A[i][1] != 0) // an einai se alli thesi
			{
			   return 0;
			}
		}

		for (i = DefineConstants.K;i < 2 * DefineConstants.K;i++) // oi kivoi me arithmisi apo K+1 ews 2*K
		{
			if (st.A[i][0] != (i - DefineConstants.K) || st.A[i][1] != 1) // an einai se alli thesi
			{
			   return 0;
			}
		}

		for (i = 2 * DefineConstants.K;i < 3 * DefineConstants.K;i++) // oi kivoi me arithmisi apo 2*K+1 ews 3*K
		{
			if (st.A[i][0] != (i - 2 * DefineConstants.K) || st.A[i][1] != 2) // an einai se alli thesi
			{
			   return 0;
			}
		}

		return (1);
	}
	public void tipose_beltisti_akolouthia(status st)
	{
		status temp;
		status st1;
		int i = 1;
		int j;
		temp = st;
		st1 = st;
		while (temp.parent != null)
		{
			temp.parent.monopati = temp;
			temp = temp.parent;
		}
		while (temp != st1)
		{
			System.out.printf("H %d katastasi me kostos %f einai i eksis: \n",i,temp.kostos);
		if (i == 1){
			printerStatus.printBoard();
		}
			System.out.printf("\n");
			temp = temp.monopati;
			i++;
			if (i>1){
			printerStatus.initializeBoard();
			printerStatus.statusPrint(temp.A , i );
			System.out.printf("\n");
			}
		}
		System.out.printf("H %d kai teliki katastasi me kostos %f einai i eksis:",i,temp.kostos);
		for (j = 0;j < 3 * DefineConstants.K;j++)
		{
			System.out.printf("%d:(%d,%d) ",j,temp.A[j][0],temp.A[j][1]);
		}
		System.out.printf("\n");
	}
	public int my_search(int[][] B)
	{
		int help;
		int my_count = 0;
		int i;
		status st;

		st = kl_h;
		while (st != null)
		{
			help = 1;
			for (i = 0;i < 3 * DefineConstants.K;i++)
			{
				if (B[i][0] != st.A[i][0] || B[i][1] != st.A[i][1])
				{
					help = 0;
					break;
				}
			}
			if (help == 1)
			{
				my_count = 1;
				break;
			}
			st = st.kleisto;
		}

		return (my_count);
	}


	public void epektasi(status st)
	{
		status temp;
		int i;
		int a;
		int [][] copy ;

		//printf("K %f \n",st->kostos);
		//printf("CHILDREN\n");
		for (i = 0;i < 3 * DefineConstants.K;i++) // gia kathe kivo
		{
			if (eleftheros_kivos(st.A,st.A[i][0],st.A[i][1]) == 1) // an einai eleftheros
			{ //printf("FREE (%d,%d) \n", st->A[i][0],st->A[i][1]);
				for (a = 0;a < 4 * DefineConstants.K;a++) // psaxnei gia kenes theseis me y = 0
				{
					if (keni_thesi(st.A,a,0) == 1) // an i thesi einai keni
					{ //printf("KENI (%d,%d) \n", a , 0);
						 
						copy = arrayHandler.copyArray(st.A , i  , a , 0);
						copy[i][0] = a;
						copy[i][0] = 0;
						if (check_egkiri(copy) == 1) // kai an i thesi einai egkiri
						{ //printf("KAI EGKIRI 0\n");
						temp = new status();
						if(error.memoryError(temp)==true){System.exit(1);}

						number_of_states++;
						temp.A = arrayHandler.copyArray(st.A , a , 0 , i);
						temp.A[i][0] = a;
						temp.A[i][1] = 0;
						

						costCalculator = new CostCalculator(st.A[i][1], 0, st.kostos);
						temp.kostos = costCalculator.getCost();

						temp.parent = st;
						temp.next = null;
						temp.kleisto = null;


						if (head == null)
						{
							head = temp;
							tail = temp;
						}
						else
						{
							tail.next = temp;
							tail = temp;
						}
						if (a >= DefineConstants.K)
						{
						break;
						}
						}
					}
				}

				for (a = 0;a < DefineConstants.K;a++) // psaxnei gia kenes theseis me y = 1
				{
					if (keni_thesi(st.A,a,1) == 1) // an i thesi einai keni
					{ //printf("KENI (%d,%d) \n", a , 1);

						copy = arrayHandler.copyArray(st.A);
						copy[i][0] = a ;
						copy[i][1] = 1 ;
						if (check_egkiri(copy) == 1) // kai an i thesi einai egkiri
						{ //printf("KAI EGKIRI 1\n");
						
						temp = new status();

						if(error.memoryError(temp) == true){System.exit(1);}
						number_of_states++;
						temp.A = arrayHandler.copyArray(st.A);
						temp.A[i][0] = a;
						temp.A[i][1] = 1;
						costCalculator = new CostCalculator(st.A[i][1] , 1 , st.kostos);
						temp.kostos = costCalculator.getCost();
		
						temp.parent = st;
						temp.next = null;
						temp.kleisto = null;

						if (head == null)
						{
							head = temp;
							tail = temp;
						}
						else
						{
							tail.next = temp;
							tail = temp;
						}
						}
					}
				}

				for (a = 0;a < DefineConstants.K;a++) // psaxnei gia kenes theseis me y = 2
				{
					if (keni_thesi(st.A,a,2) == 1) // an i thesi einai keni
					{ //printf("KENI (%d,%d) \n", a , 2);
						  copy = arrayHandler.copyArray(st.A);
						  copy[i][0] = a ;
						  copy[i][1] = 2 ;
						  if (check_egkiri(copy) == 1) // kai an i thesi einai egkiri
						  { //printf("KAI EGKIRI 2\n");
							temp = new status();
							if(error.memoryError(temp)==true){System.exit(1);}
							number_of_states++;
							temp.A = arrayHandler.copyArray(st.A);
							temp.A[i][0] = a;
							temp.A[i][1] = 2;
							costCalculator = new CostCalculator(st.A[i][1], 2, st.kostos);
							temp.kostos = costCalculator.getCost();

							temp.parent = st;
							temp.next = null;
							temp.kleisto = null;

							if (head == null)
							{
								head = temp;
								tail = temp;
							}
							else
							{
								tail.next = temp;
								tail = temp;
							}
						}
					}
				}
			}
		}
		if (kl_h == null)
		{
			kl_h = st;
			kl_t = st;
		}
		else
		{
			kl_t.kleisto = st;
			kl_t = st;
		}
	}

	public void UCS()
	{
		status st1;
		int found = 0;
		int q;
		int i;
		int secur;
		int ch;
		/* Dimiourgia arxikis katastasis */
		my_read();

		System.out.printf("\n");
		Scanner scan = new Scanner(System.in);
		q = scan.nextInt();
		while (found == 0)
		{
			//check_queue();
			if (error.queueError(head) == false){
				st1 = take_out_smaller();
				secur = my_search(st1.A);
				if (secur == 0)
				{
					ch = check_final_state(st1);
					if (ch == 1) //teliki katastasi
					{
						found = 1;
						tipose_beltisti_akolouthia(st1);
					}
					else
					{
						number_of_parents++;
						if (number_of_parents % 3000 == 0)
						{
						System.out.printf("P %d C %f\n",number_of_parents,st1.kostos);
						}
						epektasi(st1);
					}
				}
			}
		}
	}
}
