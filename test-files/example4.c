#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void processData(int count);
int compareInts(int a, int b);
int (*getComparator(char type))(int, int);
void fileOperations(const char *filename);

int main() {
    int option, num, a, b;
    char buffer[100], type;
    FILE *fp;

    // Input function: scanf (reads user option)
    printf("Enter option (1: processData, 2: compareInts, 3: fileOperations): ");
    scanf("%d", &option);

    // Input function: fopen (opens a file for reading)
    fp = fopen("test.txt", "r");
    if (fp == NULL) {
        perror("Failed to open test file");
        return 1;
    }

    // Conditional branch influenced by input
    if (option == 1) {
        printf("Enter number of iterations: ");
        scanf("%d", &num);
        processData(num); // Loop influenced by input
    } else if (option == 2) {
        printf("Enter two integers to compare: ");
        scanf("%d %d", &a, &b);

        printf("Enter comparator type (A for ascending, D for descending): ");
        scanf(" %c", &type);

        int (*cmp)(int, int) = getComparator(type); // Function pointer
        if (cmp != NULL) {
            int result = cmp(a, b);
            printf("Comparison result: %d\n", result);
        } else {
            printf("Invalid comparator type.\n");
        }
    } else if (option == 3) {
        fileOperations("test.txt"); // File I/O operations
    } else {
        printf("Invalid option.\n");
    }

    fclose(fp); // Close file
    return 0;
}

void processData(int count) {
    printf("Processing %d items...\n", count);
    for (int i = 0; i < count; i++) {
        printf("Processing item %d\n", i + 1);
    }
}

int compareInts(int a, int b) {
    return a - b;
}

int descendingCompare(int a, int b) {
    return b - a;
}

int (*getComparator(char type))(int, int) {
    if (type == 'A') {
        return compareInts;
    } else if (type == 'D') {
        return descendingCompare;
    } else {
        return NULL;
    }
}

void fileOperations(const char *filename) {
    FILE *fp = fopen(filename, "r");
    if (fp == NULL) {
        perror("Failed to open file");
        return;
    }

    fseek(fp, 0, SEEK_END);
    long size = ftell(fp);
    rewind(fp);

    char *content = (char *)malloc(size + 1);
    fread(content, 1, size, fp);
    content[size] = '\0';

    printf("File content:\n%s\n", content);
    free(content);
    fclose(fp);
}
