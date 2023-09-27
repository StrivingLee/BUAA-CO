#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    FILE *in, *out;
    char line[1024];
    if((in = fopen("input.txt", "r")) == NULL) {
        printf("Error opening\n");
        exit(1);
    }
    out = fopen("source.txt", "w");
    while(fgets(line, 1000, in) != NULL) {
        int line_len = strlen(line);
        for(int i = 36; i < line_len; i++) {
            fprintf(out, "%c", line[i]);
        }
        // fprintf(out, "\n");
    }
    return 0;
}