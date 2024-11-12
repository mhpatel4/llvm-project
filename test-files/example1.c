#include <stdio.h>

void printContent(const char *content) {
    printf("%s\n", content);
}

int main() {
    char str1[1000];
    FILE *fp = fopen("file.txt", "r");
    if (fp == NULL) {
        perror("Error opening file");
        return 1;
    }

    char c;
    int len = 0;

    // Use a while condition to handle EOF and length check
    while ((c = getc(fp)) != EOF && len < 1000) {
        str1[len++] = c;
    }
    str1[len] = '\0';

    fclose(fp);

    // Define a function pointer and assign it to printContent
    void (*printPtr)(const char *) = printContent;

    // Use the function pointer to print the content
    printPtr(str1);

    return 0;
}
