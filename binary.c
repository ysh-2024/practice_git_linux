#include <stdio.h>
#include "binary.h"

void binary(int value) {
    int started = 0;
    for (int i = 31; i >= 0; i--) {
        int bit = (value >> i) & 1;
        if (bit == 1) started = 1;
        if (started) printf("%d", bit);
    }
    if (!started) printf("0");
    printf("\n");
}
