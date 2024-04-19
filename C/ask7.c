#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main() {
	int result = 0;
	int x, i;
	int fd;
	int N[] = {1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0};
	
	for (i = 0; i < 14; i++) {
		result = result ^ N[i];
	}
	
	printf("Result: %d\n", result);
	
	fd = open("result", O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IRGRP | S_IROTH);
	
	if (fd < 0) {
		printf("Something went wrong while opening file...\n");
		return 1;
	}
	
	write(fd, &result, sizeof(int));
	close(fd);
	return 0;
}