cats
====

Buildchain to generate commutative diagrams inside Pandoc markdown with LaTeX + Tikz.

In addition to the Haskell infastructure for Pandoc you will need:

* One of the following TeX compilers: ``pdflatex``, ``xetex``,  ``lualatex``
* inkscape
* ghostscript

Installation
------------

```bash
$ cd cats
$ cabal install
```

Usage
-----

**You want to compile this:**

<pre>

    The following diagram proves the existence and uniqueness of the
    canonical duality between coherent sheaves on spectral sites of stacks
    of quotient moduli spaces of pointed curves with fixed ultragenus and
    the category of categories fibered in megaloid over an abelian smooth
    autoisotropic of general type category:

    ```commute
    \node (P) {$P$};
    \node (B) [right of=P] {$B$};
    \node (A) [below of=P] {$A$};
    \node (C) [below of=B] {$C$};
    \node (P1) [node distance=1.4cm, left of=P, above of=P] {$\hat{P}$};
    \draw[->] (P) to node {$f$} (B);
    \draw[->] (P) to node [swap] {$g$} (A);
    \draw[->] (A) to node [swap] {$f$} (C);
    \draw[->] (B) to node {$g$} (C);
    \draw[->, bend right] (P1) to node [swap] {$\hat{g}$} (A);
    \draw[->, bend left] (P1) to node {$\hat{f}$} (B);
    \draw[->, dashed] (P1) to node {$k$} (P);
    ```

    As a consequence, the isotrivial families of superconnected unimodular
    curves are self-dual with respect to the motivic theory of ultrafilters.
    The entirety of mathematics and logic then trivially follows as a
    consequence. The proof is left to the reader.

</pre>

**Into this:**

![Illustration](https://github.com/sdiehl/cats/raw/master/misc/screenshot.png)

You can either invoke from the commandline.

```bash
$ cat yourfile | cats
```

Or integrate with your existing Pandoc program:

```haskell
import Data.Pandoc.Tikz

doTikz :: Block -> IO Block
```
In your CWD you will need two files. The ``preamble.tex`` and a
``postamble.tex`` as well as any libraries needed by these files.

For example, for a simple commutative diagram using ``preview`` package.
The preamble is:

```tex
\documentclass{article}
\include{preview}
\usepackage[pdftex,active,tightpage]{preview}
\usepackage{amsmath}
\usepackage{tikz}
\usetikzlibrary{matrix}
\begin{document}
\begin{preview}
\begin{tikzpicture}[node distance=2cm, auto]
```

And the postamble:

```tex
\end{tikzpicture}
\end{preview}
\end{document}
```

Path Munging
------------

Depending on your TeX distribution you may have to modify
TEXINPUTS to include various Tikz or preview libraries.

```bash
$ export TEXINPUTS=./texinclude:$TEXINPUTS
```

Hakyll Integration
------------------
