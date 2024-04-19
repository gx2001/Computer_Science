#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
	int fd;
	char result;
	int N;
	int XOR = 0;
	
	if (argc != 2) {
		printf("Wrong number of arguments\n");
		return 1;
	}
	
	fd = open("file2.bin", O_RDWR);
	
	if(fd < 0) {
		printf("Something went wrong while opening file...");
		exit(1);
	}
	
	N = atoi(argv[1]);
	
	lseek(fd, (N-1), SEEK_SET);
	read(fd, &result, sizeof(char));
	printf("%d\n", result);
	
	result = 15;
	lseek(fd, -1, SEEK_CUR);
	write(fd, &result, sizeof(char));
	
	lseek(fd, 0, SEEK_SET);
	
	while(read(fd, &result, sizeof(char)) > 0) {
		XOR = XOR ^ result;
	}
	
	printf("XOR = %d\n", XOR);

	close(fd);
	return 0;
}