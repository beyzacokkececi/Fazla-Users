library(tidyverse)
library(ggmap)
library(stringr)
library(viridis)

btc_user_loc <- read_csv("sms_prod_public_btc_user_locations.csv")

ggplot() +
  geom_point(data = btc_user_loc, aes(x = longitude, y = latitude), alpha = .05)

# SIMPLE HEATMAP
ggplot() +
  stat_density2d(data = btc_user_loc, aes(x = longitude, y = latitude, fill = ..density..),
                 geom = 'tile', contour = F) 


# GET MAP
map_btc <- get_stamenmap(bbox = c(left = 28.3, bottom = 40.822255, right =
                                    29.8, top = 41.4), zoom = 15, maptype = 'toner-hybrid')

ggmap(map_btc)

ggmap(map_btc) +
  stat_density2d(data = btc_user_loc, aes(x = longitude, y = latitude, fill = ..density..),
                 geom = 'tile', contour = F, alpha = .5)

# VIRIDIS (inferno), alpha = .5
ggmap(map_btc) +
  stat_density2d(data = btc_user_loc, aes(x = longitude, y = latitude, fill = ..density..),
                 geom = 'tile', contour = F, alpha = .5) +
  scale_fill_viridis(option = 'inferno')

