#include <stdio.h>

int main() {
    int choice, loopCount, i;

    printf("Enter a choice (1-3): ");
    scanf("%d", &choice);

    // Switch statement
    switch (choice) {
        case 1:
            printf("You chose option 1.\n");
            break;
        case 2:
            printf("You chose option 2.\n");
            break;
        case 3:
            printf("You chose option 3.\n");
            break;
        default:
            printf("Invalid choice.\n");
    }

    // If-else statement with a loop inside the if block
    printf("Enter a number for the loop count: ");
    scanf("%d", &loopCount);

    if (loopCount > 0) {
        printf("Starting a for loop with %d iterations:\n", loopCount);
        for (i = 0; i < loopCount; i++) {
            printf("Iteration %d\n", i + 1);
        }
    } else {
        printf("Loop count must be positive. No loop executed.\n");
    }

    // While loop
    int whileCounter = 5;
    printf("Executing a while loop to countdown from %d:\n", whileCounter);
    while (whileCounter > 0) {
        printf("Countdown: %d\n", whileCounter);
        whileCounter--;
    }

    printf("Program execution finished.\n");
    return 0;
}