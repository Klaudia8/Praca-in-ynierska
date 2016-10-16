length(start_time) # liczba rekordow - 842608
sum(time_diff==0) # 19726

mean_time <- mean(time_diff)
med_time <- median(time_diff)

# HISTOGRAMY
# histogram wszytskich roznic w czasie
hist(time_diff,main="Histogram czasu wypożyczeń",xlab="Różnica czasu wypożyczeń a zwrotów",ylab="Liczba wypożyczeń rowerów",breaks=200,freq=TRUE,border="blue")

# po usunięciu czasu większego niż, np. 100 min
time_diff_less <- time_diff[-which(time_diff>100)]
hist(time_diff_less,main="Histogram ilościowy czasu wypożyczeń",xlab="Różnica czasu wypożyczeń a zwrotów",ylab="Ilość wypożyczeń",breaks=100,freq=TRUE,border="blue")

# ile wypozyczen dla roznic w czasie (dla kazdej minuty - od 0 do 1192)
how_long_bike_borrowed <- dbGetQuery(R_SQL,"SELECT timestampdiff(MINUTE,start_time,end_time) ile_time_diff,count(start_time)
                  FROM rowery
                  GROUP BY ile_time_diff;")

# maksymalny czas wypozyczenia roweru
max(how_long_bike_borrowed[,1]) # 1192

