#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/stat.h>

void copy(char *input_file, char *output_file)
{
	int input_fd, output_fd;
	char buf;

	input_fd = open(input_file, O_RDONLY);
	output_fd = open(output_file, O_WRONLY | O_CREAT | O_TRUNC, S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH);
			
	if(input_fd == -1 || output_fd == -1)
	{
		printf("Something went wrong while opening file...");
		exit(1);
	}

	while(read(input_fd, &buf, sizeof(buf)) > 0) {
		write(output_fd, &buf, sizeof(buf));
	}

	close(input_fd);
	close(output_fd);
}


int main(int argc, char **argv)
{
	if (argc != 3)
	{
		printf("Wrong number of arguments\n");
		return 1;
	}
	copy(argv[1], argv[2]);
	return 0;
}