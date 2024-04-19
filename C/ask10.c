#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

int main() {
	int pid;
	int x, i;
	int max = -1;
	int pfd[2];
	int N[] = {2, 4, 6, 8, 10, 12, 14};
	
	if (pipe(pfd) < 0) {
		perror("Error with pipe! Closing...");
		exit(1);
	}
	
	pid = fork();
	
	if (pid == 0) {
		close(pfd[0]); // No reading
		for (i = 7/2; i < 7; i++) {
			if (max < N[i]) { 
				max = N[i];
			}
		}
		write(pfd[1], &max, sizeof(int));
		close(pfd[1]);
		return 0;
	}
	// parent
	close(pfd[1]);
	
	
	for (i = 0; i < 7/2; i++) {
		if (max < N[i]) { 
			max = N[i];
		}
	}
	waitpid(pid, NULL, 0);
	read(pfd[0], &x, sizeof(int));

	if (x > max) {
		max = x;
	}

	printf("Max: %d\n", max);

	return 0;
}