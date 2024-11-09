#include <stdio.h>

int main() {
    char str1[1000]; // Changed to a character array instead of an array of pointers
    FILE *fp = fopen("file.txt", "r"); // Corrected `File` to `FILE`
    if (fp == NULL) { // Check if file opened successfully
        perror("Error opening file");
        return 1;
    }

    char c;
    int len = 0;
    while (1) {
        c = getc(fp);
        if (c == EOF) break;
        str1[len++] = c;
        if (len >= 1000) break;
    }
    str1[len] = '\0'; // Null-terminate the string

    fclose(fp); // Close the file
    printf("%s\n", str1); // Corrected quotation marks

    return 0;
}