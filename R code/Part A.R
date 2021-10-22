# Using R, read the dimensions files and the profit fact table. Build an OLAP cube for your 
# revenue and show the cells of a subset of the cells

setwd("F:\\uOttawa\\Fundamental\\Assignment\\Data")
CheeseType_table <- read.delim(file="CheeseType_table.csv", header=TRUE, sep=",")
City_table <- read.delim(file="City_table.csv", header=TRUE, sep=",")
Dough_table<- read.delim(file="City_table.csv", header=TRUE, sep=",")
Orders_fact_table<- read.delim(file="Orders_fact_table.csv", header=TRUE, sep=",")
PizzaSize_table<- read.delim(file="PizzaSize_table.csv", header=TRUE, sep=",")
StoreLocation_table<-read.delim(file="StoreLocation_table.csv", header=TRUE, sep=",")
Toping_table<- read.delim(file="Toping_table.csv", header=TRUE, sep=",")
PIZZA_ORDER<- read.delim(file = "PIZZA_ORDER.csv", header= TRUE, sep=",")






#Using R, read the dimensions files and the profit fact table. Build an OLAP cube for your revenue and show the cells of a subset of the cells


revenue_cube_profit <- 
  tapply(big_fact_table$Profit, 
         (big_fact_table[,c("StoreLocation_key_ref","Date_key_ref")]
          ), 
         FUN=function(x){return(sum(x))})

# Showing the cells of the cube
revenue_cube_profit
dimnames(revenue_cube_profit)


#working on part 3 
big_fact_table<-merge(Orders_fact_table,PIZZA_ORDER)


revenue_cube_quantity <- 
  tapply(big_fact_table$Quantity, 
         (big_fact_table[,c("StoreLocation_key_ref","Date_key_ref","PitzaSize_key_ref","Toping_key_ref",
                            "Dough_key_ref","Cheese_key_ref")]
         ), 
         FUN=function(x){return(sum(x))})




#apply(revenue_cube, c("Toping_key_ref"),FUN=function(x) {return(sum(x, na.rm=TRUE))})
apply(revenue_cube_quantity, c("Toping_key_ref","StoreLocation_key_ref"),FUN=function(x) {return(sum(x, na.rm=TRUE))})
apply(revenue_cube_quantity, c("Dough_key_ref","StoreLocation_key_ref"),FUN=function(x) {return(sum(x, na.rm=TRUE))})
apply(revenue_cube_quantity, c("Cheese_key_ref","StoreLocation_key_ref"),FUN=function(x) {return(sum(x, na.rm=TRUE))})
   


apply(revenue_cube_quantity, c("Toping_key_ref"),FUN=function(x) {return(sum(x, na.rm=TRUE))})
apply(revenue_cube_quantity, c("Dough_key_ref"),FUN=function(x) {return(sum(x, na.rm=TRUE))})
apply(revenue_cube_quantity, c("Cheese_key_ref"),FUN=function(x) {return(sum(x, na.rm=TRUE))})


apply(revenue_cube_quantity, c("PitzaSize_key_ref"), FUN=function(x) {return(sum(x, na.rm=TRUE))})

apply(revenue_cube_quantity, c("PitzaSize_key_ref","Date_key_ref"), FUN=function(x) {return(sum(x, na.rm=TRUE))})
apply(revenue_cube_quantity, c("PitzaSize_key_ref","StoreLocation_key_ref"), FUN=function(x) {return(sum(x, na.rm=TRUE))})

