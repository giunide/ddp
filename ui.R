

library(shiny)
library(ggplot2)
library(plotly)
data(mtcars)
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))
mtcars$vs <- factor(mtcars$vs, labels = c("V-Shaped", "Straight"))

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("mtcars Dataset Explotaratory Analisys"),
  tabsetPanel(
          #Plot Tab
          tabPanel("Plot",
  # Row with dinamic plot
  fluidRow(
          column(width = 12,
          plotlyOutput("mtPlot") 
  )),
  # Row with inputs
  fluidRow(
   # Variable for the X Axis
           column(width = 2,
      selectInput("varx",
                  label = "Choose X-axis Variable",
                  choices = list("None",
                                 "Miles/(US) gallon",
                                 "Number of cylinders",
                                 "Displacement (cu.in.)",
                                 "Gross horsepower",
                                 "Rear axle ratio",
                                 "Weight (1000 lbs)",
                                 "1/4 mile time",
                                 "Number of forward gears",
                                 "Number of carburetors"),
                  selected = "Miles/(US) gallon")),
      # Variable for the Y Axis
    column(width = 2,
    selectInput("vary",
                  label = "Choose Y-axis Variable",
                  choices = list("None",
                                 "Miles/(US) gallon",
                                 "Number of cylinders",
                                 "Displacement (cu.in.)",
                                 "Gross horsepower",
                                 "Rear axle ratio",
                                 "Weight (1000 lbs)",
                                 "1/4 mile time",
                                 "Number of forward gears",
                                 "Number of carburetors"),
                  selected = "Gross horsepower")),
    # Variable for the Color
    column(width = 2,
      selectInput("varc",
                  label = "Choose Color Variable",
                  choices = list("None",
                                 "Miles/(US) gallon",
                                 "Number of cylinders",
                                 "Displacement (cu.in.)",
                                 "Gross horsepower",
                                 "Rear axle ratio",
                                 "Weight (1000 lbs)",
                                 "1/4 mile time",
                                 "Engine Type",
                                 "Transmission Type",
                                 "Number of forward gears",
                                 "Number of carburetors"),
                  selected = "Transmission Type")),
    # Variable for the size
    column(width = 2,
      selectInput("varz",
                  label = "Choose Size Variable",
                  choices = list("None",
                                 "Miles/(US) gallon",
                                 "Number of cylinders",
                                 "Displacement (cu.in.)",
                                 "Gross horsepower",
                                 "Rear axle ratio",
                                 "Weight (1000 lbs)",
                                 "1/4 mile time",
                                 "Number of forward gears",
                                 "Number of carburetors"),
                  selected =  "Number of cylinders"))
  )
  ),
  #Summary Tab
  tabPanel("Summary Of the Dataset",
           dataTableOutput("summary") 
           
  ),
  #Documentation Tab
  tabPanel("Documentation",
  h1("Documentation"),
  h3("Plot Tab"),
  p("In this tab, the user has to select which variables, from the mtcars dataset, are plotted and in which axis. There is the possibility to choose one variable as color and another as the size of the markers of the plot. There's also an option for not choosing any variable in every selection box."),
  h3("Summary Tab"),
  p("In this tab, there is a summary of the dataset, where the user can observe some summary stats as: Min, 1st Quantile, Median, Mean, 3rd Quantile, and Max."),
  h4("Have Fun!")
           )
  )
)
)