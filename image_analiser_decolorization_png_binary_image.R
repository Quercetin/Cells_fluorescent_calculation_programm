# read and install libraries
# install.packages("imager", dependencies = TRUE)
# install.packages("magrittr")
# install.packages("pixmap")
# install.packages("magick")
# install.packages("image.binarization")



library(image.binarization)
library(imager)
library(png)
library(pixmap)
library(magick)

# Read and image from png
input_file <- "/Users/nauti/Documents/ROST_R/parrots.png"
output_file <- "/Users/nauti/Documents/ROST_R/parrots.ppm"
gray_file_path<-"C:/Users/nauti/Documents/ROST_R/parrots2.png"
png_image<-load.image(input_file)
plot(my_image)
r_channel <- as.array(png_image[,,1,1])
g_channel <- as.array(png_image[,,1,2])
b_channel <- as.array(png_image[,,1,3])
# Apply the grayscale conversion formula
gray_values <- 0.2126 * r_channel + 0.7152 * g_channel + 0.0722 * b_channel

# Convert the grayscale values back to an image format imager can handle
gray_image <- as.cimg(gray_values)
# Save image gray_image in png format
save.image(gray_image, gray_file_path)
plot(gray_image)

# BUT: gray_image <- grayscale(image)

#convert image to binary type - black and white
binary_file_path<-"C:/Users/nauti/Documents/ROST_R/parrots3.png"
binary_image <- threshold(gray_image, thr = 0.2, approx = TRUE, adjust=1)
binary_image_final <- as.cimg(binary_image)
plot(binary_image_final)
save.image(binary_image_final, (binary_file_path))

#Count numbers of white and black pixels
num_white_pixels <- sum(binary_image_final == 1)
num_black_pixels <- sum(binary_image_final == 0)
white_to_black_pixels<-num_white_pixels/num_black_pixels 
print("Number of white pixels count:")
print(num_white_pixels)
print("Number of black pixels count:")
print(num_black_pixels)
print("white to black:")
print(white_to_black_pixels)


