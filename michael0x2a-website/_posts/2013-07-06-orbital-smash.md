---
layout: default
title: "Orbital Smash"
date: 2013-07-06
tags: code codeday hackathon project python writeup
math: true
---

Last Saturday, May 26th, 2013, I participated in [CodeDay Seattle](http://seattle.codeday.org/), a 24 hour hackathon hosted by [StudentRND](http://studentrnd.org/). During the hackathon, I wrote a short game called [Orbital Smash](https://github.com/Michael0x2a/Orbital-Smash), and won the "Best Game" award! Technical details about the game are located below.

If you want to try it out, you can download it from the repo linked above. You need Python 2.7, pygame, and a mouse. Run `python smash.py` inside the `orbital-smash` folder.

Here is a YouTube video demonstrating gameplay. Unfortunately, the internet was down at the hackathon, so I was unable to add music or sound effects.

<iframe width="640" height="360" src="http://www.youtube.com/embed/78M79fYp4jU?rel=0" frameborder="0" allowfullscreen></iframe>

In essence, the game is an arcade-style survival game where you try to dodge any enemies and bullets. Using your tractor beam, you can make objects orbit around you and use those to smash opposing enemies.


## Planning

So I decided to create a game called "Orbital Smash". It actually went surprisingly well! It was my first complete non-calculator game (and simultaneously, the worst code I've written in recent memory). 

Normally, I spend a lot of time trying to design a working framework when I'm attempting to make a game, and as a result, never actually finish. However, since I had only 24 hours to build something, I entered with the mindset that I'd do whatever was necessary to have a playable demo up and running.

I decided on the following core mechanics:

* Space
* Use flying planetoids to collect other flying planetoids
* Use movement to make detritus spin
* Fling or smash detritus into other planetoids to reduce health


## Coding

### Architecture

The game itself is build around the concept of [component-entity systems](http://www.reddit.com/r/gamedev/comments/1f83c5/3_articles_about_component_entity_systems/): instead of using instances of classes to represent each object in the game, I represented each object using a series of `components` (which are just strings). For example, an enemy could be represented by the following components:

* AI
* Enemy
* Moveable
* Solid
* Orbitable
* Drawable
* Damageable
* UfoSprite
* Rotates
* FacesUser
* Bounded
* JaggedPath
* ShootingAttack
* SwarmingAttack

Each engine (physics, graphics, AI, etc) then iterates through every entity and acts on it if it has the appropriate component. For example, the physics engine would update this entity because it contains the `Moveable` component. However, if the `Moveable` component were removed, the physics engine would no longer detect the object is there and it would become static.  This let me mix and match all sorts of different components to dynamically create new enemies and AI behavior.

The graphics engine was relatively easy -- I used pygame and sprites. Coding in AI was also fairly simple -- the behavior of each object, as you can tell from the video, was not terribly complex.


### Physics

The most difficult part was making and debugging the physics engine, which I easily spent about 9-10 hours on. At its core, the engine just models every entity in the game (apart from the walls) as a sphere, and updates velocity and position and calculates how enemies should rebound when they collide against each other. Objects took damage depending on how much force they were hit with.

Collision was surprisingly easy -- if I use vectors to represent the velocity of each object, the angle of reflection was just:

<div>
$$
v - (2 (\text{normal} \cdot v)) \text{normal}
$$
</div>

...where `v` is the directional vector of the moving object, `normal` is the unit normal where the ball collides, and the dot represents the dot product.

I had several issues getting the engine running. For example, the balls would often "stick" together when they collided. As I discovered, this happened whenever the balls happened to overlap slightly due to inaccuracies with vectors. To fix this, I had to add in code to detect whenever two or more balls were overlapping, and push them outward until they weren't before calculating the collision.

The orbit of the captured entities was initially modelled after the law of gravitation, but it proved to be too difficult to play. A linear relationship was more effective. To prevent it from moving too close or too far away, I added invisible spheres that would confine any orbiting object within 150 pixels of the center and 50 pixels away.

The physics engine also used a naive Euler integrator to calculate changes in velocity. As I later discovered, this was a poor way of doing it. In the future, I'll probably use better techniques such as [Verlet integration](http://en.wikipedia.org/wiki/Verlet_integration) instead of using Euler.


## Misc

Overall, I had a fantastic experience. This was my first hackathon, and I was pleased it went relatively well. I was exhausted at the end, but had a blast.

(I also learned that listening to loud techno music boosted my productivity dramatically, which is a nifty trick)
