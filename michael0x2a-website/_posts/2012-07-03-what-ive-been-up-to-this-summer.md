---
layout: default
title:  "What I've been up to this summer"
date:   2012-09-03
tags: code microsoft personal summary writeup
---

It's been a while since I've updated, but just for posterity, here's a summary of everything that happened to me this summer.

1.  I got a girlfriend.
2.  I got an internship at Microsoft. Specifically:
3.  I got a free Xbox and Kinect, along with miscellaneous swag from Microsoft.
4.  I'm about to buy a new laptop, using the money I got from my internship.

Overall, not a bad summer.

## Microsoft Internship ##

My internship at Microsoft was really, really, fun. I was invited to interview sometime around spring break, which turned out to be surprisingly much more relaxed then I anticipated. I was expecting that I had to do some sort of intense coding exercises, along with the standard interview questions ("What do you feel is your greatest strength? Your greatest weakness?"), but instead, ended up chatting with my interviewers about some of the projects I worked on and featured on my portfolio, and jotting down an implementation of bubble sort. It was actually pretty relaxing, although I later discovered that some other interns had much harder interviews, depending which interviewer they had.

Ultimately, there were about 20-21 interns selected from a pool of approximately 300 (or so I'm told). The gender ratio was roughly equal, and the level of experience the various interns had with coding varied a bit more than I expected. I also met a fellow calculator programmer, which was pretty exciting.

Ultimately, I was placed at Microsoft Research (MSR), specifically under the Speech Understanding group, along with another intern, Forrest. As it turned out, my mentor, [Xiaodong He](http://research.microsoft.com/en-us/people/xiaohe/), was also one of my interviewers.

I worked on a variety of projects. The first was taking (anonymized) search data from Bing, and manually going through each user session and grouping together related search queries. Ultimately, this data would be used to train algorithms so they could more effectively sort through various queries. I came away somewhat disenchanted by the types of searches people made. Most of them were either about celebrities or vacations, and a large number of people actually searched for "facebook.com", "google.com", and even in a few cases, "bing.com".

Some later projects I worked on were more fascinating. My main project was writing a program that would convert a formalized, context-free subset of English questions or queries into SQL. The project was very educational for me &ndash; I didn't even know SQL when I started my internship, so it was an interesting experience learning it as I went. The project overall was difficult for me &ndash; I thought it would be fairly easy to create a parser for the formalized English, given that it's a context-free grammar, which means I should theoretically be able to deterministically convert any sentence into SQL, but the English turned out to be incredibly convoluted and twisted, making it hard to pin down a working set of grammar rules.

Some other facts about Microsoft:

*   Free drinks!
*   The food in the cafeterias is delicious.
*   Microsoft holds *a lot* of events and lectures.
*   I really like having a semi-private room (normal employees have a private room with an awesome sliding door, and interns are placed in groups of four and share a larger room).
*   Tourists actually visit Microsoft. I found this really weird, since most of Microsoft consists of people staring at screens and occasionally typing, but on a few occasions, the few public buildings were swarming with tourists (mostly from Asia) along with a tour bus or two idling in the parking lot.
*   Microsoft has a pretty extensive trail system designed for jogging winding around the campus. 

## Miscellany ##

Some other random stuff I did:

*   I'm starting to break my habit of placing two spaces after periods in favor of just one. As I discovered, using two spaces is becoming more and more pointless &ndash; word processors will automatically place larger spaces after periods, and web browsers will treat multiple spaces in html files as a single one anyways.
*   The reputation for my account on [StackOverflow](http://stackoverflow.com/users/646543/michael0x2a) broke 1k! (Stack Overflow is a question-and-answer website dedicated towards programming questions, where you can accumulate reputation points for asking good questions and writing good answers). It's a small milestone, relatively speaking, but it still made my day.
*   I made a [Linkedin](http://linkedin.com/in/michael0x2a) and a [careers.stackoverflow](http://careers.stackoverflow.com/michael0x2a) profile.
*   I helped remake our robotics club website. It's definitely more robust now then the previous version.
*   I started on my college essays, and finally, after nearly a year of deliberating, managed to construct a list of about 10 colleges to consider.

## Projects ##

Most of my attention was focused towards my internship (and my girlfriend), so I didn't work on any really large projects. Some ones I did do:

### Xbox controller
I bought a wired Xbox controller, and learned how to programatically access it. I attempted coding a short program so I could use it as a mouse, but had difficulty getting the joystick to move the pointer at precisely the right precision. It was either too slow, or too fast, and I could never get any sort of shaping function to work just right.

### Cellular automata

I was digging through some of my old papers, and encountered a sketch I made during math class. It basically looked like this:

![simple sketch]({% asset_path semifractal/simple.png %})

Essentially, the algorithm looks like the following, rotated a few times to form a square:

![simple triangle]({% asset_path semifractal/simple-triangle.png %})

Each row grows by two squares. The squares in each row is determined by the three squares above it (and to the diagonal). If the number of black squares above is odd, the current square is colored black.

Interestingly, as I discovered just recently, the algorithm I used is an example of [1-d cellular automata](http://en.wikipedia.org/wiki/Elementary_cellular_automaton), specifically rule 150. 
And of course, I had to write a program to generate a really big one:

![standard]({% asset_path semifractal/standard.png %})

Then, I got bored, and started introducing an element of randomness into my generator:

![beam]({% asset_path semifractal/beam.png %})

![waver]({% asset_path semifractal/waver.png %})

![windmill]({% asset_path semifractal/windmill.png %})

![blade]({% asset_path semifractal/blade.png %})

![static]({% asset_path semifractal/static.png %})

The code isn't very clean, or performant, but can be found on [github](http://github.com/michael0x2a/semifractal).