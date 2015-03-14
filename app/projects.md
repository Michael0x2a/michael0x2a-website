---
layout: default
title: "Projects"
page_id: projects
---

The majority of my personal projects are related to programming, although I've also dabbled in piano, origami, and other miscellaneous projects.

This page links to every "interesting" and non-trivial project that I've worked on so far. I also have some other projects, but they're relatively minor and not really worth mentioning -- you can check my [Github profile][git] to find those.

Several projects also have writeups associated with them. You can find all writeups in my [blog](/blog), but I've linked them here for convenience.

The projects are ordered in rough chronological order, with the oldest first and the most recent last.

## Projects
  
<ul>
    {% for project in site.data.projects %}
        <li>
            <p><strong>{{ project.name }} &mdash; {{ project.date }}</strong><br />
                {% if project.repo != "" %}
                    <a href="{{ project.repo }}" rel="external">
                        Link to repo
                    </a>
                {% else %}
                    Repo not available
                {% endif %}
                {% if project.livelink != "" %}
                    | 
                    <a href="{{ project.livelink }}" rel="external">
                        Try it out
                    </a>
                {% endif %}
                {% if project.writeup != "" %}
                    | <a href="{{ project.writeup }}">Writeup</a>
                {% endif %}
            </p>
            <p>{{ project.description }}</p>
        </li>
    {% endfor %}
</ul>


  [git]: http://github.com/michael0x2a
  [linkedin]: http://linkedin.com/in/michael0x2a