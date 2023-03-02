# Originally created by Yacine Rouizi, dontrepeatyourself.org
# https://dontrepeatyourself.org/post/learn-opencv-by-building-a-document-scanner/

# Loading the image
from imutils.perspective import four_point_transform
import cv2

image = cv2.imread("1dollarexample.jpg")
orig_image = image.copy()

# Image processing
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY) # convert the image to gray scale
blur = cv2.GaussianBlur(gray, (5, 5), 0) # Add Gaussian blur
edged = cv2.Canny(blur, 75, 200) # Apply the Canny algorithm to find the edges

# Show the image and the edges
###cv2.imshow('Original image:', image)
###cv2.imshow('Edged:', edged)

# Using the Edges to find all the contours
contours, _ = cv2.findContours(edged, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
contours = sorted(contours, key=cv2.contourArea, reverse=True)

# Show the image and all the contours
###cv2.imshow("Image", image)
cv2.drawContours(image, contours, -1, (0, 255, 0), 3)
###cv2.imshow("All contours", image)

# Selecting only the edges of the bill
# go through each contour
for contour in contours:
    # we approximate the contour
    peri = cv2.arcLength(contour, True)
    approx = cv2.approxPolyDP(contour, 0.05 * peri, True)
    # if we found a contour with 4 points we break the for loop
    # (we can assume that we have found our bill)
    if len(approx) == 4:
        doc_cnts = approx
        break

# Applying warp perspective to get the top-down view of the bill
# We draw the contours on the original image not the modified one
cv2.drawContours(orig_image, [doc_cnts], -1, (0, 255, 0), 3)
###cv2.imshow("Contours of the bill", orig_image)
# apply warp perspective to get the top-down view
warped = four_point_transform(orig_image, doc_cnts.reshape(4, 2))
# convert the warped image to grayscale
warped = cv2.cvtColor(warped, cv2.COLOR_BGR2GRAY)
###cv2.imshow("Scanned", warped) # The end goal of this whole program
cv2.imwrite('resultbill.jpg', warped)

cv2.waitKey(0)
cv2.destroyAllWindows()