# Setup the dimension tables
PizzaSize_table <- data.frame(PitzaSize_key=c("P","S","M","L","XL"),
                              Size=c("Personal","Small","Medium","Large","XLarge"))
Dough_table <- data.frame((Dough_key=1:3),
                          dough=c("whole wheat thin", "white regular", "stuffed crust"))

CheeseType_table <- data.frame((Cheese_key=1:3),
                               Cheese=c("Swiss", "cheddar", "Mozzarella"))

Toping_table <- data.frame(Toping_key=c("t1","t2","t3","t4"),
                           Toping_type=c("tomatoes", "pepper", "onions", "pepperoni"))

City_table <- data.frame(City_key=c("c1","c2","c3"),
                        City_name=c("Cairo","Ontario","Paris"),
                        Country=c("Egypt","Canada","France"),
                        Povince=c("Cairo","Ottawa","Paris"))

StoreLocation_table <- data.frame(StoreLocation_key=c("S10","S20","S30"),
                                 City_key_ref=c("C1","c2","c3"),
                                 Adress=c("15, Tahreer st, Cairo", "22, Rideau St, Ottawa","26 Champs-Élysées, Paris"))

Order_date <- data.frame((Date_key= 1:10),
                         Date= c("1-1-2021","1-2-2021","1-3-2021","1-4-2021","1-5-2021","1-6-2021","1-7-2021","1-8-2021","1-9-2021","1-10-2021"))

#creating function that generates random records for the fact tables

gen_orders <- function(no_of_rec){
  StoreLocation_key_ref1=sample(StoreLocation_table$StoreLocation_key, no_of_rec, replace= TRUE , prob = NULL)
  PitzaSize_key_ref1=sample(PizzaSize_table$PitzaSize_key, no_of_rec , replace = TRUE ,prob = c(2,5,3,4,10))
  Dough_key_ref1=sample(Dough_table$X.Dough_key...1.3.,no_of_rec, replace =  TRUE, prob = NULL)
  Cheese_key_ref1=sample(CheeseType_table$X.Cheese_key...1.3.,no_of_rec,replace = TRUE)
  Toping_key_ref1=sample(Toping_table$Toping_key,no_of_rec, replace = TRUE)
  Quantity1=sample(c(1,2,3,4,5),no_of_rec, replace = TRUE)
  Profit1=sample(c(10,6,8,7,30),no_of_rec, replace = TRUE)
  Date_day1=sample(Order_date$X.Date_key...1.10.,no_of_rec, replace = TRUE)
  order_key1<- 1:no_of_rec
  
  
  OrderFact_table <- data.frame(order_key=order_key1,
                                StoreLocation_key_ref=StoreLocation_key_ref1,
                                #PitzaSize_key_ref=PitzaSize_key_ref1,
                                #Dough_key_ref=Dough_key_ref1,
                                #Cheese_key_ref=Cheese_key_ref1,
                                #Toping_key_ref=Toping_key_ref1,
                                Quantity=Quantity1,
                                Profit=Profit1,
                                #Date_day=Date_day1
                                Date_key_ref=Date_day1
  )
  
  PIZZA_ORDER<- data.frame(order_key=order_key1,
                           PitzaSize_key_ref=PitzaSize_key_ref1,
                           Dough_key_ref=Dough_key_ref1,
                           Cheese_key_ref=Cheese_key_ref1,
                           Toping_key_ref=Toping_key_ref1
                           
                           )
  
  OrderFact_table <- OrderFact_table[order(OrderFact_table$order_key),]
  A <- list("OrderFact_table"= OrderFact_table , "PIZZA_ORDER"=PIZZA_ORDER)
  return(A)
  }
       A= gen_orders(500) 
       OrderFact_table <- A$OrderFact_table
       PIZZA_ORDER <- A$PIZZA_ORDER
       
       write.csv(OrderFact_table,"F:\\uOttawa\\Fundamental\\Assignment\\Orders_fact_table.csv", row.names = FALSE)
       write.csv(PizzaSize_table,"F:\\uOttawa\\Fundamental\\Assignment\\PizzaSize_table.csv", row.names = FALSE)
       write.csv(Dough_table,"F:\\uOttawa\\Fundamental\\Assignment\\Dough_table.csv", row.names = FALSE)
       write.csv(CheeseType_table,"F:\\uOttawa\\Fundamental\\Assignment\\CheeseType_table.csv", row.names = FALSE)
       write.csv(Toping_table,"F:\\uOttawa\\Fundamental\\Assignment\\Toping_table.csv", row.names = FALSE)
       write.csv(City_table,"F:\\uOttawa\\Fundamental\\Assignment\\City_table.csv", row.names = FALSE)
       write.csv(StoreLocation_table,"F:\\uOttawa\\Fundamental\\Assignment\\StoreLocation_table.csv", row.names = FALSE)
       write.csv(PIZZA_ORDER,"F:\\uOttawa\\Fundamental\\Assignment\\PIZZA_ORDER.csv", row.names = FALSE)
       
       