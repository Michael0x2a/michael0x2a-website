---
layout: post
title: "Learning LaTeX"
date: 2012-11-07
parent_id: blog
page_id: learning-latex
---

I recently learned how to use [LaTeX](http://en.wikipedia.org/wiki/LaTeX), which is a document markup language which can be seen as a sort of replacement for Microsoft Word. You can write text like this:

```latex
\documentclass[12pt]{article}
    \usepackage{amsmath}
\begin{document}

This is an example of a LaTeX document. It automatically handles
paragraph, indentation, typography, and general layout. See?

lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 
lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 
lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 
lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 
lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 
lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 

It can also easily handle math:

\begin{align}
    S &= 1 + \cfrac{1}{1 + \cfrac{1}{1 + \cfrac{1}{1 + \ldots}}} \\
    S &= 1 + \cfrac{1}{S} \\
    S^2 - S &= 0 \\
    S(S - 1) &= 0
\end{align}

\end{document}
```

Sample output:

<img src="/_assets/media/latex/simple.png" alt="" title="Simple LaTeX output" width="390" height="295" />

(It's a bit fuzzier then in the actual pdf -- I'm not sure why)

There a lot of reasons why you should start learning LaTeX, and the pros and cons of doing so, but since people have already written pretty decent explanations online, I'll just go ahead and list them below instead of repeating them myself.

* [LaTeX isn't for everyone but it could be for you](http://www.osnews.com/story/10766)
* [Why use LaTeX? = LaTeX Templates](http://www.latextemplates.com/why-use-latex)
* [Five reasons you should use LaTeX and five tips for teaching it](http://castingoutnines.wordpress.com/2010/02/21/five-reasons-you-should-use-latex-and-five-tips-for-teaching-it/)
* [Why use LaTeX? - LaTeX for Humans](http://latexforhumans.wordpress.com/2008/10/07/why-use-latex/)
* [Why should I use LaTeX? - tex.stackexchange](http://tex.stackexchange.com/questions/1756/why-should-i-use-latex)

Personally, I use LaTeX for the following reasons:

* It's absolutely brilliant for math. Microsoft's math tool, while easy to use, is essentially point-and-click. While it's fairly easy to create an equation in Microsoft Word, it's difficult to do quickly. In general, I found that typing out equations in LaTeX was less frustrating, and let me create equations far more rapidly in MS Word. Since LaTeX is just a text file, the equations are also integrated in with the rest of the text so I don't keep having to switch back-and-forth between some sort of 'math mode'. [LibreOffice](http://libreoffice.org) also has an equation editor which is more text-based then MS Word, but it still forces you to jump into a separate window to type out equations and doesn't render neatly.
* It's semantic, and takes care of formatting for me.
* Since LaTeX files are just plaintext, I can manipulate and generate them using computer programs. This means that I can easily generate tables, equations, and graph by simply using a computer program, instead of having to enter them in by hand.

I found that LaTeX is especially effective for longer papers in math or science when compared to MS Word or LibreOffice. However, I found that LaTeX didn't have any noticeable advantage over either word processing programs when I'm trying to write outlines or MLA-formatted papers for English or History. While LaTeX does have an MLA package which works fine, it essentially disables everything nice about LaTeX (fonts, section headers, even the justified aligning and auto-hyphenation (the MLA standard mandates that all text be right-aligned)).

Although LaTeX is cool, I did have some difficulty setting things up, so for my benefit, I decided that I'm going to document them bellow for future reference.

## Installing and using LaTeX ##

Each OS has a different program to convert LaTeX source documents into typeset documents. The recommended one for Windows is apparently [MiKTeX](http://miktex.org/download). Be sure to click 'Other Downloads' and install the full version, instead of just the basic version. It'll take an hour or two, but it'll save a lot of hassle down the road. The installer will first make you download all the packages first. Once you do so, you have to re-run the installer and select the packages you just downloaded in order to actually begin installing.

Alternatively, I found that [writelatex.com](http://writelatex.com) is a fairly decent online LaTeX editor/compiler. 

To run LaTeX, use the following:

```
latex -output-format=pdf my-latex-file-here.tex
```

(LaTeX doesn't generate pdf files by default)

You often have to run this twice -- the first time builds the document, and the second time will make sure all the labels and references are correct.

## Learning LaTeX ##

I found the [Not So Short Introduction to LaTeX](http://tobi.oetiker.ch/lshort/lshort.pdf) to be the best guide for learning LaTeX from the ground up. The [wikibook](http://en.wikibooks.org/wiki/LaTeX) on LaTeX is also extremely high-quality -- although it would make a good tutorial, I found myself using it more as a general reference and as a way to fill any holes in my knowledge as I actually tried creating LaTeX documents. And finally, [tex.stackexchange](http://tex.stackexchange.com) is a good way to ask questions and learn about LaTeX in general (they're also unusually friendly for a SE site too, which was a pleasant surprise).

## A typical document ##

After poking around, I found myself reusing this same preamble over and over again:

```latex
\documentclass[12pt, letterpaper]{article}
    % META %
    \usepackage{nag}
    \usepackage{fixltx2e}
    \usepackage{microtype}
    \usepackage[utf8]{inputenc}
    
    % MATH %
    \usepackage{amsmath}
    \usepackage{amssymb}
    \usepackage{mathtools}
    
    % TABLES %
    \usepackage{booktabs}
    \usepackage[tableposition=top]{caption}
    
    % GRAPHICS %
    \usepackage{graphicx}
    \DeclareGraphicsExtensions{.pdf,.png,.jpg}
    \graphicspath{{./images/}}
    
    % CODE %
    \usepackage{minted}
    \newminted{python}{linenos,xleftmargin=0.25in}
    
    % MODIFICATIONS %
    \usepackage[margin=1.0in]{geometry}
    \usepackage[parfill]{parskip}
    
    % MISC %
    \usepackage[hidelinks]{hyperref}
    \usepackage{enumitem}
    \usepackage{xspace}

    \title{A sample document}
    \author{Michael Lee}
    \date{Nov 2012}
    
    \includeonly{main,appendix}
\begin{document}

\maketitle

\include{main}
\include{appendix}

\end{document}
```

### General Notes

* In order to compile this, you actually need to use <pre>latex -output-format=pdf -shell-escape filename.tex</pre> since I'm using `minted`, a syntax-highlighting package for code. If you exclude the package, you can just use <pre>latex -output-format=pdf filename</pre> (see details below)
* I used the `article` documentclass here -- I alternate from `article` for normal paper, and `report` for the occasional large paper. I also tend to make additional modifications to the `report` documentclass (see below).

### Notes on packages.

* The `nag` package will spout warning messages if it detects me using old packages. `fixltx2e`, `microtype`, and `inputenc` are recommendations from [StackOverflow](http://stackoverflow.com/a/1984478/646543).
* The `amsmath` package replaces the default math stuff in LaTeX, and makes it look better. `amssymb` loads additional math symbols (the 'therefore' symbol, for example). `mathtools` allegedly repairs various small problems with `amsmath`.
* The default tables in LaTeX can potentially look quite ugly -- `booktabs` provides a far more elegant alternative. 
* I prefer my captions to be placed at the top of [figures](http://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions), so I make sure to use `\usepackage[tableposition=top]{caption}` when using the `caption` package.
* `graphicx` lets me import pictures into my document. The `\graphicspath` command lets me add folders to search for images (otherwise, LaTeX will only search the current directory). 
* `minted` is a syntax-highlighting package. It requires that [Python](http://python.org) and [Pygments](http://pygments.org) be installed and added to the path. Alternatively, I could have used the `listings` package, but I didn't feel like mucking around with those.
* `geometry` lets me manually set my margins, since LaTeX defaults to large margins.
* `parskip` lets me customize the behavior of my paragraphs. I prefer to have a single line between each paragraph with no indentation, and `\usepackage[parfill]{parskip}` lets me do so.
* `hyperref` lets me add links inside my pdf files. However, inside pdf files, the links often show up in ugly colored boxes. Specifying the `hidelinks` options hides those ugly boxes.
* `enumitem` lets me customize lists.

## Notes taking template ##

I like taking notes in this style:

<img src="/_assets/media/latex/notes.png" alt="" title="notes" width="401" height="221" class="" />

I had some difficulty finding out how to configure my preamble to set this up, so for future reference:

```latex
{% raw %}
\documentclass[12pt,letterpaper]{article}
    % META %
    \usepackage{nag}
    \usepackage{fixltx2e}
    
    % MODIFICATIONS %
    \usepackage[margin=0.7in]{geometry}
    \usepackage[parfill]{parskip}
    
    % SECTIONS %
    \usepackage[small,compact]{titlesec}
    % I've modified the section titles to be smaller and more compact
    
    % LISTS %
    \usepackage{enumitem}
    \setlist{nolistsep} 
    % Here, I'm removing the spacing between each list item so it becomes more compact
    
    \newcommand{\LeftMargin}{1em}%
    \newcommand{\NotesIndent}{1cm}%
    % I'm just defining variables for convenience. 
    
    \newenvironment{notes}{%
        \begin{itemize}[label=-,leftmargin=\LeftMargin,labelindent=\NotesIndent]%
        \renewcommand*{\LeftMargin}{\NotesIndent}%
        \ignorespaces%
    }{
        \end{itemize}%
        \ignorespacesafterend%
    }
    % The notes environment basically hijacks the itemize environment and makes the 
    % margin initially zero and increase by 1cm with each nested list.
    
    % MISC %
    \usepackage{hyperref}
    \usepackage{xspace}
    
    \newcommand{\bn}{\begin{notes}\xspace}
    \newcommand{\en}{\end{notes}\xspace}
    \let\nt\item%
    % I'm now replacing \begin{notes} with \bn and \end{notes}
    % with \en so I don't have to type as much when actually taking notes.
    % I'm also replacing \item with \nt so that my text will line up naturally
    % with 4-space tabs.
    
    
\begin{document}

\section{Test 1}

\bn
\nt Example file
\nt I like having indented notes
    \bn
    \nt With arbitrarily-nested notes
    \nt Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
        lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 
        \bn
        \nt lorem ipsum
        \nt lorem ipsum
        \nt lorem ipsum
        \en
    \en
\nt Test test test
\nt Test test test
    \bn
    \nt blah blah
    \nt blah blah
    \en
\en

\end{document}
{% endraw %}
```