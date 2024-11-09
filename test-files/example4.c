#include <stdio.h>

// Function prototypes for different operations
void add(int a, int b) {
    printf("Result of Addition: %d + %d = %d\n", a, b, a + b);
}

void subtract(int a, int b) {
    printf("Result of Subtraction: %d - %d = %d\n", a, b, a - b);
}

void multiply(int a, int b) {
    printf("Result of Multiplication: %d * %d = %d\n", a, b, a * b);
}

void divide(int a, int b) {
    if (b != 0) {
        printf("Result of Division: %d / %d = %d\n", a, b, a / b);
    } else {
        printf("Error: Division by zero!\n");
    }
}

// Function to display the menu
void displayMenu() {
    printf("\nChoose an operation:\n");
    printf("1. Add\n");
    printf("2. Subtract\n");
    printf("3. Multiply\n");
    printf("4. Divide\n");
    printf("5. Exit\n");
}

// Main function
int main() {
    int choice;
    int x, y;
    void (*operation)(int, int); // Function pointer to store selected operation

    while (1) {  // Infinite loop for continuous operations until user exits
        displayMenu();
        printf("Enter choice (1-5): ");
        scanf("%d", &choice);

        if (choice == 5) {  // Exit condition
            printf("Exiting the program.\n");
            break;
        }

        // Input numbers for operations
        printf("Enter two numbers: ");
        scanf("%d %d", &x, &y);

        // Switch statement to select the function based on choice
        switch (choice) {
            case 1:
                operation = add;
                break;
            case 2:
                operation = subtract;
                break;
            case 3:
                operation = multiply;
                break;
            case 4:
                operation = divide;
                break;
            default:
                printf("Invalid choice, please select again.\n");
                continue;  // Go back to menu
        }

        // Call the selected operation using the function pointer
        operation(x, y);

        // Example of conditional branching with `if` and `for` loop to ask if user wants another calculation
        char anotherCalculation;
        printf("Do you want to perform another calculation? (y/n): ");
        scanf(" %c", &anotherCalculation);

        if (anotherCalculation == 'n' || anotherCalculation == 'N') {
            printf("Thank you for using the program. Goodbye!\n");
            break;
        }
    }

    return 0;
}

