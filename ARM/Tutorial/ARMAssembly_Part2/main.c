#include <stdio.h>

extern int asm_sum(int a, int b);
extern int asm_mul(int a, int b);

int main(int argc, char *argv[])
{
	printf("== sum ==\n");
	int a = 71;
	int b = 29;
	printf("%d + %d = %d\n", a, b, asm_sum(a, b));
	printf("%d * %d = %d\n", a, b, asm_mul(a, b));

	printf("%d * %d = %d\n", 0, 0, asm_mul(0, 0));
	printf("%d * %d = %d\n", 5, 0, asm_mul(5, 0));
	printf("%d * %d = %d\n", 0, 5, asm_mul(0, 5));
	printf("%d * %d = %d\n", 5, 4, asm_mul(5, 4));
	

	return 0;
}