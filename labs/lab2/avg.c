#include <stdio.h>

int main() {
    int numbers[] = { 10, 20, 30, 40, 50 };
    int sum = 0;
    int len = sizeof(numbers) / sizeof(numbers[0]);

    int max = numbers[0], min = numbers[0];

    for (int i = 0; i < len; i++) {
        if (max < numbers[i]) max = numbers[i];
        if (min > numbers[i]) max = numbers[i];

        sum += numbers[i];
    }

    float avg = (float)sum / len;

    printf("The minimum is: %d\n", min);
    printf("The maximum is: %d\n", max);
    printf("The average is: %.2f\n", avg);

    return 0;
}