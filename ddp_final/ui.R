library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel(h1("A Visualization of Principal Component Analysis")),
  
  # Sidebar with input for prcomps
  sidebarLayout(
    sidebarPanel(width = 3, 
      fluidRow(
        imageOutput("image", height = 397, width = 300),
        p("Use the slider to adjust the number of principal components used to recreate the image."),
        sliderInput("comp",
                   "Number of components:",
                   min = 1,
                   max = 50,
                   value = 1)
    )
    ),
    
    # Show the compressed image
    mainPanel(
       h2("What's happening?"),
       p("Principal component analysis, or PCA, is an orthogonal linear transformation of data. In machine learning and data analysis,
         PCA can extract important features within the data while reducing the dimensionality of a dataset. This is achieved since PCA 
         transforms the data in such a way that the greatest variance of a projection of the data lies on the first coordinate, or first
         component. Since this first component accounts for most of the variance, it contains most of the information about the data set. 
         The amount of variance captured by a component diminishes as we move on to the second component, and so on. As a side effect, PCA
         is also a form of data compression since a data structure transformed by PCA can be appreciably recovered using only the first few components."),
       h2("How does this apply to pictures?"),
       p("A picture can be thought of as a matrix of pixels, represented as a matrix of RGB values. PCA can be applied to this
         matrix, reducing the picture to its principal components. In the app, the slider is set to 1 by default. This means that the displayed
         image is showing only the information from the first principal component. Increasing the slider's value adds more principal components
         to the recreation of the image, allowing more information to be recovered and a clearer picture to be shown. A recognizable image appears using
         only the variance accounted for by the first twenty out of a few hundred principal components.")
  )
))
)
