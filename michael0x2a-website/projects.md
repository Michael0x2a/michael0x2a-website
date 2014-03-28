---
layout: default
title: "Projects"
id: projects
---

The majority of my projects are related to programming, although I've also dabbled in piano, origami, and other miscellaneous concepts.

Although all of the following writeups that I've done are all in my [blog](/blog), I've linked them here for convenience.
  
<ul>
    {% for post in site.tags.project %}
        <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
</ul>

You can also check my [Github profile][git] for the projects that I didn't writing about.

  [git]: http://github.com/michael0x2a