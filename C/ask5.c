#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
	int input_fd;
	char number1;
	char number2;
	char result;
	int N;
	int count = 0;
	int flag = 0;
	
	if (argc != 2) {
		printf("Wrong number of arguments\n");
		return 1;
	}
	
	input_fd = open("file6.bin", O_RDONLY);
	
	if(input_fd < 0) {
		printf("Something went wrong while opening file...");
		exit(1);
	}
	
	N = atoi(argv[1]);
	
	read(input_fd, &number1, sizeof(char));
	lseek(input_fd, -1, SEEK_END);
	read(input_fd, &number2, sizeof(char));
	
	printf("The sum of first and last bytes is %d\n", number1 + number2);
	
	lseek(input_fd, 0, SEEK_SET);
	
	while(read(input_fd, &result, sizeof(char)) > 0) {
		count++;
		if(result == N) {
			printf("%d appeard in %d byte of the file\n", N, count);
			flag = 1;
			break;
		}
	}
	
	if(flag == 0) {
		printf("The is not a byte with %d value\n", N);
	}

	close(input_fd);
	return 0;
}