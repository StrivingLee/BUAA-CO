#include <stdio.h>
#include <stdlib.h>

void make_heap (int arr[], int num);
void shift_down (int pos, int arr[], int num);
void heap_sort (int arr[], int num);
void swap (int arr[], int i, int j);


int
main (int argc, char ** argv) {
    int i;
    int arr[] = {5,4,32,2,1};
    // heap_sort (arr,5);
    shift_down (0, arr, 5);

    // make_heap (arr,5);
    for (i = 0; i < 5; i++)
        printf ("%d ", arr[i]);
    printf ("\n");
    return EXIT_SUCCESS;
}

void
make_heap (int arr[], int num) {
    int i, j;
    for (i = num/2; i >= 0; i--) {
        shift_down (i, arr, num);
        for (j = 0; j < 5; j++)
            printf ("%d ", arr[j]);
        printf ("\n");
    }
}

void
shift_down (int i, int arr[], int num) {
    int p, j;
    while ((p = i*2+2) <= num) {
        j = p - 1;
        if (j >= num) break;
        if ((p < num) && (arr[p] > arr[j]))
                j = p;
        if (arr[j] <= arr[i]) break;
        swap (arr, i, j);
        i = j;
    }
    return;
}

void
swap (int arr[], int i, int j) {
    int temp;
    temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
    return;
}

void
heap_sort (int arr[], int num) {
    int i;
    make_heap (arr, num);
    for (i = 0; i < num; i++) {
        swap (arr, 0, num - i - 1);
        shift_down (0, arr, num - i - 1);
    }
}

