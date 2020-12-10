# Panoramic Image Stiching with Low Constrast Images
#### By Rohan Mendiratta, Andrew Degler, Andrew Schaeffer
##### UW-Madison: CS639 Fall 2020

This repository contains code to research ways to stitch panoramic images together. Panoramic image stiching is not a hard task in itself, but it relies on finding SIFT (shift invariant feature transform) points within the image. When images are low contrast, these SIFT points are hard to detect. Two solutions have been proposed. The first is using the Key.Net CNN to extract key points from an image. The second is using a variant of the harris corner detection algorithm which entropy block based.
