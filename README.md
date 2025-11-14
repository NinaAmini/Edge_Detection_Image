🐘 Edge Detection Using Local Variance
This project implements a simple edge-detection method based on local variance.
A small sliding window (for example 3×3) is moved across the image, and the variance inside each window is used to detect areas with strong intensity changes — the edges.

#📌 Overview
The algorithm works as follows:
Load the RGB image (eleph2.jpg)
Convert it to grayscale
Convert the image to double precision
Apply manual zero-padding (no toolbox required)
Slide a window across the image
Compute the local variance for each window
Use the average variance as a threshold
Create a binary edge map based on the threshold

##🧮 Method
For each sliding window:
Compute the mean value 
μ
μ
Compute 
E
[
x
2
]
E[x 
2
 ]
Compute the local variance:
σ
2
=
E
[
x
2
]
−
μ
2
σ 
2
 =E[x 
2
 ]−μ 
2
 
Rules:
Variance below the threshold → marked as edge (value = 1)
Variance above the threshold → marked as background (value = 0)
You can change the window size (3×3, 5×5, 7×7) to see how it affects smoothing and edge detection.

###Files:
eleph2.jpg       - Input image
Edge.m           - MATLAB implementation (with manual padding)
Edge.ipynb
README.md        - Documentation
