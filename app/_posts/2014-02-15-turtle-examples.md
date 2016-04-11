---
layout: post
title: "Turtle examples"
date: 2014-02-15
updated: 2016-04-11
parent_id: blog
page_id: turtle-examples
---

## Introduction

My very first introduction to programming was in middle school during the first week of class. My teacher explained that we'd be learning a programming language called "Logo", which would let you control an imaginary "turtle" with a pen attached to its tail to draw pictures and packets.

We were then given a thick packet of examples, and was set free to experiment and do whatever we liked as long as we completed a certain number of exercises each day.

I'm not sure how much I ended up actually learning, since I was mostly blindly copying and tweaking code, but I do remember to this day having a huge amount of fun playing with Logo.

So naturally, I was very pleased to discover that Python, one of my favorite programming languages, came built-in with a module named "[turtle][turtle-doc]" that was very similar to Logo. This document is an attempt to mirror some of the spirit of the original packet of examples that first introduced me to programming.

Note: I started this document a year or so ago, but never actually got around to completing or updating it beyond a few examples. Over the course of the next few months, I'll be sporadically adding more examples as I find time.

---

## Example 1: Draw a line

One of the simplest things you can do using the turtle module is to draw a line. There are always four steps you need to do in order to use the turtle module:

1.  **Import** the turtle module. If we skip this step, there'll be no turtle to control.
2.  **Create** a turtle to control.
3.  **Draw** things. Do stuff. This will also automatically create the screen.
4.  Run `turtle.done()`. (**NOT** `bob.done()`!)

Notice that `turtle.done()` will pause the program. You'll need to close the window in order to continue. 

{% turtle line %}
```python
# Step 1: Make all the "turtle" commands available to us.
import turtle

# Step 2: Create a new turtle. We'll call it "bob"
bob = turtle.Turtle()

# Step 3: Move in the direction Bob's facing for 50 pixels
bob.forward(50)

# Step 4: We're done!
turtle.done()
```
{% endturtle %}


---

## Example 2: Drawing a square.

Lines are boring. We can rotate the turtle in order to draw more interesting figures.

{% turtle square %}
```python
import turtle

silly = turtle.Turtle()

silly.forward(50)
silly.right(90)     # Rotate clockwise by 90 degrees

silly.forward(50)
silly.right(90)

silly.forward(50)
silly.right(90)

silly.forward(50)
silly.right(90)

turtle.done()
```
{% endturtle %}

### Additional notes 

The two turtle commands we've learned so far are `forward(x)`, which moves the turtle forward in the direction its facing by `x` number of pixels, and `right(d)`, which makes it turn clockwise by `d` number of degrees. 

Two additional key commands are `backward(x)`, which makes the turtle move back, and `left(d)`, which makes the turtle turn **counterclockwise** by `d` degrees. 

Exercise: try modifying writing code to draw a square using only the `backward` and `left` commands. 

---

## Example 3: Drawing a square (using loops)

Do you know what else was boring? The fact that I had to copy-paste the same exact lines of code 4 times in a row. Wouldn't it be great if we could just tell Python to repeat the code for us?

{% turtle square %}
```python
import turtle 

smart = turtle.Turtle()

# Loop 4 times. Everything I want to repeat is 
# *indented* by four spaces.
for i in range(4):
    smart.forward(50)
    smart.right(90)
    
# This isn't indented, so we aren't repeating it.
turtle.done()
```
{% endturtle %}

### Additional notes

What do you think will happen if you run the following code? 

```python
print("start test")

for i in range(4):
    print(i)
    print("test")
    
print("end test 1")

for banana in range(20):
    print(banana)
    print(banana * 2)
```

---

## Example 4: Drawing a star 

{% turtle star %}
```python
import turtle 

star = turtle.Turtle()

for i in range(50):
    star.forward(50)
    star.right(144)
    
turtle.done()
```
{% endturtle %}
    
### Additional notes 

Why did I pick the number "144"? Why is that significant? What happens if you try changing a different number?


---


## Example 5: Spiraling star 

{% turtle spiraling-star %}
```python
import turtle 

spiral = turtle.Turtle()

for i in range(20):
    spiral.forward(i * 10)
    spiral.right(144)
    
turtle.done()
```
{% endturtle %}

### Additional notes 

Notice that now I'm moving the turtle forward by a different amount each time. What happens if instead of multiplying `i` by 10, I multiply it against itself? What if I do `spiral.forward(i * i)` instead?


---

## Example 6: Changing line color 

{% turtle colors %}
```python
import turtle 

painter = turtle.Turtle()

painter.pencolor("blue")

for i in range(50):
    painter.forward(50)
    painter.left(123) # Let's go counterclockwise this time 
    
painter.pencolor("red")
for i in range(50):
    painter.forward(100)
    painter.left(123)
    
turtle.done()
```
{% endturtle %}

### Additional notes 

What if you want different colors? You could always try and guess what colors the turtle module can support, but if you want to be precise, you can use this [colorpicker](http://www.colorpicker.com/) instead.

At the top of the screen, the website will provide a '#' mark and a sequence of 6 letters or numbers that represents the color. The turtle module will accept colors in this format.

```python
import turtle 

painter2 = turtle.Turtle()

painter2.pencolor("#32D486")
painter2.forward(30)

painter2.pencolor("#D6305F")
painter2.forward(30)
```

Make sure to always include the `#` character before including those 6 characters. 


---

## Example 6: Variables

One of the powerful things about computers and programming is that they can do work humans would find boring. For example, what if we wanted to draw a hexagon (shape with 6 sides)? By how many degrees should we turn each time? What if we want a shape with 15 sides?

Rather then computing the number each time ourselves, we can instead define **variables** and have Python use a formula to find out for us.

Here, we've set the number of sides to be 6, and the side length to be 70. What happens if we change the variables?

{% turtle polygon %}
```python 
import turtle 

polygon = turtle.Turtle()

num_sides = 6
side_length = 70
angle = 360.0 / num_sides 

for i in range(num_sides):
    polygon.forward(side_length)
    polygon.right(angle)
    
turtle.done()
```
{% endturtle %}

### Additional notes

Something that confuses many beginners is the `=` symbol. In Math, whenever we see `A = B`, we know that A and B _must_ be identical -- in Math, `=` means "equality".

However, `=` means something a little different in programming. When we see `A = B`, it means that whatever `A` is will now be set equal to `B` -- in programming, `=` means "assignment".

So, if we see the following code:

```python
my_variable = 3 + 4 
print(my_variable)

my_variable = my_variable + 5
print(my_variable)
```

...the output will be `7` and `12`. We always computer whatever is on the right side, then change the variable on the left side to that value.


---

## Example 7: Nested loops 

This will make a matrix of dots 5 dots wide and 7 dots high. Try experimenting with the variables at the top to change the number of dots and the distance between them.

The for loop on the very inside (`for i in range(width):`) draws a single line of dots. The code then causes the turtle to move back, then move down a row.

{% turtle dots %}
```python
import turtle 

seurat = turtle.Turtle()

dot_distance = 25
width = 5
height = 7

seurat.penup()

for y in range(height):
    for i in range(width):
        seurat.dot()
        seurat.forward(dot_distance)
    seurat.backward(dot_distance * width)
    seurat.right(90)
    seurat.forward(dot_distance)
    seurat.left(90)
    
turtle.done()
```
{% endturtle %}


---

## Example 8: Jumping around and changing speed 

`turtle.setposition(x, y)` will set the turtle's position to the coordinates you plug in. (0, 0) is located at the center of the screen -- where the turtle first started. Note that you need to make sure the turtle's pen is up, otherwise it'll draw a line back to that.

You can change the speed of the turtle by doing `turtle.speed(number)`. If you set the speed to 10, the turtle will go really fast. If you set the speed to 1, the turtle will go really slow (which is useful for trying to understand how some complicated thing is being drawn). If you set the speed to zero, however, the turtle will go at warpspeed and will draw as fast as it can.

The speed cannot be lesser then 0 or greater then 10.

{% turtle twist %}
```python
import turtle 

ninja = turtle.Turtle()

ninja.speed(10)

for i in range(180):
    ninja.forward(100)
    ninja.right(30)
    ninja.forward(20)
    ninja.left(60)
    ninja.forward(50)
    ninja.right(30)
    
    ninja.penup()
    ninja.setposition(0, 0)
    ninja.pendown()
    
    ninja.right(2)
    
turtle.done()
```
{% endturtle %}

  [turtle-doc]: https://docs.python.org/2/library/turtle.html
