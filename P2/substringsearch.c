#include <stdio.h>
int main()
{
    int count;
    char string[100];
    char substring[100];
    int len1 = 0, len2 = 0;
    scanf("%s%s", string, substring);
    while (string[len1] != '\0')
        len1++;
    while (substring[len2] != '\0')
        len2++;
    for (int i = 0; i < len1; i++)
    {
        count = 0;
        if (string[i] == substring[0])
        {
            for (int j = 0; j < len2; j++)
            {
                if (string[i + j] != substring[j])
                    break;
                else
                    count++;
            }
        }
        if (count == len2)
        {
            printf("1\n");
            return 0;
        }
        i += count;
    }
    printf("0\n");
    return 0;
}