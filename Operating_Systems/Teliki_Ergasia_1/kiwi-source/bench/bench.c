#include "bench.h"
#include <stdio.h>      
#include <stdlib.h> 
#include <unistd.h>
#define R_RATE 10
#define W_RATE 90



void _random_key(char *key,int length) {
	int i;
	char salt[36]= "abcdefghijklmnopqrstuvwxyz0123456789";

	for (i = 0; i < length; i++)
		key[i] = salt[rand() % 36];
}

void _print_header(int count)
{
	double index_size = (double)((double)(KSIZE + 8 + 1) * count) / 1048576.0;
	double data_size = (double)((double)(VSIZE + 4) * count) / 1048576.0;

	printf("Keys:\t\t%d bytes each\n", 
			KSIZE);
	printf("Values: \t%d bytes each\n", 
			VSIZE);
	printf("Entries:\t%d\n", 
			count);
	printf("IndexSize:\t%.1f MB (estimated)\n",
			index_size);
	printf("DataSize:\t%.1f MB (estimated)\n",
			data_size);

	printf(LINE1);
}

void _print_environment()
{
	time_t now = time(NULL);

	printf("Date:\t\t%s", 
			(char*)ctime(&now));

	int num_cpus = 0;
	char cpu_type[256] = {0};
	char cache_size[256] = {0};

	FILE* cpuinfo = fopen("/proc/cpuinfo", "r");
	if (cpuinfo) {
		char line[1024] = {0};
		while (fgets(line, sizeof(line), cpuinfo) != NULL) {
			const char* sep = strchr(line, ':');
			if (sep == NULL || strlen(sep) < 10)
				continue;

			char key[1024] = {0};
			char val[1024] = {0};
			strncpy(key, line, sep-1-line);
			strncpy(val, sep+1, strlen(sep)-1);
			if (strcmp("model name", key) == 0) {
				num_cpus++;
				strcpy(cpu_type, val);
			}
			else if (strcmp("cache size", key) == 0)
				strncpy(cache_size, val + 1, strlen(val) - 1);	
		}

		fclose(cpuinfo);
		printf("CPU:\t\t%d * %s", 
				num_cpus, 
				cpu_type);

		printf("CPUCache:\t%s\n", 
				cache_size);
	}
}

// This function takes a void pointer argument named "values"
void *write_request(void *values){
	// Cast the void pointer "values" to a pointer of type "struct data"
	struct data *d = (struct data *)values ;
	// Call the function "_write_test" with the arguments specified in the "struct data" pointer "d"
	_write_test
	(
		d->number_count, 	// Number of values to be written
		d->number_r,		// Random seed value
		d->number_threads	// Number of threads to use
	);
	// Return 0 as the function's exit status
	return 0;
}

// This function takes a void pointer argument named "values"
void *read_request(void *values){
	// Cast the void pointer "values" to a pointer of type "struct data"
	struct data *d = (struct data *)values ;
	// Call the function "_read_test" with the arguments specified in the "struct data" pointer "d"
	_read_test(
		d->number_count,	// Number of values to be written
		d->number_r,		// Random seed value
		d->number_threads	// Number of threads to use 
	);
	// Return 0 as the function's exit status
	return 0;
}

/*
	1.A function which return an random integer over 500
*/

// Function to generate a random integer value greater than or equal to 50
int random_generator(){
	// Generate a random integer value using the rand() function from the standard library 
	int random_value = rand();
	// Initialize a counter variable to keep track of the number of the iterations 
	int count = 0;
	// While the random value is less than 50, generate a new random value
	while (random_value < 50 ){
		random_value = rand();	 // Generate a new random value 
		fprintf("\n [%d] random value : %d",count,random_value);  // Print the current random value (optional)
		count++;	// Increment the counter variable 
	}
	// Multiply the random value by 10 and return the result
	int return_value = random_value*10;
	return return_value;
}

// Function to print additional information to the terminal by reading from a text file
void printf_info_terminal_by_txt(){
	system("cat /home/myy601/kiwi/kiwi-source/engine/Information.txt"); // Execute a shell command to print the contents of a text file to the terminal
}

// Function to perform error chacking on input parameters 
void error_cather(char *command , char *count , char *threads , char *n){

	// Convert the threads and count parameters from strings to integers 
	int thread_int = atoi(threads);
	int count_int = atoi(count);

	// Check if the command parameter is one of three valid values 
	if (strcmp(command ,"write") !=0 && strcmp(command, "read")!=0 && strcmp(command,"readwrite")!=0){
		// If the command is not valid, print an error message to stderr and call a function to print additional information to the terminal
		fprintf(stderr,"Input error \n");
		printf_info_terminal_by_txt();
		exit(1);	// Exit the program with an error code of 1
	}
	
	// Check if the count parameter is less than 0
	if (count_int < 0){
		// If the count is negative, print an error message to stderr and call a function to print additional information to the terminal
		fprintf(stderr,"Unable to write in db negative amount of data !\n");
		printf_info_terminal_by_txt();
		exit(1);	// Exit the program with an error code of 1
	}
	
	// Check if the string "n" can be converted to an integer 0 or 1
	if ( atoi(n)!=0 && atoi(n)!=1){
		// If "n" is not 0 or 1 , print an error message to standard error
		fprintf(stderr,"Erorr in n!\n");
		// Call a function to print additional information to the terminal.
		printf_info_terminal_by_txt();
		exit(1); 	// Exit the program with an error code of 1
	}
}

/*
* error_cather_1() doesnt print in terminal Infromation.txt
*/

void error_cather_1(char *command , char *count , char *threads , char *n){

	int thread_int = atoi(threads);
	int count_int = atoi(count);

	if (strcmp(command ,"write") !=0 && strcmp(command, "read")!=0 && strcmp(command,"readwrite")!=0){
		fprintf(stderr,"Input error \n");
		exit(1);
	}
	
	if (count_int < 0){
		fprintf(stderr,"Unable to write in db negative amount of data !\n");
		exit(1);
	}
	
	if ( atoi(n)!=0 && atoi(n)!=1){
		fprintf(stderr,"Erorr in n!\n");
		exit(1);
	}
}

// This function prints the resultsof a random write benchmark test
// It takes in the number of the writes performed and the total time it took to perform them as input
void print_time_write(int number_count, double cost_of_writes){
	// Print a horizontal line to make the output easier to read
	printf(LINE);
	// Prints the results of the write benchmark test.
	// The output includes the number of writes performed, the time it took to perform one write operation,
	// the estimated number of the writes per second, and the total time it took to perform all writes.
	printf("|Random-Write	(done:%d): %.6f sec/op; %.1f writes/sec(estimated); cost:%.3f(sec);\n"
	,number_count, (double)(cost_of_writes / number_count)
	,(double)(number_count / cost_of_writes)
	,cost_of_writes);
}

// This function prints the results of a random read benchmark
void print_time_read(int number_count , double cost_of_reads){
	// Prints a horizontal line to make the output easier to read
	printf(LINE);
	// Prints the results of the read benchmark test
	// The output includes the number of reads performed, the time it took to perform one read operation,
	// the estimated number of the reads per second and the total time it took to perform all reads.
	printf("|Random-Read	(done:%d): %.6f sec/op; %.1f reads /sec(estimated); cost:%.3f(sec)\n",
	number_count, (double)(cost_of_reads / number_count),
	(double)(number_count / cost_of_reads),
	cost_of_reads);
}

// Function to read the read rate from the user 
int read_function_rate(){
	int read_rate ;
	printf("Enter read rate :"); // Ask the user to enter the read rate 
	scanf("%d",&read_rate);	// Read the read rate from the user
	printf("\n");
	// Check if the read rate is greater than 0
	if (read_rate>0){
		return read_rate;	// If the read rate is valid, return it 
	}
	printf("\nDefault read rate 90");	// If the read rate is not valid, print a default read rate message 
	return read_rate;	// Return the read rate(even if it not valid)
}

//Function to read the write rate from the user 
int write_function_rate(){
	int write_rate ;
	printf("Enter write rate :");	// Ask the user to enter the write rate 
	scanf("%d",&write_rate);	// Read the write rate from the user 
	printf("\n");
	// Check if the write rate is grater than 0
	if (write_rate>0){
		return write_rate;	// If the write rate is valid, return it
	}
	printf("\nDefault write rate 10");	// If the write rate is not valid, print a default write rate message 
	return write_rate;	// Return the write rate (even if it is not valid)

}

// This function calculates the complement of the sum of the read_rate and write_rate and write_rate and return it. 
// If read_rate or write_rate are negative, it prints an error message and exits the program
int complement_rate(int read_rate,int write_rate){
	int complement ;
	// Check if the read_rate is negative
	if (read_rate<0){
		// If the read_rate is negative, print an error message and exit the program
		fprintf(stderr,"Unable to do multithreading use negative rate !\n");
		printf_info_terminal_by_txt();
		exit(1);	// Exit the program with an error code of 1
	}
	// Check if the write_rate is negative
	else if (write_rate<0){
		// If write_rate is negative, print an error message and exit the program
		fprintf(stderr,"Unable to do multithreading use negative rate !\n");
		printf_info_terminal_by_txt();
		exit(1);	// Exit the program with an error code of 1
	}
	// Check if the sum of the read_rate and write_rate is grater than 100
	else if (read_rate+write_rate>100){
		// If the sum is greater than 100, return the complement
		return complement = read_rate+write_rate;
	}
	// Check if the difference between read_rate and write_rate is negative
	else if (read_rate-write_rate<0){
		// If the difference is negative, return the complement
		return complement = read_rate-write_rate;
	}
	// If none of the conditions above are met, return 0
	else {
		return 0;
	} 	
}


// This is the main function of the program
int main(int argc,char** argv)
{
	// Declare the variables
	int read_rate;
	int write_rate ;

	// Check if the first argument is "readwrite"
	if (strcmp(argv[1],"readwrite")==0){
		// If there are 7 arguments, take read write rates from the user input
		if (argc == 7 ){
			read_rate  = atoi(argv[5]); // Take read_rate from user input
			write_rate = atoi(argv[6]); // Take write_rate from user input
		}
		// Otherwise, get read and write rates from user input functions
		else{
			read_rate  = read_function_rate(); // Take read_rate from user input function 
			write_rate = write_function_rate(); // Take write_rate from user input function 
		}
	}	
	// Complement read and write rates
	int value = complement_rate(read_rate,write_rate);
	if (value>100 || value <0){
		// If the complement value is greater than 100 or less than 0, set default values
		read_rate = R_RATE;
		write_rate = W_RATE;
		// Print message
		printf(LINE);
		printf("Rates Set Default : read_rate = 10 and write_rate = 90");
		printf(LINE);  
		sleep(1);
	}
	// Check for errors in the arguments
	if (argc == 8 || argc ==5){
		error_cather_1(argv[1],argv[2],argv[3],argv[4]);
	}
	error_cather(argv[1],argv[2],argv[3],argv[4]);	
	// Declare variables
	long int count;
	int id_num;  
	int threads;
	cost_of_writes = 0.0; // from bench.h
	cost_of_reads = 0.0;  // from bench.h
 
	// Set size of threads with random generator
	id_num = random_generator();
	pthread_t *id_numbers,*id1_numbers,*id2_numbers;
	id_numbers = (pthread_t *) malloc (id_num*sizeof(int));
	id1_numbers = (pthread_t *) malloc (id_num*sizeof(int));
	id2_numbers = (pthread_t *) malloc (id_num*sizeof(int));
	// Declare data structs and initialize mutexes
	struct data argument1 , argument2 ,argument3 ;
	pthread_mutex_init(&total_writes,NULL);
	pthread_mutex_init(&total_reads,NULL);

	// Seed random number generator
	srand(time(NULL));

		// Check if the first argument is "write"
	if (strcmp(argv[1], "write") == 0) {
		
		int r = 0;
		// Get count and threads from user input 
		count = atoi(argv[2]);
		_print_header(count);
		_print_environment();
		if (argc == 5)
			r = 1;
		threads = atoi(argv[3]);
		// Open database and set arguments 
		_open_db();
		argument1.number_r = r ; 
		argument1.number_count = count ;
		argument1.number_threads = threads;
		// Create threads for write requests
		for (int i = 0 ; i<threads;i++){
			pthread_create(&id1_numbers[i],NULL,write_request,(void *)&argument1);
		}
		// Join threads 
		for (int j = 0 ; j<threads ; j++){
			pthread_join(id1_numbers[j],NULL);
		}
		// Close database and print write time 
		_close_db();
		print_time_write(argument1.number_count,cost_of_writes);

	} 
	// Check if the first argument is "read"
	else if (strcmp(argv[1], "read") == 0) {
		// Initialize a variable to hold a flag that will determine whether a read request was performed
		int r = 0;
		// Make the second argument as an integer and assign it to the variable "count"
		count = atoi(argv[2]);
		// Print a header containing information about the number of requests to be performed 
		_print_header(count);
		// Print information about the environment
		_print_environment();
		//check if there is a fourth argument which indicates whether a read_rate was performed
		if (argc == 5)
			r = 1;
		// Make the third argument as an integer and assign it to the variable "threads"
		threads = atoi(argv[3]);
		// Open a database connection
		_open_db();
		// Give the struct information about the read request
		argument1.number_r=r;
		argument1.number_count =count;
		argument1.number_threads = threads;
		// Create "threads" number of threads using "pthread_create", each calling a function named "read_request"
		for (int i = 0 ; i<threads;i++){
			pthread_create(&id1_numbers[i],NULL,read_request,(void *)&argument1);
		}
		// Wait for all threads to finish using "phread_join"
		for (int j = 0 ; j<threads ; j++){
			pthread_join(id1_numbers[j],NULL);
		}
		// Close the database connection
		_close_db();
		// Print the time taken to complete the read request
		print_time_read(argument1.number_count,cost_of_reads);
	}

	// Check if the first argument is "readwrite"
	else if(strcmp(argv[1],"readwrite")==0){
		// Canculate the write and read percentages based on the write_rate
		double write_rate_1 = (double)write_rate;
		double read_rate_1 = (double)read_rate;
		double write_percentage = write_rate_1/100;
		double read_percentage = read_rate_1/100;

		// Print the write and read percentages to the console 
		printf("\n Write percentage = %f and Read percentage = %f ",write_percentage,read_percentage);
		// Set r to 1 if argc == 5, otherwise r = 0
		int r =0 ; 
		count = atoi(argv[2]);
		_print_header(count);
		_print_environment();
		if (argc == 5)
			r = 1;
		// Set the number of threads and number of operations for write and read
		threads = atoi(argv[3]);
		
		_open_db();
		// Arguments for the writes
		argument2.number_count = (long)(count * write_percentage);
		argument2.number_threads=(int)(threads * write_percentage);
		argument2.number_r = r;
		// Arguments for the reads
		argument3.number_count = (long)(count * read_percentage);
		argument3.number_threads = (int)(threads * read_percentage);
		argument3.number_r = r;
		// Create threads for writing
		for (int i = 0 ; i<(threads*write_percentage);i++){
			pthread_create(&id1_numbers[i],NULL,write_request,(void *)&argument2);
		}
		// Create threads for reading
		for (int i = 0 ; i<(threads*read_percentage);i++){
			pthread_create(&id2_numbers[i],NULL,read_request,(void *)&argument3);
		}
		// Wait for reading threads to finish
		for (int j = 0 ; j<(threads * read_percentage) ; j++){
			pthread_join(id2_numbers[j],NULL);
		}
		// Wait for writning threads to finish 
		for (int j = 0 ; j<(threads*write_percentage) ; j++){
			pthread_join(id1_numbers[j],NULL);
		}
		_close_db();
		// Print the time it took to perform the writes and reads 
		print_time_write(argument2.number_count,cost_of_writes);
		print_time_read(argument3.number_count,cost_of_reads);
	}
	else {
		// Print usage instructions if the command line arguments are incorrect
		fprintf(stderr,"Usage: db-bench <write | read | readwrite> <count> <threads> <r>  \n");
		exit(1);
	}
	// Return 1 to indicate successful completion
	return 1;
}
