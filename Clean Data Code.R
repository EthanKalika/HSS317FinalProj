library(qss)
library(usethis)
library(tidyverse)
library(devtools)

player_data = read.csv("modifiedData/player_data_2.csv")
Players = read.csv("modifiedData/Players_2.csv")
Stats = read.csv("modifiedData/Seasons_Stats_2.csv")
Stats_17 = Stats[-c(1:24691),]
count = 1
for (years in Stats$Year){
  if (is.na(years)){}
  else if (years == 2017){
    Stats_17 = rbind(Stats_17 , Stats[count,])
  }
  count = count + 1
}
player_data_17 = player_data[-c(1:4550),]
count = 1
for (x in player_data$name){
  if (is.na(player_data$year_end[count])){}
  else if (player_data$year_end[count] >= 2017 && player_data$year_start[count] <= 2017 ){
    player_data_17 = rbind(player_data_17, player_data[count,])
  }
  count = count + 1
}
Players_17 = Players[-c(1:3922),]
count = 1
for (name in Players$Player){
  for (name2 in player_data_17$name){
    if (is.na(name)){}
    else if (is.na(name2)){}
    else if (name == name2)
      Players_17 = rbind(Players_17, Players[count,])
  }
  count = count + 1
}
    
