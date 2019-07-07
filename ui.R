library(shiny)
library(dplyr)
library(shinydashboard)
library(shinyBS)
med1<-read.csv(file="D:\\1227\\data science\\MEDICINE\\Book1.csv",header=TRUE, sep=",")
attach(med1)

shinyUI(dashboardPage(skin="yellow",
                      
                      dashboardHeader(title="MY PRACTO APP",titleWidth = 600),
                      dashboardSidebar(
                        sidebarMenu(
                        textInput("medi","SEARCH "),
                          
                          menuItem(text="MEDICINE",tabName = "MEDICINE",badgeLabel = "click",badgeColor = "yellow" , icon=icon("clipboard")),
                          
                          menuItem(text="DESCRIPTION",icon = icon("th"),
                                   
                        menuSubItem(text = "DETAILS",tabName = "MANUFACTURER"),
                        menuSubItem(text="COST",tabName = "COST"),
                        menuSubItem(text="OTHERDETAILS",tabName = "OTHERDETAILS"),
                        menuSubItem(text="COMPOSITION",tabName = "COMPOSITION")
                        
                          ),
                        menuItem(text="SUBSTITUTION",tabName = "SUBSTITUTION",badgeLabel = "click",badgeColor = "yellow" , icon=icon("users")),
                       
                    
                          menuItem(text="RECOMMENDATIONS",tabName = "RECOMMENDATIONS",badgeLabel = "click",badgeColor = "yellow" , icon=icon("check")),
                          menuItem(text="ALSO VISIT",href="https://www.practo.com/medicine-info/search",icon=icon("link"))
                        )
                      ),
                      dashboardBody(
                        
                        tabItems(
                          
                          tabItem(tabName = "MEDICINE",textOutput("m"),
                                  bsAlert("alert")),
                                 
                          
                          tabItem(tabName = "MANUFACTURER",tableOutput("b") ),
                          
                          tabItem(tabName = "COST",tableOutput("c") ),
                          tabItem(tabName = "COMPOSITION",tableOutput("c1") ),
                          tabItem(tabName = "OTHERDETAILS",tableOutput("S") ), 
                          tabItem(tabName = "SUBSTITUTION",tableOutput("s") ), 
                          tabItem(tabName = "RECOMMENDATIONS",tableOutput("s1") )
                          
                        )
                      )
)
)