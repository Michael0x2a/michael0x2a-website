---
layout: default
title:  "New Arduino"
date:   2012-05-02
tags: arduino code experiment personal webapp writeup
---

I recently got a new [Arduino](http://arduino.cc) as part of a [starter kit](http://www.sparkfun.com/products/11022) from [SparkFun](http://sparkfun.com).  I do have some prior experience in electronics through [robotics club](http://michael0x2a.com/portfolio/programming/robotics-2011-2012/), but it was enlightening finally receiving some instruction how servos and such work on a fundamental (for example, it never occurred to me that PWM (Pulse Width Modulation) cables control components by literally modifying the pulse of electricity it sends down the wire, despite seeming obvious).  

I haven't really done anything too complex with it thus far, apart from causing a few lights to blink and playing with servos.  My next step for now is to finish going through the sample projects and have a chance to play with all the various parts that came with the kit.

For whatever reason, I also somehow got it into my head to try and create a webpage and server to try and control my Arduino from my browser &endash.  Although the Arduino itself is controlled by a variant of C, I discovered it was trivially easy to send values to it in Python via a serial cable.  I used [web.py](http://webpy.org) as my server, and [jQuery](http://jquery.com) to send values from the web page to the server via Ajax.

Altogether, it was surprisingly easy to set up, despite this being really the first time I really had played with either web.py or jQuery.  Some 'gotchas' I encountered:

1.  **Browser safeguards against cross-site scripting**

    The problem I encountered was that my html/jQuery controller file was unable to send data via Ajax (POST, specifically) to my server, which was running on <code>http://localhost:8080</code>.  Although I was unable to confirm this, I suspect this was due to browser safeguards against cross-site scripting: because the controller html file had a different filepath than simply 'localhost,' the browser thought they were different websites and prevented me posting data between them.  To fix this issue, I just added the controller file to the web server rather then keeping it separate.

2.  **Web.py wouldn't let me open a socket/port 8080 was occupied**

    Often times, port 8080 was occupied by some program or another.  Rather then forcibly trying to hunt down and kill whatever was in port 8080, I just decided to use a different port and used web.py's templating features to plop that value directly into my html/jQuery so it could communicate to the correct place.

