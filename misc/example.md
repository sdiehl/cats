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

\

As a consequence, the isotrivial families of superconnected unimodular
curves are self-dual with respect to the motivic theory of ultrafilters.
The entirety of mathematics and logic then trivially follows as a
consequence. The proof is left to the reader.
