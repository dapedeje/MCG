library(DBI)
library(odbc)
library(tidyverse)

con <- dbConnect(odbc(),
                 Driver   = "ODBC Driver 17 for SQL Server",  # o ajusta según el driver que tengas
                 Server   = "DAVID",
                 Database = "AdventureWorks2016_EXT",  # reemplaza con el nombre real
                 Trusted_Connection = "Yes")


data <- dbGetQuery(con, "SELECT * FROM Purchasing.ProductVendor")

data %>% select(AverageLeadTime) %>% summarise(sum(AverageLeadTime))
