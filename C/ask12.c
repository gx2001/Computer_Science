#include <stdio.h>

int main(int argc, char *argv[]) {
	FILE *infile;
	char buf[200];
	int count = 0;

	
	if ((infile = fopen(argv[1], "r")) == NULL) {
		printf("Error with infile\n");
		return 1;
	}
	
	while (fscanf(infile, "%s", buf) != EOF) {
		count++;
	}
	
	printf("%d\n", count);
	
	fclose(infile);
	return 0;
}