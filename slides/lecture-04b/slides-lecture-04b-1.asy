if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="slides-lecture-04b-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import graph;
size(4inches);

real logistic(real x){return exp(x)/(1+exp(x));}
real logistic4(real x){return logistic(4*x);}
real logistic8(real x){return logistic(8*x);}



xaxis("$X$",Bottom,-1.0,1.0);
yaxis("$P(Y=1)$",Left,0.0,1.0);


draw(graph(logistic4,-1,1),red);
label("$\beta=4$", (0.5,logistic4(0.5)), SE, red);

draw(graph(logistic8,-1,1),blue);
label("$\beta=8$", (0.15,logistic8(0.15)), NW, blue);

size(0,90.3375pt,keepAspect=true);
