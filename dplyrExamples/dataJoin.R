data1 <- data.frame(ID = 1:2,                      # Create first example data frame
                    X1 = c("a1", "a2"),
                    stringsAsFactors = FALSE)
data2 <- data.frame(ID = 2:3,                      # Create second example data frame
                    X2 = c("b1", "b2"),
                    stringsAsFactors = FALSE)


library("dplyr")    
inner_join(data1, data2, by = "ID")     
left_join(data1, data2, by = "ID")    
right_join(data1, data2, by = "ID")   
full_join(data1, data2, by = "ID")   
semi_join(data1, data2, by = "ID")    
anti_join(data1, data2, by = "ID")  

data3 <- data.frame(ID = c(2, 4),                   # Create third example data frame
                    X2 = c("c1", "c2"),
                    X3 = c("d1", "d2"),
                    stringsAsFactors = FALSE)
data3  

full_join(data1, data2, by = "ID") %>%              # Full outer join of multiple data frames
  full_join(., data3, by = "ID") 

full_join(data2, data3, by = c("ID", "X2")) 

inner_join(data1, data2, by = "ID") %>%              # Automatically delete ID
  select(- ID)
