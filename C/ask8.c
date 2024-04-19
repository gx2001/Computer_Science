#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>


int main() {
	int result;
	int x;
	int fd;
	int found = 1;
	
	do {
		printf("Give a number\n");
		scanf("%d", &x);
		
		if (found == 1 && x != 0) {
			found = 0;
			result = x;
		} else if (x != 0) {
			result = result & x;
		}
	} while(x != 0);
	
	if (found == 1) {
		puts("No number!");
	} else{
		printf("Result: %d\n", result);
	}
	
	fd = open("result", O_WRONLY | O_CREAT | O_TRUNC, S_IRWXU | S_IRWXG | S_IRWXO);
	
	if (fd < 0) {
		printf("Something went wrong while opening file...\n");
		exit(1);
	}
	
	lseek(fd, 15, SEEK_SET);
	write(fd, &result, sizeof(int));
	close(fd);
	return 0;
}