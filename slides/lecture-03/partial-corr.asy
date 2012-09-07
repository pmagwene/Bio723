settings.render=10;
settings.prc=true;
settings.outformat="pdf";

import three;

size(200);

defaultpen(fontsize(9));

/*currentprojection=perspective(4,2,1.5);*/
currentprojection=perspective(4,3,1); 


/* draw the X,Y-plane */
path3 xyplane = (0,0,0)--(2,0,0)--(2,2,0)--(0,2,0)--cycle;
/*draw(xyplane,gray); */

/* X and Y vectors */
path3 x = (0,0,0)--(1.75,1,0); 
draw(Label("$\mathbf{x}$", 1),x,Arrow3);

path3 y = (0,0,0)--(0.95, 1.2, 0.75);
draw(Label("$\mathbf{y}$", 0.75, align=2*W),y,Arrow3);

path3 z = (0,0,0)--(0.5,1.9,0);
draw(Label("$\mathbf{z}$", 1, align=S),z,Arrow3);

path3 e_xz = (0.35945596,  1.36593264,  0. )--(1.75,1,0);
draw(Label("$\mathbf{e}_{xz}$", MidPoint, align=7*RightSide),e_xz,red+dashed,Arrow3);

path3 e_yz = (0.35686528,  1.35608808,  0.    )--(0.95, 1.2, 0.75);
draw(Label("$\mathbf{e}_{yz}$", MidPoint, align=2*RightSide),e_yz,red+dashed,Arrow3);

/* draw(arc( (0.356, 1.36, 0), (-0.30610213,  0.08055319, -0.38705642), (-0.48353727,  0.12724665,  0.        )));
*/

draw("$\phi$", arc((0.356, 1.36, 0), relpoint(e_xz, 0.25), relpoint(e_yz,0.25)), red+dashed);



/* path3 projz = planeproject(xyplane)*z;

triple endpoint = invert(point(length(projz))); */



/*draw(Label("$\mathbf{\widehat{y}}$", 1, align=E),projz,red,Arrow3);*/

/*draw(Label("$\mathbf{e}$", MidPoint),(1.8,1.5,0)--(1.8,1.5,1.2),red+dashed,Arrow3);*/

/* draw(Label("$\mathbf{e}$", 0.75,align=RightSide),(1.8,1.5,0)--(1.8,1.5,1.2),red+dashed,Arrow3); */
