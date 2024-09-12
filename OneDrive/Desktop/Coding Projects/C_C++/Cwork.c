#include <stdio.h>
#include <stdlib.h>

char randchar() {
    char letter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[rand() % 26];
    printf("%c\n", letter);
    return letter;
}

int main() {
    randchar();
    return 0;
}