---
layout: post
title: "Website Redesign"
subtitle: "Yeoman + Grunt + Jekyll + Bootstrap"
parent_id: blog
page_id: website-redesign
math: true
draft: true
---

I've recently updated my website!

Over the last week or so, I've ended up essentially redesigning my website from 
scratch. My previous website was a very basic WordPress installation, with a few 
extra plugins installed. However, over the past few months, I've been growing 
increasingly dissatisfied with my blog for the following reasons:

1.  I wanted to be able to version control everything. WordPress (and most blogging
    platforms) stores posts and other content within the server or the database. 
    While it's certainly possible to version control by either copying the content or 
    dumping the database, it's more extra work. 
2.  The workflow was backwards. For me, I prefer writing content on my local machine 
    and synching with the server only when I think what I've written is good and 
    ready. With WordPress, pretty much everything is done exclusively through the 
    admin panel on the server itself. 
3.  I wanted complete control. This is my personal website -- I wanted to be able 
    to control, tweak, and extend the website however I want without anything 
    much getting in my way.
4.  WordPress is awkward to configure and setup on my web host. To be fair, this 
    isn't due to any fault of WordPress -- my webhost has a somewhat eccentric 
    setup. Regardless, I found myself spending far too much time messing around 
    with permissions and various settings just to perform what should have been 
    routine maintenance.
    
For these reasons, I decided to rebuild my website from the ground up to scratch those 
itches. Specifically, I decided to base my website on top of [Jekyll][jekyll], a 
static site generator. I used [Bootstrap][bootstrap] to help with the CSS and used 
[Grunt][grunt] and [Bower][bower] to automate my build system and manage my dependencies.

On the whole, I'm pretty satisfied with my setup. Jekyll is delightfully minimal in 
comparison to WordPress, and lets me easily create almost anything without being too 
restrictive. I've already had some prior experience using Jekyll and Bootstrap, so 
the learning curve was relatively low.



  [jekyll]: 
  [bootstrap]: 
  [grunt]:
  [bower]: