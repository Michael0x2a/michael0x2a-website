---
layout: post
title: "Observations on teaching CS"
date: 2014-12-01
parent_id: blog
page_id: teaching-cs
---

For the past three quarters (excluding summer quarter), I've been a teaching assistant for [CSE 142][cse142] and [CSE 143][cse143], the introductory programming courses here at the [University of Washington][uw].

CSE 142 is primarily meant for students completely new to programming and teaches basic Java (control structures, methods, basic OOP, etc). CSE 143 is the continuation of the course, and focuses more on teaching data structures and algorithms (different kinds of lists, stacks and queues, trees, recursion, etc).

Our courses are set up so that a lecturer teaches to all 300-400 students in a given course for an hour-long session on Mondays, Wednesdays, and Fridays. On Tuesdays and Thursdays, we TAs teach a smaller group of 20-25 students where we review material from lecture and work through practice problems. We call these Tuesday/Thursday classes "sections", for whatever reason.

Besides teaching section, TAs are responsible for grading all our students' homework and taking 2-hour shifts at the "Introductory Programming Lab" (IPL), where we work one-on-one with students who are confused and need help with homework or practice problems.

In a nutshell, I spend quite a good chunk of my week looking after and helping students with CS. In the course of the past three quarters, I've observed the following things about teaching CS.

## Bottlenecks in learning

At the beginning of the course, almost everybody does well for their first and second homework assignments. The very first things we teach are println statements and basic methods, so the emphasis of the first assignment is on problem decomposition, which most people seem to understand more or less well. 

However, as the quarter progresses, I've noticed that we seem to lose a chunk of our class whenever we introduce certain concepts. I've started calling these concepts "bottlenecks" -- concepts which, for whatever reason, are fairly difficult to grasp for a certain portion of our students.

1.  **Indentation:**

    The first thing some students have difficulty with is how to correctly indent code. In fairness, this might be our fault -- we tend to implicitly assume that students are able to deduce how indentation works from looking at the many code samples we provide, but that may actually not be the case.
    
    This ties in with another point of confusion -- many students don't seem to understand how exactly the `{}` curly brackets group together code. Some students also don't seem to be aware of the tab key, nor group shifting and unshifting (highlight + tab or highlight + shift + tab) -- they manually use the space bar to tab everything. Part of the reason for this might be that some students are international, and aren't accustomed to having the tab key on their keyboard. I'm speculating though.
    
    I imagine that this can be somewhat discouraging to students -- from the very start, we're indenting according to rules they don't fully understand, which makes programming feel even more mysterious then it actually is. 
    
    The only thing we can really do is just be more explicit, I suppose.
    
2.  **Variables:**

    The second bottleneck appears to be variables. Students tend to understand the basic concepts of variables, but they almost always seem to trip up over something like the following:
    
    ```java
    int a = 5;
    int b = 10;
    int c = b;
    
    a = a + 1;   // value of a?
    b = b - 1;   // value of b?
    c = c + a;   // value of c?
    ```
        
    They can mostly correctly see that the values of `a` and `b` are 6 and 9 respectively, but make the mistake of thinking that `c` is equal to 15, not 16.
    
    The line `int c = b;` trips them up -- many students are used to thinking in terms of math, and assume that `=` means equality -- they assume that `c` and `b` are equal to each other so a change in one will mean a change in the other when in reality, `=` means "assignment" (at least in Java).
    
    For the same reason, the line `a = a + 1` tends to weird out some students since it makes no sense from a mathematical perspective (unless `a` is infinity or something).

3.  **Parameters and scope**

    
    



  [cse142]: http://www.cs.washington.edu/142
  [cse143]: http://www.cs.washington.edu/143
  [uw]: http://www.washington.edu