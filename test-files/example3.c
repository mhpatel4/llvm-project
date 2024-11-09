#include <stdio.h>

int main() {
    int n, i, input, count = 0;

    printf("Enter a number: ");
    scanf("%d", &n);

    for (i = 0; i < n; i++) {
        printf("Enter a number to add to count: ");
        scanf("%d", &input);
        count += input;
    }

    printf("Total count: %d\n", count);

    return 0;
}