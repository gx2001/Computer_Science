#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main() {
	int result = 0;
	int x, i;
	int fd;
	int N = 15;
	
	for (i = 1; i < N; i++) {
		result = result ^ i;
	}
	
	printf("Result: %d\n", result);
	
	fd = open("result", O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IRGRP | S_IROTH);
	
	if (fd < 0) {
		printf("Something went wrong while opening file...\n");
		return 1;
	}
	
	lseek(fd, result, SEEK_SET);
	write(fd, &N, sizeof(int));
	close(fd);
	return 0;
}