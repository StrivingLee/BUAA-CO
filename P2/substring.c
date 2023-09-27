#include<stdio.h>
#include<stdlib.h>

int main(int argc, char **argv)
{
    int i = 0;
    char s[250];
    do {
        scanf("%c", &s[i]);
        i++;
    } while (s[i - 1] != '\n');
    // printf("%s", s);

    return 0;
}
