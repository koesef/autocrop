# Autocrop Concept
Auto-crops film negatives from hand-marqueed Epson Scan (or any other scanner, really) files.
## Important characteristics
* Rotation angle is necessarily limited due to the film position in the scanner
* Cropping the image slightly is fine, nothing important on the sides
* Image aspect ratio is 3:2 for 120 (645) and 135 formats
* Crop follows invert due to differing color levels (make this switchable).
## Approaches
### Magick edge-detect
Edge-detection using ImageMagick (http://im.snibgo.com/find4corn.htm#find4cornSub.bat)
### Per-pixel averaging
Sense the average "RMS" color change per-line and detect corners
### Magic wanding (seems promising)
Detect external regions of contiguous color, draw boundaries and create enclosed inscribed rectangle
* Detect white or black contiguous color: use threshold tool
#### More detailed approach:
* Check for pure white or pure black pixels and crop them out. There are rounded corners.
## Expected issues
* Some images may have been cropped manually, and system should be smart enough to know that
## Desired features
* Auto detect negative or positive scan
* Switchable settings etc.