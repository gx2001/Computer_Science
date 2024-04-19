#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
	int input_fd, output_fd;
	char result;
	int N;
	int count = 0;
	int flag = 0;
	
	if (argc != 2) {
		printf("Wrong number of arguments\n");
		return 1;
	}
	
	input_fd = open("file3.bin", O_RDONLY);
	
	output_fd = open("file_result.bin", O_WRONLY | O_CREAT | O_TRUNC, S_IRWXU | S_IRWXG | S_IRWXO);
	
	if(input_fd < 0 || output_fd < 0) {
		printf("Something went wrong while opening file...");
		exit(1);
	}
	
	N = atoi(argv[1]);
	
	lseek(input_fd, (N-1), SEEK_SET);
	read(input_fd, &result, sizeof(char));
		
	printf("%d\n", result);
	
	write(output_fd, &result, sizeof(char));
	
	lseek(input_fd, 0, SEEK_SET);
	
	while(read(input_fd, &result, sizeof(char)) > 0) {
		count++;
		if(result == N) {
			printf("%d appeard in %d byte of the file\n", N, count);
			flag = 1;
		}
	}
	
	if(flag == 0) {
		printf("The is not a byte with %d value\n", N);
	}

	close(input_fd);
	close(output_fd);
	return 0;
}