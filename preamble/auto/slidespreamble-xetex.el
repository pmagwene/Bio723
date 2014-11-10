(TeX-add-style-hook
 "slidespreamble-xetex"
 (lambda ()
   (TeX-run-style-hooks
    "mathspec"
    "fancyvrb"
    "minted"
    "textfit"
    "tikz"
    "tcolorbox"
    "booktabs"
    "pifont")
   (TeX-add-symbols
    '("xvec" ["argument"] 1)
    '("ddvec" 1)
    '("dvec" 1)
    '("PsInv" 1)
    '("Red" 1)
    '("InvMtx" 1)
    '("Inv" 1)
    '("Mtx" 1)
    '("Species" 1)
    "Real"
    "RealN"
    "RealP"
    "weblink"
    "stdvec")
   (LaTeX-add-environments
    '("Code" 1)
    "Rcode"
    "Pcode"
    "Alert"
    "Highlight")
   (LaTeX-add-lengths
    "xvec")))

