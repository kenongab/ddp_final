# Credits to https://www.r-bloggers.com/image-compression-with-principal-component-analysis/ for the
# PCA image compression guide

library(shiny)
library(jpeg)

# Read Mona Lisa into server and take grayscale image matrix
mona <- readJPEG("./Gray-Scale-Mona-Lisa.jpg")
bw <- prcomp(mona[,,1], center = FALSE)


shinyServer(function(input, output) {
   
  output$image <- renderImage({
    
    width <- 300
    height <- 397
    
    # Temp file to save output
    temp <- tempfile(fileext = ".jpg")
    
    # render compressed image
    compressed <- bw$x[,1:input$comp] %*% t(bw$rotation[,1:input$comp])
    writeJPEG(compressed, target = temp)
    
    # Return list containing image and info on image
    list(src = temp, contentType = "image/jpg", width = width, height = height, alt = "Compressed image")
  }, deleteFile = TRUE)
  
})
