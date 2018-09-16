shinyServer(function(input, output) {
   
  output$mtPlot <- renderPlotly({
    
    # Switch Inputs for data
    x <- switch(input$varx,
                "None" = "", 
                "Miles/(US) gallon" = mtcars$mpg,
                "Number of cylinders" = mtcars$cyl,
                "Displacement (cu.in.)" = mtcars$disp,
                "Gross horsepower" = mtcars$hp,
                "Rear axle ratio" = mtars$drat,
                "Weight (1000 lbs)" = mtcars$wt,
                "1/4 mile time" = mtcars$qsec,
                "Number of forward gears" = mtcars$gear,
                "Number of carburetors" = mtcars$carb)
                
    y <- switch(input$vary, 
                "None" = "", 
                "Miles/(US) gallon" = mtcars$mpg,
                "Number of cylinders" = mtcars$cyl,
                "Displacement (cu.in.)" = mtcars$disp,
                "Gross horsepower" = mtcars$hp,
                "Rear axle ratio" = mtars$drat,
                "Weight (1000 lbs)" = mtcars$wt,
                "1/4 mile time" = mtcars$qsec,
                "Number of forward gears" = mtcars$gear,
                "Number of carburetors" = mtcars$carb)
             
    color <- switch(input$varc,
                    "None" = "",  
                    "Miles/(US) gallon" = mtcars$mpg,
                    "Number of cylinders" = mtcars$cyl,
                    "Displacement (cu.in.)" = mtcars$disp,
                    "Gross horsepower" = mtcars$hp,
                    "Rear axle ratio" = mtars$drat,
                    "Weight (1000 lbs)" = mtcars$wt,
                    "1/4 mile time" = mtcars$qsec,
                    "Engine Type" = mtcars$vs,
                    "Transmission Type" = mtcars$am,
                    "Number of forward gears" = mtcars$gear,
                    "Number of carburetors" = mtcars$carb)
    size <- switch(input$varz, 
                   "None" = "", 
                   "Miles/(US) gallon" = mtcars$mpg,
                   "Number of cylinders" = mtcars$cyl,
                   "Displacement (cu.in.)" = mtcars$disp,
                   "Gross horsepower" = mtcars$hp,
                   "Rear axle ratio" = mtars$drat,
                   "Weight (1000 lbs)" = mtcars$wt,
                   "Transmission Type" = mtcars$am,
                   "Number of forward gears" = mtcars$gear,
                   "Number of carburetors" = mtcars$carb)

    
    # Plot
    g <- qplot(x = x, y = y, colour = color, size = size, geom = "point", xlab = input$varx, ylab = input$vary)+
            theme_bw()+
            guides(colour = "none", size = "none")
    layout(ggplotly(g), showlegend = FALSE, autosize = TRUE)
  })
  output$summary <- renderDataTable(summary(mtcars))
})
