#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // 1. Command-line argument usage
    if (argc > 1) {
        printf("Command-line argument received: %s\n", argv[1]);
    } else {
        printf("No command-line argument provided.\n");
    }

    // 2. Environment variable usage
    char *env_var = getenv("TEST_ENV");
    if (env_var) {
        printf("Environment variable TEST_ENV: %s\n", env_var);
    } else {
        printf("Environment variable TEST_ENV not set.\n");
    }

    // 3. File I/O usage
    FILE *fp = fopen("file.txt", "r");
    if (fp == NULL) {
        perror("Error opening file");
        return 1;
    }

    char c;
    printf("File contents:\n");
    while ((c = getc(fp)) != EOF) {
        putchar(c);
    }
    fclose(fp);

    // 4. User input with scanf
    int id;
    printf("Enter an integer id: ");
    scanf("%d", &id);
    printf("You entered: %d\n", id);

    // 5. File read/write with fread/fwrite
    FILE *write_fp = fopen("output.txt", "w");
    if (write_fp) {
        fwrite("Writing to file\n", 1, 16, write_fp);
        fclose(write_fp);
    }

    return 0;
}
