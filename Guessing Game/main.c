#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int randomInRange(int min, int max)
 {
    while(min>max)
    {
        printf("Min number can't be more than max number, try again.\n");
        printf("Enter min and max number:\n");
        scanf("%d %d",min,max);
    }
    return (rand() % (max - min + 1)) + min;
}

int main()
{
    int min, max;
    char diff;
    printf("Welcome To Our Guessing Game !!!!!\n**********************************\n");
    printf("Please enter the difficulty you want, press\nE for Easy (6 Attempts)\nM for Medium (4 Attempts)\nH for Hard (2 Attempts)\n");
    scanf("%c",&diff);
    while (diff != 'E' && diff != 'e' && diff != 'M' && diff != 'm' && diff != 'H' && diff != 'h')
    {
    printf("Wrong choice, please enter a choice from the given options.\n");
    scanf(" %c", &diff); // Add a space before %c to ignore leftover newline
    }



    printf("Enter Min and Max number:\n");
    scanf("%d %d",&min,&max);


    srand(time(NULL));

    int randomNum = randomInRange(min, max);

    if(diff=='E' || diff=='e')
    {
        printf("You got 6 attempts\n");
        for(int i=0 ; i<6 ; i++)
        {
            int guess;
            printf("Guess no. %d:\n",i+1);
            scanf("%d",&guess);
            if(guess==randomNum)
            {
                printf("You guessed it right good job!!! ;) \n");
                return -1;
            }
            else if(guess!=randomNum && i<5)
            {
                printf("Wrong guess ,Try again!\n");
            }
            printf("Left attempts : %d ,",5-i);
            if(guess<randomNum)
            {
                printf(" Number is higher!\n");
            }
            if(guess>randomNum)
            {
                printf(" Number is lower!\n");
            }
        }
        printf("You Lost! , GAME OVER :( \n");
        printf("The number was : %d \n",randomNum );
    }

    if(diff=='M' || diff=='m')
    {
        printf("You got 4 attempts\n");
        for(int i=0 ; i<4 ; i++)
        {
            int guess;
            printf("Guess no. %d: \n",i+1);
            scanf("%d",&guess);
            if(guess==randomNum)
            {
                printf("You guessed it right good job!!! ;) \n");
                return -1;
            }
            else if(guess!=randomNum && i<3)
            {
                printf("Wrong guess ,Try again!\n");
            }
            printf("Left attempts : %d ,",3-i);

            if(guess<randomNum)
            {
                printf(" Number is higher!\n");
            }
            if(guess>randomNum)
            {
                printf(" Number is lower!\n");
            }
        }
        printf("You Lost! , GAME OVER :( \n");
        printf("The number was : %d \n",randomNum );
    }

    if(diff=='H' || diff=='h')
    {
        printf("You got 2 attempts\n");
        for(int i=0 ; i<2 ; i++)
        {
            int guess;
            printf("Guess no. %d: \n",i+1);
            scanf("%d",&guess);
            if(guess==randomNum)
            {
                printf("You guessed it right good job!!! ;) \n");
                return -1;

            }
            else if(guess!=randomNum && i<1)
            {
                printf("Wrong guess ,Try again!\n");
            }
            printf("Left attempts : %d ,",1-i);

            if(guess<randomNum)
            {
                printf(" Number is higher!\n");
            }
            if(guess>randomNum)
            {
                printf(" Number is lower!\n");
            }
        }
        printf("You Lost! , GAME OVER :( \n");
        printf("The number was : %d\n",randomNum );

    }

    return 0;
}
