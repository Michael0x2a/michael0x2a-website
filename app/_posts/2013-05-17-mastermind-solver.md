---
layout: post
title: "Mastermind Solver"
date: 2013-05-17
updated: 2014-07-29
parent_id: blog
page_id: mastermind-solver
math: true
---

Link: [http://projects.michael0x2a.com/mastermind_solver](http://projects.michael0x2a.com/mastermind_solver)

Github repo: [http://github.com/michael0x2a/mastermind-solver](http://github.com/michael0x2a/mastermind-solver)

## Background and Motivation ##

This is a webapp which will solve [Mastermind][1] games. I made it because it seemed like both an interesting technical challenge to build a reliable algorithm to solve games, and an interesting design challenge to create a neat Javascript UI for it.

I  have two versions available: a Python console version, and a webapp one written in HTML5 and Javascript (see link above).

  [1]: http://en.wikipedia.org/wiki/Mastermind_(game)

## How it works ##

The algorithm is based heavily on Knuth's original [five-guess algorithm][knuth]. The basic algorithm is:

1.  Get a pool of all possible answers
2.  Offer an initial guess
2.  Get feedback from the user (number of red and white pegs)
3.  Filter the pool. Compare each possibility to the initial guess. If the number of red and white pegs is different from the user feedback, discard that possibility since it cannot possibly be the answer.
4.  Iterate through each remaining possibility, and see how many possibilities it would remove through the process outlined in step 3 if it were the next guess. Pick the possibility which eliminates the most amount of possibilities.
5.  Repeat from step 2.

Interestingly, I found that the effectiveness of the algorithm varied depending on the initial starting guess. In particular, the algorithm seemed to work best when the initial guess comprised of mostly equal numbers of two different pegs. For example, if there were four slots, the algorithm would often fail if the initial guess was anything other then two red pegs and two blue pegs.

I'm not entirely sure why this occurs.

The UI is written in pure HTML, CSS, and Javascript, using the [underscore.js][us] and [jQuery][jq] libraries. I also used web workers since the algorithm was computationally expensive and was freezing the browser given large initial colors or secret code length.

## Tidbits

One interesting aspect of the project was generating randomized to represent each peg. I could have hard-coded numbers for each peg, but that would suffer from two disadvantages. First, if the user entered more numbers then I had colors, I'd have to either repeat colors or do something similarly ineloquent. Second, I suck at picking colors.

I ended up using an algorithm I [saw on Gamedev.SE][colors] by a user named "Sam Hocevar" which picked equidistant hue values around the HSV space.  Mathematically, if there existed some function `HSV` which accepted the hue, saturation, and value of a color, I could find a sequence of `n` equidistant colors using the algorithm:

$$
\Phi = \text{Golden Ratio} = 0.618033088... \\
S = \text{desired saturation value from 0 to 1} \\
\left\langle \mathrm{HSV}\!\left( k \cdot \Phi \bmod 1, S, \sqrt{1 - (k \cdot \Phi \bmod 0.5)}\right) : k \in n \right\rangle
$$

...or in Javascript:

```javascript
var generateColors = function(amount, saturation) {
    var PHI = 0.618033988749895;
    colorTable = [];
    for (var k = 0; k < amount; k++) {
        colorTable.push(hsvToHex(
            (k * PHI) % 1.0, 
            saturation, 
            Math.sqrt(1.0 - ((k * PHI) % 0.5))));
    }
    return colorTable;
}
```

This generated a very nice pastel set of colors for any given $n$.


  [knuth]: http://en.wikipedia.org/wiki/Mastermind_%28board_game%29#Five-guess_algorithm
  [us]: http://underscorejs.org
  [jq]: http://jquery.org
  [colors]: http://gamedev.stackexchange.com/a/46469