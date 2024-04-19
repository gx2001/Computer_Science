#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
	int input_fd;
	int result;
	int N;
	int count = 0;
	int flag = 0;
	
	if (argc != 2) {
		printf("Wrong number of arguments\n");
		return 1;
	}
	
	input_fd = open(argv[1], O_RDONLY);
	
	if(input_fd < 0) {
		printf("Something went wrong while opening file...");
		exit(1);
	}
	
	lseek(input_fd, -4, SEEK_END);
	read(input_fd, &result, sizeof(int));
		
	printf("%d\n", result);
	
	lseek(input_fd, 0, SEEK_SET);
	
	while(read(input_fd, &result, sizeof(int)) > 0) {
		if(result == 32) {
			printf("'32' appeard in %d byte of the file\n", count);
			flag = 1;
			break;
		}
		count++;
	}
	
	if(flag == 0) {
		puts("The is not a byte with 32 value");
	}

	close(input_fd);
	return 0;
}