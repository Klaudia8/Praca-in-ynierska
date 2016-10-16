length(start_time) # liczba rekordow - 842608
sum(time_diff==0) # 19726

# analiza zwrotów i wypozyczen w innych lokalizacjach i czasie = 0
sum(start_location != end_location & time_diff==0) # 263
bike[which(start_location != end_location & time_diff==0),2:3] # daty tych przypadków 
bike[which(start_location != end_location & time_diff==0),4:5] # ich lokalizacje

# analiza zwrotów rowerów
sum(start_location == end_location & time_diff==0) # 19463
bike_return <- bike[which(start_location == end_location & time_diff==0),] #rowery o czasie = 0 i tych samych lokalizacjach
after_bike_return <- bike[which(start_location == end_location & time_diff==0)+1,] # rekord nastepujacy po zwrocie roweru

sum(bike_return[,4] == after_bike_return[,4]) # 3907 - te samy lokalizacje wypozyczenia przy zwrocie roweru i zaraz po nim wśród wszystkich zwrotów
bike_return[]

bike_return[1:15,]
after_bike_return[1:15,]