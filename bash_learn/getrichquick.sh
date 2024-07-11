#!/bin/bash

echo "What is your name?"

read name

echo "How old are you?"

read age

echo "Hello $name, you are $age years old"

echo "You're gonna be rich when you're $((( $RANDOM % 10 ) + $age))"
