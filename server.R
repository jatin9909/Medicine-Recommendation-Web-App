library(shiny)
library(dplyr)
library(shinydashboard)
library(shinyBS)


shinyServer(
  function(input,output,session)
  { med1<-read.csv(file="D:\\1227\\data science\\MEDICINE\\Book1.csv",header=TRUE, sep=",")
  attach(med1)
 
  
  
  output$m<- renderText(
    {
      
    df<- subset(med1, med1$NAME == input$medi)
      if(nrow(df)==0)
      {
        createAlert(session,"alert","examplealert",title="Further details visit link",content="or in case data not available")
        
      }else
        
        closeAlert(session,"examplealert")
        paste("Medicine :",input$medi)
    
      
      
      
    })
  
  output$b <- renderTable(
    
    {  
      df<-subset(med1, med1$NAME == input$medi)
      
     df[,c(1,2,6,10)]
      
    }
    
  )
  
  output$s <- renderTable(
    
    {  
      df<-subset(med1, med1$NAME == input$medi)
      
      df1<-subset(med1, med1$COMPOSITION == df$COMPOSITION & med1$NAME != input$medi)
      
      df1[,c(1,2,5,10)]
      
    }
    
  )
  output$S <- renderTable(
    
    {  
      df<-subset(med1, med1$NAME == input$medi)
      
      df[,c(7,8)]
      
      
    }
    
  )
  
  output$c <- renderTable(
    
    {  
      df<-subset(med1, med1$NAME == input$medi)
      
      df[,c(4,5)]
      
      
    }
    
  )
  output$c1 <- renderTable(
    
    {  
      df<-subset(med1, med1$NAME == input$medi)
      
      df[,c(3)]
      
      
    }
    
  )
  
  output$u1 <- renderDataTable(
    
    {  
      df<-subset(med1, med1$NAME == input$medi)
      
      df[,c(7,8)]
      
    }
    
  )
  output$s1 <- renderTable(
    
    {  
      df<-subset(med1, med1$NAME == input$medi)
      
      df1<-subset(med1,med1$BRAND == df$BRAND & med1$NAME != input$medi)
      df1[,c(1,2,5,7,8,10)]
      
    }
    
  )
  
 
  
  })
