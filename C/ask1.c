#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
	int input_fd;
	char result;
	int N;
	int count = 0;
	
	if (argc != 2) {
		printf("Wrong number of arguments\n");
		return 1;
	}
	
	input_fd = open("file.bin", O_RDONLY);
	
	if(input_fd < 0) {
		printf("Something went wrong while opening file...");
		exit(1);
	}
	
	N = atoi(argv[1]);
	
	lseek(input_fd, -N, SEEK_END);
	read(input_fd, &result, sizeof(char));
	
	printf("%d\n", result);
	
	lseek(input_fd, 0, SEEK_SET);
	
	while(read(input_fd, &result, sizeof(char)) > 0) {
		if(result == 20) {
			count++;
		}
	}
	
	printf("'20' appeared %d times\n", count);

	close(input_fd);
	return 0;
}