# Computer-Vision-Image-WhiteBalance

Our eyes are very good at removing the effect of illumination to judge the true color of an object. A simple
way of modeling the effect of a light is to assume that the reflected color I = (ir; ig; ib) arises due to a
light L = (lr; lg; lb) interacting with paint C = (cr; cg; cb) satisfying L * C = I, i.e. at each pixel we have
(lr x cr; lg x cg; lb x cb) = (ir; ig; ib). Computing L and C given I is ill-posed. For example, a red pixel in
an image I = (255; 0; 0) might be due to a white light L = (1; 1; 1) on a red object C = (255; 0; 0), or red
light L = (1; 0; 0) on a white object C = (255; 255; 255). Thus, in order to solve this problem certain priors
are needed. One such prior is the \gray world" assumption that states the average color of the image under
white light is gray (Recall that any color (r; g; b) where r = g = b is gray).

Assume that the average color of an image under white light L = (1; 1; 1) is (128; 128; 128). Under this
assumption, show that given an image the color of the light can be computed as L =
(rave/128 ; gave/128 ; bave/128 , where, rave; gave; bave are the average red, green, and blue values of the image.


Thus, you can obtain the true color of a pixel as: cr = ir x 128/rave; cg = ig x 128/gave; cb = ib x 128/bave;
WhiteBalance.m takes an image I and returns the light L and color image C using the above calculations.
