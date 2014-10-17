---
layout: post
title: "Website Redesign"
subtitle: "AKA: How to set up Yeoman/Grunt/Jekyll/Bootstrap"
parent_id: blog
page_id: website-redesign
---

## Background 

I've recently updated my website!

Over the last week or so, I've ended up essentially redesigning my website from scratch. My previous website was a very basic WordPress installation, with a few extra plugins installed. However, over the past few months, I've been growing increasingly dissatisfied with my blog for the following reasons:

1.  I wanted to be able to version control everything without the hassle of having to synch with a database.
2.  I prefer developing locally and deploying, rather then writing my content on some admin interface.
3.  My webhost doesn't play very nicely with WordPress. This is more of a problem with my webhost then it is with WordPress, but I was getting tired of constantly messing around with file permissions and various settings to perform routine maintenance.
4.  I wanted to complete control. This is my personal website -- I wanted to be able to control, tweak, and extend the website however I want without anything much getting in my way.
    
For these reasons, I decided to rebuild my website from the ground up to scratch those itches. Specifically, I decided to base my website on top of [Jekyll][jekyll], a static site generator. I used [Bootstrap][bootstrap] to help with the CSS and used [Grunt][grunt] and [Bower][bower] to automate my build system and manage my dependencies.

On the whole, I'm pretty satisfied with my setup. Jekyll is delightfully minimal in comparison to WordPress, and lets me easily create almost anything without being too restrictive. I've already had some prior experience using Jekyll and Bootstrap, so the learning curve was relatively low. Grunt was a delight to use -- simply typing `grunt serve` or `grunt build` on the command line would execute a whole host of useful tasks in perfect synchrony, ranging from CSS and Javascript linting, minification, file revving, and more. 

That being said, it was a ludicrously finicky process actually *setting up* all these different tech stacks. For future reference, I've decided to document everything I've learned here.

## Initial setup (Yeoman)

I initially based my project by using [Yeoman][yeoman] with the [jekyllrb][jekyllrb] generator. Yeoman is a wonderful program that will automatically generate a seed project for a large variety of 

## Jekyll + Windows

One unfortunate thing I discovered is that for whatever reason, Jekyll + Ruby tends to be a bit flaky on Windows. This problem was compounded by the fact that I know next to nothing about Ruby.

In particular, Jekyll 2.x will fail to watch for changes and serve files when using Ruby 1.9.x on Windows. The [workaround](https://github.com/jekyll/jekyll/issues/2529), thankfully, is simple -- upgrade to Ruby 2.





  [jekyll]: 
  [bootstrap]: 
  [grunt]:
  [bower]:
  [yeoman]: 
  [jekyllrb]: https://github.com/robwierzbowski/generator-jekyllrb
  
