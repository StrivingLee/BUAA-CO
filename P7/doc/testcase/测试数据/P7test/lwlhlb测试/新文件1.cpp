#include <stdio.h>

int main() {
	int i;
	for (i = 32512; i <= 32665; i ++) {
		printf("lw $1,0x%x($0)\n", i);
		printf("lh $1,0x%x($0)\n", i);
		printf("lb $1,0x%x($0)\n", i);
		printf("sw $1,0x%x($0)\n", i);
		printf("sh $1,0x%x($0)\n", i);
		printf("sb $1,0x%x($0)\n", i);
	}
	for (i = 0; i < 1120 - (32665 - 32511) * 6; i++) {
		printf("nop\n");
	}
}