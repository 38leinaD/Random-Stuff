#include <stdio.h>

extern int asm_sum(int a, int b);

int main(int argc, char *argv[])
{
	printf("== sum ==\n");
	int a = 71;
	int b = 29;
	printf("%d + %d = %d\n", a, b, asm_sum(a, b));

	return 0;
}