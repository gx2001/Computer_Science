#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/stat.h>

int main() {
	int input_fd, output_fd;
	int buf;
	int found = 0;
	
	while (scanf("%d", &buf) > 0) {
		if (buf & 1) {
			found = 1;
		}
	}
	
	if (found == 1) {
		puts("yes");
	} else {
		puts("no");
	}
	
	output_fd = open("result", O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
	if(output_fd < 0) {
		printf("Something went wrong while opening file...\n");
		exit(1);
	}
	
	char no[] = "no";
	if (found == 1) {
		write(output_fd, "yes", sizeof("yes"));
	} else {
		write(output_fd, no, sizeof(no));
	}
	
	close(output_fd);
	
	char res[20];
	input_fd = open("result", O_RDONLY);
	read(input_fd, res, sizeof(res));
	printf("Res = %s\n", res);
	
	return 0;
}