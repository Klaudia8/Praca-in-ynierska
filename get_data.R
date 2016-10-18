# Dane z jakiego okresu: 216 dni, 12h, 54 min (28.04-30.11)
library(DBI)
library(RMySQL)
R_SQL <-  dbConnect(RMySQL::MySQL(), 
                    username = "root", 
                    password = "asd",
                    host = "localhost", 
                    port = 3306, 
                    dbname = "rowery")

bike <- dbGetQuery(R_SQL,"SELECT * FROM rowery ORDER BY start_time, start_location, end_time")
setwd("/home/klaudia/Dokumenty/Studia/7 semestr/Praca inżynierska/")
station <- read.table(file="StacjeWroclaw.csv", header=TRUE, sep=",")

start_location <- bike$start_location
end_location <- bike$end_location
start_time <- strptime(c(paste(bike[,2])), format = "%Y-%m-%d %H:%M", tz = "CET") #Kodowanie dat
end_time <- strptime(c(paste(bike[,3])), format = "%Y-%m-%d %H:%M", tz = "CET")

time_diff <- difftime(end_time,start_time) # różnica czasów (w sekundach)
time_diff <- as.numeric(time_diff)/60 # różnica czasów w minutach