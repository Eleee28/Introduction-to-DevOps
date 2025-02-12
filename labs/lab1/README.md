# Lab 1 - Bash Programming

This lab consists on writting a number of simple scripts to help you build a basic understanding of how Bash can be used as a programming language.

## Exercise 1 - Hello World
Implement a Bash script that prints hello world.

## Exercise 2 - Greeting the User
Implement a Bash script that allows the user to enter their name and greets th with a message (Hello <name>).

> [!NOTE]
>
> Use the [read](https://phoenixnap.com/kb/bash-read) command to read from stdin

## Exercise 3 - Euclid's Algorithm
Implement Euclid's algorithm in Bash. Allow the user to enter two numbers and compute the greatest common denominator (GCD).

## Exercise 4 - Euclid's Algorithm Revisited
Change the Euclid script to read the two input numbers as command-line arguments, rather than reading them from stdin.

## Exercise 5 - Sum
Write a script to read any set of numbers as command-line arguments and sum them together.

Running ``./script.sh 1 2 3 4`` should print ``10``.

> [!NOTE]
>
> Use the shift command to move the list of input parameters left by 1.
> 
> Use of [$#](https://stackoverflow.com/questions/4423306/how-do-i-find-the-number-of-arguments-passed-to-a-bash-script) for number of arguments.
>
> [More](https://codedamn.com/news/linux/how-to-use-command-line-arguments-in-bash-scripts) information on command line arguments.

## Exercise 6 - Largest Number
Write a script to read any set of numbers as command-line arguments and print the largest number.

Running ``./script.sh 1 2 3 4`` should print ``4``.

## Exercise 7 - Tree
Write a script that takes a single number as a command-line argument and print a Christmas tree pattern with the given number of rows.

For example: 
~~~ Bash
$> ./script.sh 4
   *   
  ***  
 ***** 
*******
   |
$> ./script.sh 3
  *  
 ***
*****
  |
~~~

## Useful information
- Let command: [link](https://phoenixnap.com/kb/bash-let)
