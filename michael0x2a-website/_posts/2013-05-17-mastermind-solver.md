---
layout: default
title: "Mastermind Solver"
date: 2013-05-17
tags: code javascript project webapp writeup
---

Link: [http://projects.michael0x2a.com/mastermind_solver](http://projects.michael0x2a.com/mastermind_solver)

Github repo: [http://github.com/michael0x2a/mastermind-solver](http://github.com/michael0x2a/mastermind-solver)

## Background and Motivation ##

This is a webapp which will solve [Mastermind][1] games. I made it because it seemed like both an interesting technical challenge to build a reliable algorithm to solve games, and an interesting design challenge to create a neat Javascript UI for it.

I  have two versions available: a Python console version, and a webapp one written in HTML5 and Javascript (see link above).

  [1]: http://en.wikipedia.org/wiki/Mastermind_(game)

## How it works ##

The algorithm looks like this, in pseudo-code

1. Get a pool of all possible answers
2. Offer an initial guess
2. Get feedback from the user (number of red and white pegs)
3. Filter the pool. Compare each possibility to the initial guess. If the number of red and white pegs is different from the user feedback, discard that possibility since it cannot possibly be the answer.
4. Iterate through each remaining possibility, and see how many possibilities it would remove through the process outlined in step 3 if it were the next guess. Pick the possibility which eliminates the most amount of possibilities.
5. Repeat from step 2.

The UI is written in pure HTML, CSS, and Javascript, using the [underscore.js](http://underscorejs.org) and [jQuery](http://jquery.org) libraries. I also used web workers since the algorithm was computationally expensive and was freezing the browser given large initial colors or secret code length.