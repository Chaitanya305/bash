#!/bin/bash

#this is for task to show how to do comment in bash script 

#below is task2 

echo "hi good morning its Day1 task"

#decleare variable and assign value to it

variable1="Chaitanya"
variable2="Golhar"

echo "Hi my name is $variable1 $variable2"          

#Create a bash script that takes two variables (numbers) as input and prints their sum using those variables.

a=10
b=20

echo "sum of a and b is $(expr $a + $b)"

#create a bash script that utilizes wildcards to list all the files with a specific extension in a directory.

echo "all .sh file in scripts dir are as follow"

ls -lrt ~/scripts/*.sh

#create a bash script that utilizes at least three different built-in variables to display relevant information.

echo "hostname of system is :- $HOSTNAME"
echo "home path is :- $HOME"
echo "current directory is :- $PWD"
