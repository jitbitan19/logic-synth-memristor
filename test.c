#include <stdio.h>
void f(int i)
{
    int j;
    for (j = 0; j < 16; j++)
    {
        if (i & (0x8000 >> j))
            printf("1");
        else
            printf("0");
    }
}
int main(int argc, char *argv[])
{
    printf("Program okay!, %d\n", argc);
    while (--argc)
    {
        printf("%s \n", ++argv[argc]);
    }
}