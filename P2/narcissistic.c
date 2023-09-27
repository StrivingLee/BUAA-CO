#include <stdio.h>

int main() {
    int sum = 0;
    int cur = 0;
    for(int i = 1; i < 10; i++) {
        for(int j = 0; j < 10; j++) {
            for(int k = 0; k < 10; k++) {
                sum = 0;
                cur = 0;
                sum += i * i * i;
                sum += j * j * j;
                sum += k * k * k;
                cur += i * 100;
                cur += j * 10;
                cur += k;
                // printf("sum = %d\n", sum);
                // printf("cur = %d\n", cur);
                if(cur == sum) printf("%d\n", cur);
            }
        }
    }
    return 0;
}