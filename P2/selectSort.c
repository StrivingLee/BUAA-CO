#include <stdio.h>

int holdon[] = {1, 9, 1, 9, 8, 1, 0};

void selectSort(int array[], int n)
{
    int i, j, tmp;
    for (i = 0; i < n; i++)
    {
        for (j = i; j < n; j++)
        {
            if (array[i] > array[j])
            {
                tmp = array[i];
                array[i] = array[j];
                array[j] = tmp;
            }
        }
    }
}

int main()
{
    selectSort(holdon, 7);
    for (int i = 0; i < 7; i++)
    {
        printf("%d\n", holdon[i]);
    }
}