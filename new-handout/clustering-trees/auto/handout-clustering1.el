(TeX-add-style-hook
 "handout-clustering1"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("scrbook" "10pt" "oneside" "headings=big" "captions=tableheading")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("hyperref" "colorlinks=true" "citecolor=blue" "linkcolor=black" "breaklinks=true" "linktocpage") ("cleveref" "capitalize")))
   (TeX-run-style-hooks
    "latex2e"
    "../layoutpreamble"
    "../fontpreamble"
    "../packages"
    "../codepreamble"
    "../macros"
    "clustering1"
    "scrbook"
    "scrbook10"
    "scrpage2"
    "hyperref"
    "cleveref")))

