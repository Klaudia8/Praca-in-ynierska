library('ggmap')
library('igraph')
require('ggmap')
require('RMySQL')

min(station$longitude) #16.96054 - 16.95
min(station$latitude) # 51.04803 - 51.00
max(station$longitude) # 17.10382 - 17.105
max(station$latitude) # 51.13208 - 51.15
mean(station$latitude) # 51.10514
mean(station$longitude) # 17.03196

# wybór skali mapy, ustawione puntky
Wroclaw_map <- get_googlemap(center=c(lon = 17.03196,lat = 51.10514),zoom=12, maptype = "roadmap")

map_Wroclaw_station <- ggmap(Wroclaw_map,
                     extent = "device",
                     ylab = "Latitude",
                     xlab = "Longitude") 

# rysuje punkty na mapie Wrocławia
map_Wroclaw_station + 
  geom_point(data=station,aes(x=station$longitude,y=station$latitude),size=1)

# --------------

# wielkość wierzchołków wg liczby wypożyczeń rówerów na stacji (degree_wyp)
number_node <- as.numeric(attributes(degree_wyp)$names)
station$size <- 1:74
station$size[number_node] <- degree_wyp*5/max(degree_wyp)
station$size[74] <- 0

map_Wroclaw_station +
  geom_point(data=station,aes(x=station$longitude,y=station$latitude),size=station$size)

