#include <stdio.h>

int main() {
    int n, i, input, count = 0;

    printf("Enter the number of iterations and the initial count (e.g., '5 0'): ");
    scanf("%d %d", &n, &count);

    for (i = 0; i < n; i++) {
        printf("Enter a number to add to count: ");
        scanf("%d", &input);
        count += input;
    }

    printf("Total count: %d\n", count);

    return 0;
}