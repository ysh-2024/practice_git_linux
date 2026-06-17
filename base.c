#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "binary.h"

int main(int argc, char *const *argv) {
    int flag_x = 0, flag_o = 0, flag_b = 0; 
    int c;
    int i;

    while ((c = getopt(argc, argv, "xob")) != -1) { 
        switch (c) {
            case 'x':
                flag_x = 1;
                break;
            case 'o':
                flag_o = 1;
                break;
            case 'b':
                flag_b = 1;
                break;
            case '?':
                printf("Unknown flag\n");
                return 1;
        }
    }

    i = optind; 

    while (i < argc) { 
        int val = atoi(argv[i]);
        printf("--- 입력값: %d ---\n", val);
        
        if (flag_x) {
            printf("16진수: %x\n", val);
        }
        if (flag_o) {
            printf("8진수: %o\n", val);
        }
        if (flag_b) {
            printf("2진수: ");
            binary(val);
        }
        i++;
    }

    return 0;
}
