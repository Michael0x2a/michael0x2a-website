---
layout: post
title: "Lisp for Touchdevelop"
date: 2013-07-29
parent_id: blog
page_id: lisp-for-touchdevelop
---

## Summary

During my summer internship at Microsoft Research, I had the opportunity to participate in an intern-only hackathon. The competition was pretty open-ended: the only constraints were that it had to be completely our own work, and that it had to be developed using [Touchdevelop][td], a mobile-oriented programming language developed at Microsoft Research. I decided to write a Lisp interpreter using Touchdevelop. You can [try it out][lft] online.

Despite the fact that nearly all of my competitors were Ph.D interns, I still won first place!

## Motivation

[Touchdevelop](http://touchdevelop.com) is a statically-typed, imperative language specifically designed, optimized, and calibrated for development on touch-devices. It's obvious that the development team went through a lot of effort to make the coding process flow smoothly, beautifully, and intuitively for people using touch devices, and especially for beginners new to programming.

So naturally, my first instinct was to make an app that does the exact opposite in every way possible :)

## About

[**Lisp for Touchdevelop**][lft] is a version of the [lisp programming language][lisp] implemented using the Touchdevelop programming language. Specifically, this variant is loosely based on Scheme.

This app comes in two parts -- a library to parse and execute lisp code, and a code editor to interactively type and execute lisp (REPL). By default, running the app will bring up the code editor.

I had time to implement a basic, but relatively complete set of features. It supports numbers, math, bools, comparisons, strings, and lists, and also has support for if-statements, variable assignment, first-class functions (complete with scoping!), quasiquotation, and eval.

It also has basic syntax and error checking, a basic save-and-load system, and comes bundled with a few sample programs and a short manual/tutorial thing.

However, due to a combination of time-constraints and my own ignorance, I was unable to implement call-cc, garbage collection, macros, objects, additional data structures (like hashmaps), and tail-call optimization.

(However, I might take a stab at implementing these features at some later date if I have the time and inclination)


  [td]: http://touchdevelop.com
  [lft]: http://touchdevelop.com/users/michael0x2a/lispfortouchdevelop
  [lisp]: https://en.wikipedia.org/wiki/Lisp_%28programming_language%29