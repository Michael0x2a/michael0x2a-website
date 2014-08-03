---
layout: post
title: "Croquette and Axe Interpreter"
date: 2012-03-11
parent_id: blog
page_id: croquette-and-axe-interpreter
---

## Introduction

I started programming on TI-84 graphing calculators, ranging from games to math programs. As a result, my first major projects when I started coding on computers were all development tools to help me while I coded. 

## Croquette

One of my first serious projects on the computer was a utility to convert programs on the calculator to text files on the computer. [Repository here](http://code.google.com/p/croquette/)

Calculator code, whether it's the standard interpreted BASIC-style version, or the source code for any [compiled](http://axe.omnimaga.org) languages, are expressed in a somewhat proprietary file-format in hex code.  It wasn't terribly difficult -- once you removed any of the metadata from the start and end of the file, it was a simple matter of finding and replacing hex tokens with strings.  

However, there were three parts that were difficult:

1.  Some tokens were two bytes long, others were only a single byte
2.  I wanted to add properly indent the code
3.  I wanted to be able to convert text back into tokens

Problem 1 turned out to be  easy -- as it turned out, two-byte tokens started with a unique token, so it was a simple matter of grabbing a token, seeing if it was in my list of single-byte tokens, and if not, grabbing the next one to make a two-byte token (the data was also little-endian, which helped).

Properly indenting was more difficult.  TI-Basic had odd indentation rules.  For example, 

<pre title="Odd indentation">
0 -> A
If A
    Disp 3  // Wouldn't be executed
Disp 4      // Would be executed
</pre>

Single 'If' statements would only include the immediate line following it.  In order to have an 'actual' If statement, you would need to do...

<pre title="If-then">
0 -> A
If A
Then
    Disp 3
    Disp 4
End
</pre>

...add a 'Then' statement.

The last goal was the hardest.  At the time, I had neither learned about parsers nor regex, so was literally grabbing the first 20 or so characters, comparing them, removing the last character if it couldn't find a match and trying again...   It wasn't very efficient, and didn't work for some corner cases.

I started working on this project in about 2010, but it's been dormant for a long time.  Somebody did express interest in making a GUI frontend for what I wrote, which he did, but it remained only minimally functional. 

## Axe Interpreter

Axe is a programming language for the TI-83/84 brand of calculators.  It's a fairly unique language -- everything is global, letters are single variables only, and it's very low-level -- you need a firm grasp of pointers to be able to use anything like lists.  Nevertheless, I still found it a really instructive language to learn in.

The calculator uses a specific file format to store its data -- I wrote a converter for it in the past, but I wanted to try my hand at making an interpreter on the computer to help me and others more easily develop Axe programs.  

My first design created an abstract syntax tree, and ran through it, executing as it went.  The fact that all variables were global helped simplify the design -- I had to create only a single memory bank and manipulate it (Axe doesn't really have a stack, only a heap).  I managed to implement some basic graphical features and was able to run some simple games:

<iframe width="640" height="360" src="http://www.youtube.com/embed/xscgq5-lwkw" frameborder="0" allowfullscreen></iframe>

However, what tripped me up was the fact that Axe had `goto` statements.  I couldn't find an easy way to arbitrarily find and jump to positions in my,  AST (which was just a large collection of nested lists).  I asked a [question](http://stackoverflow.com/questions/8642355/implementing-goto-in-an-ast) on StackOverflow, but the internet agreed that it would be difficult (although it could be done by using exceptions).

My latest attempt feels a bit more convoluted.  It first converts it to an AST and runs through it, but without executing anything.  Instead, it takes whatever relevant data it needs and appends a closure to the list.  Once the program has run through the entire AST, it executes each function in the list.  Because the functions are in a list, it can change a counter, allowing the program to jump to arbitrary points in the program.

My latest version is on [Github](http://github.com/michael0x2a/axe-interpreter).  It currently isn't very functional.  The [project thread](http://www.omnimaga.org/index.php?PHPSESSID=qa1ao18tlggnf5hpgt3b8pf5d3&topic=11957.0) is hosted externally.

I started working on the project in around late 2011, and finished about a year or two later.