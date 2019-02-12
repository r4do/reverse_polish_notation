# CLI reverse Polish notation calculator

## Description

Reverse Polish Notation is a way of expressing arithmetic expressions that avoids the use of brackets to define priorities for evaluation of operators. In ordinary notation, one might write

    (3 + 5) * (7 – 2)

and the brackets tell us that we have to add 3 to 5, then subtract 2 from 7, and multiply the two results together. In RPN, the numbers and operators are listed one after another, and an operator always acts on the most recent numbers in the list. The numbers can be thought of as forming a stack, like a pile of plates. The most recent number goes on the top of the stack. An operator takes the appropriate number of arguments from the top of the stack and replaces them by the result of the operation.

In this notation the above expression would be

    3 5 + 7 2 - *

Reading from left to right, this is interpreted as follows:

* Push 3 onto the stack.
* Push 5 onto the stack. Reading from the top, the stack now contains (5, 3).
* Apply the + operation: take the top two numbers off the stack, add them together, and put the result back on the stack. The stack now contains just the number 8.
* Push 7 onto the stack.
* Push 2 onto the stack. It now contains (2, 7, 8).
* Apply the – operation: take the top two numbers off the stack, subtract the top one from the one below, and put the result back on the stack. The stack now contains (5, 8).
* Apply the * operation: take the top two numbers off the stack, multiply them together, and put the result back on the stack. The stack now contains just the number 40.

## Usage

Start from command-line

    $ ruby rpn_calc.rb

Just calculate, with any format:

    > 5 
    5
    > 8
    8
    > +
    13

---
    > 5 8 +
    13.0
    > 13 -
    0.0

---
    > -3
    -3.0
    > -2
    -2.0
    > *
    6.0
    > 5
    5.0
    > +
    11.0

---
    > 15 7 1 1 + - / 3 * 2 1 1 + + -
    5.0


## Restrictions

Calculator only allows numbers in float format (like 3 or 3.0) and standard arithmetic operations signs (+ - / *). With any incorrect input, operation will not be performed at all.