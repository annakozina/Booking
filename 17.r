library(ggplot2, lib="/RPackages/")
library(gsheet, lib="/RPackages/")
library(stringr, lib="/RPackages/")
library(curl, lib="/RPackages/")
library(dplyr, lib="/RPackages/")
library(lubridate, lib="/RPackages/")
library(readxl, lib="/RPackages/")


library(ggplot2)
library(gsheet)
library(stringr)
library(curl)
library(dplyr)
library(lubridate)
library(readxl)



tempdata1 <- gsheet2tbl('https://drive.google.com/open?id=1M_BP2wm7phDcDe_lkOR7RlMzwDdbw-ru')
tempdata2 <- gsheet2tbl('https://drive.google.com/open?id=14ZXOtoLa8HAE1Zk3ps15JQVfDhqiwW0L')
tempdata3 <- gsheet2tbl('https://drive.google.com/open?id=1hAKbxES3d4ZVKhkIm8Eg8krLtXSyFb6i')
tempdata4 <- gsheet2tbl('https://drive.google.com/open?id=1WrWVD6ei_oFRKXXy_1ujRrVh7UaCSiPm')


data1 <-tempdata1[-(1:2), , drop = FALSE]
data2 <-tempdata2[-(1:2), , drop = FALSE]
data3 <-tempdata3[-(1:2), , drop = FALSE]
data4 <-tempdata4[-(1:2), , drop = FALSE]


colnames(data1)[1] <- 'Checkin'
colnames(data1)[2] <- 'Hotel'
colnames(data1)[3] <- 'Price'
colnames(data1)[4] <- 'Room'
colnames(data1)[5] <- 'Occupancy'
colnames(data1)[6] <- 'Refundable'
colnames(data1)[7] <- 'Breakfast'
colnames(data1)[8] <- 'Deposit'
colnames(data1)[9] <- 'MLOS'
colnames(data1)[10] <- 'Source'


colnames(data2)[1] <- 'Checkin'
colnames(data2)[2] <- 'Hotel'
colnames(data2)[3] <- 'Price'
colnames(data2)[4] <- 'Room'
colnames(data2)[5] <- 'Occupancy'
colnames(data2)[6] <- 'Refundable'
colnames(data2)[7] <- 'Breakfast'
colnames(data2)[8] <- 'Deposit'
colnames(data2)[9] <- 'MLOS'
colnames(data2)[10] <- 'Source'


colnames(data3)[1] <- 'Checkin'
colnames(data3)[2] <- 'Hotel'
colnames(data3)[3] <- 'Price'
colnames(data3)[4] <- 'Room'
colnames(data3)[5] <- 'Occupancy'
colnames(data3)[6] <- 'Refundable'
colnames(data3)[7] <- 'Breakfast'
colnames(data3)[8] <- 'Deposit'
colnames(data3)[9] <- 'MLOS'
colnames(data3)[10] <- 'Source'


colnames(data4)[1] <- 'Checkin'
colnames(data4)[2] <- 'Hotel'
colnames(data4)[3] <- 'Price'
colnames(data4)[4] <- 'Room'
colnames(data4)[5] <- 'Occupancy'
colnames(data4)[6] <- 'Refundable'
colnames(data4)[7] <- 'Breakfast'
colnames(data4)[8] <- 'Deposit'
colnames(data4)[9] <- 'MLOS'
colnames(data4)[10] <- 'Source'


rbind1 <- rbind(data1, data2)

rbind2 <- rbind(data3, data4)

rbind3 <- rbind(rbind1, rbind2)

rm(list=setdiff(ls(), "rbind3"))

colnames(rbind3)

rbind3$Checkin <- as_date(rbind3$Checkin)

############!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
###########################################
######################################################
################################################################
##########################################################################
######################################################################################
#####################################################################################################
#####################################################################################################################
#######################################################################################################################################
#####################################################################################################
######################################################################################
##########################################################################
#################################################################

Hotel <- c("Gorky Gorod Apartments", 
           #1
           "VALSET apartments by AZIMUT Rosa Khutor", 
           #2
           "ApartHotel Imeretinsky - Parkovy Kvartal", 
           #3
           "Apart Hotel Imeretinsky - Pribrezhny Kvartal",
           #4
           "Apart Hotel Imeretinskiy - Morskoy Kvartal", 
           #5
           "Apart Hotel Imeretinskiy - Zapovedniy Kvartal",
           #6
           "Barkhatnye Sezony Yekaterininsky Kvartal Resort",
           #7
           "Barkhatnye Sezony Russky Dom Resort 14 Kvartal",
           #8
           "Barkhatnye Sezony Russky Dom Resort 17 Kvartal",
           #9
           "Gorky Hotel Suites (ex. Solis Sochi Suites)",
           #10
           "Rixos Krasnaya Polyana Sochi", 
           #11
           "Novotel Resort Krasnaya Polyana Sochi",
           #12
           "Grand Hotel Polyana", 
           #13
           "Radisson Rosa Khutor Hotel", 
           #14
           "Sochi Marriott Krasnaya Polyana Hotel", 
           #15
           "Dolina 960 Hotel",
           #16
           "Polyana 1389 Hotel & Spa",
           #17
           "Rosa Khutor Chalet",                             
           #18
           "Medical Spa Hotel Rosa Springs", 
           #19
           "Green Flow Hotel Rosa Khutor",                   
           #20
           "Gorky Premium Art Hotel",
           #21
           "Hotel 28",                                       
           #22
           "Tulip Inn Rosa Khutor Hotel", 
           #23
           "Gorki Grand", 
           #24
           "Priyut Pandy", 
           #25
           "Rosa Ski Inn Hotel", 
           #26
           "Crystal Hotel", 
           #27
           "AYS Let It Snow Hotel Rosa Khutor",
           #28
           "Ays Design Hotel Rosa Khutor", 
           #29
           "Hotel BoogelWoogel Bar Rosa Khutor",
           #30
           "Rosa Village Family Hotel",
           #31 
           "Courtyard by Marriott Sochi Krasnaya Polyana",
           #32
           "AZIMUT Hotel FREESTYLE Rosa Khutor",
           #33
           "Gorki Panorama",
           #34
           "Imeretinskiy Hotel",
           #35
           "MERCURE Rosa Khutor Hotel",
           #36
           "Park Inn by Radisson Rosa Khutor",
           #37   
           "Golden Tulip Rosa Khutor Hotel",
           #38           
           "Sochi Park® Bogatyr Hotel - Tickets to the Park Included")
            #39


Category <- c("апартаменты", 
              #1 "Gorky Gorod Apartments"
              "апартаменты", 
              #2 "VALSET apartments by AZIMUT Rosa Khutor"     
              "апартаменты", 
              #3 ApartHotel Imeretinsky - Parkovy Kvartal"
              "апартаменты", 
              #4"Apart Hotel Imeretinsky - Pribrezhny Kvartal"
              "апартаменты", 
              #5 Apart Hotel Imeretinskiy - Morskoy Kvartal                
              "апартаменты",
              #6 "Apart Hotel Imeretinskiy - Zapovedniy Kvartal"
              "апартаменты",
              #7 "Barkhatnye Sezony Yekaterininsky Kvartal Resort"
              "апартаменты", 
              #8 "Barkhatnye Sezony Russky Dom Resort 14 Kvartal",
              "апартаменты",
              #9   "Barkhatnye Sezony Russky Dom Resort 17 Kvartal"
              "5 звезд",
              #10 "Gorky Hotel Suites (ex. Solis Sochi Suites)"
              "5 звезд", 
              #11 "Rixos Krasnaya Polyana Sochi",
              "5 звезд",
              #12 "Novotel Resort Krasnaya Polyana Sochi"
              "5 звезд",
              #13 Grand Hotel Polyana"
              "5 звезд", 
              #14 Radisson Rosa Khutor Hotel"
              "5 звезд",
              #15 Sochi Marriott Krasnaya Polyana Hotel"
              "4 звезды", 
              #16 "Dolina 960 Hotel",
              "4 звезды", 
              #17  "Polyana 1389 Hotel & Spa",
              "4 звезды", 
              #18  "Rosa Khutor Chalet",   
              "4 звезды",
              #19  "Medical Spa Hotel Rosa Springs", 
              "4 звезды",
              #20   "Green Flow Hotel Rosa Khutor"
              "1-3 звезды", 
              #21   "Gorky Premium Art Hotel",
              "1-3 звезды", 
              #22    "Hotel 28"
              "1-3 звезды",
              #23   "Tulip Inn Rosa Khutor Hotel"
              "1-3 звезды",
              #24"  "Gorki Grand", 
              "1-3 звезды",
              #25   "Priyut Pandy", 
              "1-3 звезды",
              #26 "Rosa Ski Inn Hotel", 
              "1-3 звезды",
              #27 "Crystal Hotel", 
              "1-3 звезды",
              #28 "AYS Let It Snow Hotel Rosa Khutor",
              "1-3 звезды",
              #29 "Ays Design Hotel Rosa Khutor",
              "1-3 звезды",
              #30 "Hotel BoogelWoogel Bar Rosa Khutor"
              "1-3 звезды",
              #31 "Rosa Village Family Hotel"  
              "4 звезды",
              #32 "Courtyard by Marriott Sochi Krasnaya Polyana"
              "1-3 звезды",
              #33 "AZIMUT Hotel FREESTYLE Rosa Khutor",
              "4 звезды", 
              #34 "Gorki Panorama",
              "4 звезды",
              #35"Imeretinskiy Hotel",
              "4 звезды",
              #36 "MERCURE Rosa Khutor Hotel",
              "4 звезды",
              #37 "Park Inn by Radisson Rosa Khutor",
              "4 звезды", 
              #38"Golden Tulip Rosa Khutor Hotel" 
              "4 звезды")
              #39 "Sochi Park® Bogatyr Hotel - Tickets to the Park Included"


Region <- c(#1 "Gorky Gorod Apartments", 
  "Гокри-Город",
  #2 "VALSET apartments by AZIMUT Rosa Khutor", 
  "Роза Хутор",  
  # 3"ApartHotel Imeretinsky - Parkovy Kvartal", 
  "Имеретинская",  
  #4 "Apart Hotel Imeretinsky - Pribrezhny Kvartal",
  "Имеретинская",
  #5 "Apart Hotel Imeretinskiy - Morskoy Kvartal" 
  "Имеретинская", 
  #6 "Apart Hotel Imeretinskiy - Zapovedniy Kvartal"
  "Имеретинская", 
  #7 "Barkhatnye Sezony Yekaterininsky Kvartal Resort"
  "Имеретинская", 
  #8"Barkhatnye Sezony Russky Dom Resort 14 Kvartal",
  "Имеретинская", 
  #9"Barkhatnye Sezony Russky Dom Resort 17 Kvartal",
  "Имеретинская",
  #10"Gorky Hotel Suites (ex. Solis Sochi Suites)",
  "Гокри-Город",
  #11 Rixos Krasnaya Polyana Sochi", 
  "Гокри-Город",
  #12 "Novotel Resort Krasnaya Polyana Sochi",
  "Гокри-Город",
  #13 "Grand Hotel Polyana", 
  "Газпром",
  #14"Radisson Rosa Khutor Hotel",
  "Роза Хутор", 
  # "15 Sochi Marriott Krasnaya Polyana Hotel", 
  "Гокри-Город",
  # "16"Dolina 960 Hotel",
  "Гокри-Город",
  #17 "Polyana 1389 Hotel & Spa",
  "Газпром",
  #18"Rosa Khutor Chalet",
  "Роза Хутор",
  # 19 "Medical Spa Hotel Rosa Springs", 
  "Роза Хутор",
  #20 Green Flow Hotel Rosa Khutor",
  "Роза Хутор",
  #21"Gorky Premium Art Hotel",
  "Гокри-Город",
  #22 "Hotel 28", 
  "Роза Хутор",
  #23 "Tulip Inn Rosa Khutor Hotel", 
  "Роза Хутор",
  #24 "Gorki Grand",
  "Гокри-Город",
  #25"Priyut Pandy", 
  "Роза Хутор",
  #26 "Rosa Ski Inn Hotel",
  "Роза Хутор",
  #27 "Crystal Hotel", 
  "Газпром",
  #28 "AYS Let It Snow Hotel Rosa Khutor",
  "Роза Хутор",
  #29 "Ays Design Hotel Rosa Khutor", 
  "Роза Хутор",
  #30 "Hotel BoogelWoogel Bar Rosa Khutor",
  "Роза Хутор",
  #31 "Rosa Village Family Hotel"
  "Роза Хутор",
  #32  "Courtyard by Marriott Sochi Krasnaya Polyana"
  "Гокри-Город",
  #33 "AZIMUT Hotel FREESTYLE Rosa Khutor",
  "Роза Хутор",
  #34 "Gorki Panorama",
  "Гокри-Город",
  #35 "Imeretinskiy Hotel",
  "Имеретинская",
  #36 "MERCURE Rosa Khutor Hotel",
  "Роза Хутор",
  #37 "Park Inn by Radisson Rosa Khutor", 
  "Роза Хутор",
  #38 "Golden Tulip Rosa Khutor Hotel")                          
  "Роза Хутор",
  #39 "Sochi Park® Bogatyr Hotel - Tickets to the Park Included"
  "Имеретинская")



names_category <- data.frame(Hotel, Category,  Region)
joined <- left_join(rbind3, names_category, by="Hotel")

joined$Price <- str_replace_all(joined$Price, '[^[:alnum:]]', ' ')
joined$Price <- as.character(joined$Price)

##############################################################
#Установим фильтры  5 звезд!!!!!!!!!!!!!!!!!!!

joined5Star <-joined %>% 
  select(Category, Checkin, Hotel, Price, Room, Breakfast, Occupancy, Refundable, Deposit,  MLOS) %>%
  filter(Category == "5 звезд", Breakfast == "Included"|Breakfast == "Включен",
         Occupancy ==2, Refundable == "Возвратное"|Refundable =="Refundable")


joined5_Rixos <-joined5Star %>% 
  select(Category, Checkin, Hotel, Price, Room, Breakfast, Occupancy, Refundable, Deposit,  MLOS) %>%
  filter(Category == "5 звезд", Breakfast == "Included"|Breakfast == "Включен",
         Occupancy ==2, Refundable == "Возвратное"|Refundable =="Refundable",
         Hotel == "Rixos Krasnaya Polyana Sochi")
         
joined5_Rixos <- joined5_Rixos %>% filter(Room %in% c("Superior Double Room - Free Spa Access", 
                     "Superior Twin Room - Free Spa Access","Superior Double Room - No Spa Access"))
                    
#### Проверка Rixos

     temp <- joined5_Rixos %>% filter(Hotel == "Rixos Krasnaya Polyana Sochi") 
unique(temp$Room)
####################################
# [1] "Superior Double Room - Free Spa Access"             "Superior Twin Room - Free Spa Access" 
# [13] "Superior Twin Room - No Spa Access"                 "Superior Double Room - No Spa Access"   

#############################################################
#############################################################
#############################################################
##############################################################


joined5_Novotel <-joined5Star %>% 
  select(Category, Checkin, Hotel, Price, Room, Breakfast, Occupancy, Refundable, Deposit,  MLOS) %>%
  filter(Category == "5 звезд", Breakfast == "Included"|Breakfast == "Включен",
         Occupancy ==2, Refundable == "Возвратное"|Refundable =="Refundable",
         Hotel == "Novotel Resort Krasnaya Polyana Sochi")

joined5_Novotel <- joined5_Novotel %>% filter(Room %in% c("Superior Twin Room â\u0080\u0093 Courtyard View",
                                                          "Superior Double Room - Courtyard View"))

#### Проверка Novotel

temp <- joined5_Novotel %>% filter(Hotel == "Novotel Resort Krasnaya Polyana Sochi") 
unique(temp$Room)
####################################
  
#############################################################
#############################################################
#############################################################
##############################################################


joined5_Grand <-joined5Star %>% 
  select(Category, Checkin, Hotel, Price, Room, Breakfast, Occupancy, Refundable, Deposit,  MLOS) %>%
  filter(Category == "5 звезд", Breakfast == "Included"|Breakfast == "Включен",
         Occupancy ==2, Refundable == "Возвратное"|Refundable =="Refundable",
         Hotel == "Grand Hotel Polyana")

joined5_Grand <- joined5_Grand %>% filter(Room %in% "Twin Room with Balcony")

#### Проверка Grand

temp <- joined5_Grand %>% filter(Hotel == "Grand Hotel Polyana") 
unique(temp$Room)
#########################
###### ##################
####################################



joined5_Mariott <-joined5Star %>% 
  select(Category, Checkin, Hotel, Price, Room, Breakfast, Occupancy, Refundable, Deposit,  MLOS) %>%
  filter(Category == "5 звезд", Breakfast == "Included"|Breakfast == "Включен",
         Occupancy ==2, Refundable == "Возвратное"|Refundable =="Refundable",
         Hotel == "Sochi Marriott Krasnaya Polyana Hotel")

joined5_Mariott<- joined5_Mariott %>% filter(Room %in% "Standard Room)                                 
                                                  

#### Проверка Mariott

temp <- joined5_Mariott %>% filter(Hotel == "Sochi Marriott Krasnaya Polyana Hotel") 
unique(temp$Room)


joined5_Radisson <-joined5Star %>% 
  select(Category, Checkin, Hotel, Price, Room, Breakfast, Occupancy, Refundable, Deposit,  MLOS) %>%
  filter(Category == "5 звезд", Breakfast == "Included"|Breakfast == "Включен",
         Occupancy ==2, Refundable == "Возвратное"|Refundable =="Refundable",
         Hotel == "Radisson Rosa Khutor Hotel")

joined5_Radisson <- joined5_Radisson %>% filter(Room %in% "Standard Room")                                 

#### Проверка Radisson

temp <- joined5_Radisson %>% filter(Hotel == "Radisson Rosa Khutor Hotel") 
unique(temp$Room)
#########################
###### ##################
####################################

joined5Starl <- rbind(joined5_Rixos,                               
                          joined5_Novotel,        
                          joined5_Grand,   
                          joined5_Mariott,                 
                          joined5_Radisson)                





##########################################Создадим фильтр категории номера
#####################################
###############НАСТРОЙКА ФИЛЬТРА ===========СТАНДАРТНЫЙ НОМЕР


#####################################

five_star1 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Gorky Hotel Suites (ex. Solis Sochi Suites)") 
five_star1 <- unique(five_star1$Room)
#########
######## "Superior King Room" "Superior Twin Room" 
####################################

five_star2 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Novotel Resort Krasnaya Polyana Sochi") 
five_star2 <- unique(five_star2$Room)
####################################
# "Superior Double Room with Side Mountain View"    "Superior Twin Room a\u0080\u0093 Courtyard View"
# [3] "Superior Double Room - Courtyard View"           "Superior Twin Room with Mountain View"          
# [5] "Superior Suite with Mountain View"               "Superior Double Room with Mountain View"      

five_star3 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Radisson Rosa Khutor Hotel") 
five_star3 <- unique(five_star3$Room)
# "Standard Room"                                      

# > 
####################################

five_star5 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Grand Hotel Polyana") 
five_star5 <- unique(five_star5$Room)
#####################################
# [1] "Deluxe Twin Room"                "Deluxe Double Room with Balcony" "Twin Room with Balcony"         
# [4] "Deluxe Double Room"             

five_star6 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Sochi Marriott Krasnaya Polyana Hotel") 
five_star6 <- unique(five_star6$Room)  
#####################################
# "Deluxe Double or Twin Room"                            
# [2] "Deluxe Suite"                                          
# [3] "Deluxe Family One-Bedroom Suite"                       
# [6] "Deluxe Family Suite"                                   
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  ###### ##################
####################################
###########################################Создадим фильтр категории номера
#####################################
###############НАСТРОЙКА ФИЛЬТРА ===========СТАНДАРТНЫЙ НОМЕР
  
  four_star <- joined  %>% 
  group_by(Category) %>%
  filter(Category == "4 звезды") 

unique(four_star$Hotel)

"Dolina 960 Hotel"                             "Gorki Panorama"                               "Courtyard by Marriott Sochi Krasnaya Polyana"
[4] "Park Inn by Radisson Rosa Khutor"             "MERCURE Rosa Khutor Hotel"                    "Golden Tulip Rosa Khutor Hotel"              
[7] "Imeretinskiy Hotel"                           "Polyana 1389 Hotel & Spa"                     "Rosa Khutor Chalet"                          
[10] "Medical Spa Hotel Rosa Springs"               "Green Flow Hotel Rosa Khutor"                



#####################################

four_star1 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Dolina 960 Hotel") 

four_star1 <- unique(four_star1$Room)
"Premium King Room" "Premium Twin Room"

######## 
####################################

four_star2 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Gorki Panorama") 
four_star2 <- unique(four_star2$Room)
####################################
"Standard Twin Room"    "Standard Double Room"                         



four_star3 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Courtyard by Marriott Sochi Krasnaya Polyana") 
four_star3 <- unique(four_star3$Room)

"Standard, Guest room, 2 Twin/Single Bed(s), Resort view" 
"Standard, Guest room, 1 King, Resort view, Balcony"     


####################################
four_star4 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Park Inn by Radisson Rosa Khutor") 
four_star4 <- unique(four_star4$Room)

"Standard Room"                                      
"Standard Room with River View"     

  
  four_star5 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "MERCURE Rosa Khutor Hotel") 
four_star5 <- unique(four_star5$Room)

"Twin Room"       "Standard Double Room - Non-Smoking"             


  four_star6 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Golden Tulip Rosa Khutor Hotel") 
four_star6 <- unique(four_star6$Room) 


"Standard Double or Twin Room"                                         
"Double or Twin Room with River View"
#####################################


four_star8 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Imeretinskiy Hotel") 
four_star8 <- unique(four_star8$Room) 
[ "Twin Room with Sea View"              "Standard Double Room with Sea View"              
[4                                       "Standard Double Room with Pool View"                                        
    "Standard Double Room - Club Level with Pool View" 


four_star9 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Polyana 1389 Hotel & Spa") 
four_star9 <- unique(four_star9$Room) 
"Double or Twin Room"                    "Double or Twin Room with Mountain View" 


four_star10 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Rosa Khutor Chalet") 
four_star10 <- unique(four_star10$Room) 
"Standard Twin Room with Mountain View" 


four_star11 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Medical Spa Hotel Rosa Springs") 
four_star11 <- unique(four_star11$Room)
"Standard Double or Twin Room"            


four_star12 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Green Flow Hotel Rosa Khutor") 
four_star12 <- unique(four_star12$Room) 

"Twin Room with Mountain View"        
"Twin Room with Balcony"          


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  ###### ##################
####################################
###########################################Создадим фильтр категории номера
#####################################
###############НАСТРОЙКА ФИЛЬТРА ===========СТАНДАРТНЫЙ НОМЕР


three_star <- joined  %>% 
  group_by(Category) %>%
  filter(Category == "1-3 звезды") 

unique(three_star$Hotel)


#####################################

three_star1 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "AZIMUT Hotel FREESTYLE Rosa Khutor") 

three_star1 <- unique(three_star1$Room)
"Superior Twin Room"                                                                 

######## 
####################################

three_star2 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Gorky Premium Art Hotel") 
three_star2 <- unique(three_star2$Room)
####################################
"Deluxe Double or Twin Room"          


three_star3 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Hotel 28") 
three_star3 <- unique(three_star3$Room)
"Double or Twin Room with Mountain View" "Double or Twin Room with Pool View"    

####################################
three_star4 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Tulip Inn Rosa Khutor Hotel") 
three_star4 <- unique(three_star4$Room)

[1] "Standard Double or Twin Room"                                
[4] "Double or Twin Room with River View"
  

three_star5 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Gorki Grand") 
three_star5 <- unique(three_star5$Room)
 "Standard Double or Twin Room"

  
 three_star6 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Priyut Pandy") 
 three_star6 <- unique(three_star6$Room) 

 [1] "Bed in 8-Bed Mixed Dormitory Room"      "Single Bed in 10-Bed Dormitory Room"    "Bed in 4-Bed Dormitory Room"           
 [4] "Economy Double or Twin Room"            "Superior Double or Twin Room"           "Basic Single Room with Shared Bathroom"
 [7] "Economy Twin Room"                      "Economy Triple Room"                   
 
###############################################################################################################################
 three_star7 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Rosa Ski Inn Hotel") 
 four_star7 <- unique(three_star7$Room) 

                         
 [2] "Standard Triple Room - Additional Building B"                    
 [3] "Standard Twin Room - Additional Building B"                      
 [4] "Two-Bedroom Apartment - Additional Building"                     
 [5] "Double or Twin Room with Shared Bathroom - Additional Building B"

 
 
 three_star8 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Crystal Hotel") 
 three_star8 <- unique(three_star8$Room) 

 [1] "Superior Double or Twin Room with Mountain View" "Superior Double or Twin Room with Terrace"      
 [3] "Double or Twin Room with Terrace"                "Standard Double or Twin Room"                   
 [5] "Quadruple Room with Mountain View"              
 
 
 three_star9 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "AYS Let It Snow Hotel Rosa Khutor") 
 three_star9 <- unique(three_star9$Room) 
 "Single Room with Shared Bathroom" "Twin Room with Shared Bathroom"  
 

 three_star10 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Ays Design Hotel Rosa Khutor") 
 three_star10 <- unique(three_star10$Room) 
[1] "Standard Double or Twin Room"                               
                              
three_star11 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Hotel BoogelWoogel Bar Rosa Khutor") 
 three_star11 <- unique(three_star11$Room)
          

 three_star12 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Rosa Village Family Hotel") 
 three_star12 <- unique(three_star12$Room) 
   
"Standard Double or Twin Room with Balcony"    

 
 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!               
  
  #setwd("C:/R")
  
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  
  #write.csv(joined, file='booking_14_06.csv')

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  
  ###################### Установим фильтра на STANDART ROOM, чтобы в программе не устанавливать данный фильтр
  
  ########################
  #####################################
################################################

########################
#####################################
################################################


########################
#####################################
################################################


########################
#####################################
################################################

  
  flight %>% 
  select(FL_DATE, CARRIER, ORIGIN, ORIGIN_CITY_NAME, ORIGIN_STATE_ABR, DEP_DELAY, DEP_TIME, ARR_DELAY, ARR_TIME) %>%
  filter(CARRIER == "UA")



five_star <- joined  %>% 
  group_by(Category) %>%
  filter(Category == "5 звезд") 

unique(five_star$Hotel)
#####################################

five_star1 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Gorky Hotel Suites (ex. Solis Sochi Suites)") 
five_star1 <- unique(five_star1$Room)
#########
######## "Superior King Room" "Superior Twin Room" 
####################################

five_star2 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Novotel Resort Krasnaya Polyana Sochi") 
five_star2 <- unique(five_star2$Room)
####################################
# "Superior Double Room with Side Mountain View"    "Superior Twin Room a\u0080\u0093 Courtyard View"
# [3] "Superior Double Room - Courtyard View"           "Superior Twin Room with Mountain View"          
# [5] "Superior Suite with Mountain View"               "Superior Double Room with Mountain View"      

five_star3 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Radisson Rosa Khutor Hotel") 
five_star3 <- unique(five_star3$Room)
# "Standard Room"                                      

# > 
####################################
five_star4 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Rixos Krasnaya Polyana Sochi") 
five_star4 <- unique(five_star4$Room)
####################################
# [1] "Superior Double Room - Free Spa Access"             "Superior Twin Room - Free Spa Access" 
# [13] "Superior Twin Room - No Spa Access"                 "Superior Double Room - No Spa Access"   


five_star5 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Grand Hotel Polyana") 
five_star5 <- unique(five_star5$Room)
#####################################
# [1] "Deluxe Twin Room"                "Deluxe Double Room with Balcony" "Twin Room with Balcony"         
# [4] "Deluxe Double Room"             

five_star6 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Sochi Marriott Krasnaya Polyana Hotel") 
five_star6 <- unique(five_star6$Room)  
#####################################
# "Deluxe Double or Twin Room"                            
# [2] "Deluxe Suite"                                          
# [3] "Deluxe Family One-Bedroom Suite"                       
# [6] "Deluxe Family Suite"                                   
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  ###### ##################
####################################
###########################################Создадим фильтр категории номера
#####################################
###############НАСТРОЙКА ФИЛЬТРА ===========СТАНДАРТНЫЙ НОМЕР

four_star <- joined  %>% 
  group_by(Category) %>%
  filter(Category == "4 звезды") 

unique(four_star$Hotel)

"Dolina 960 Hotel"                             "Gorki Panorama"                               "Courtyard by Marriott Sochi Krasnaya Polyana"
[4] "Park Inn by Radisson Rosa Khutor"             "MERCURE Rosa Khutor Hotel"                    "Golden Tulip Rosa Khutor Hotel"              
[7] "Imeretinskiy Hotel"                           "Polyana 1389 Hotel & Spa"                     "Rosa Khutor Chalet"                          
[10] "Medical Spa Hotel Rosa Springs"               "Green Flow Hotel Rosa Khutor"                



#####################################

four_star1 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Dolina 960 Hotel") 

four_star1 <- unique(four_star1$Room)
"Premium King Room" "Premium Twin Room"

######## 
####################################

four_star2 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Gorki Panorama") 
four_star2 <- unique(four_star2$Room)
####################################
"Standard Twin Room"    "Standard Double Room"                         



four_star3 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Courtyard by Marriott Sochi Krasnaya Polyana") 
four_star3 <- unique(four_star3$Room)

"Standard, Guest room, 2 Twin/Single Bed(s), Resort view" 
"Standard, Guest room, 1 King, Resort view, Balcony"     


####################################
four_star4 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Park Inn by Radisson Rosa Khutor") 
four_star4 <- unique(four_star4$Room)

"Standard Room"                                      
"Standard Room with River View"     


four_star5 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "MERCURE Rosa Khutor Hotel") 
four_star5 <- unique(four_star5$Room)

"Twin Room"       "Standard Double Room - Non-Smoking"             


four_star6 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Golden Tulip Rosa Khutor Hotel") 
four_star6 <- unique(four_star6$Room) 


"Standard Double or Twin Room"                                         
"Double or Twin Room with River View"
#####################################


four_star8 <- joined  %>% 
  group_by(Hotel) %>%
  filter(Hotel == "Imeretinskiy Hotel") 
four_star8 <- unique(four_star8$Room) 
[ "Twin Room with Sea View"              "Standard Double Room with Sea View"              
  [4                                       "Standard Double Room with Pool View"                                        
    "Standard Double Room - Club Level with Pool View" 
    
    
    four_star9 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Polyana 1389 Hotel & Spa") 
    four_star9 <- unique(four_star9$Room) 
    "Double or Twin Room"                    "Double or Twin Room with Mountain View" 
    
    
    four_star10 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Rosa Khutor Chalet") 
    four_star10 <- unique(four_star10$Room) 
    "Standard Twin Room with Mountain View" 
    
    
    four_star11 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Medical Spa Hotel Rosa Springs") 
    four_star11 <- unique(four_star11$Room)
    "Standard Double or Twin Room"            
    
    
    four_star12 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Green Flow Hotel Rosa Khutor") 
    four_star12 <- unique(four_star12$Room) 
    
    "Twin Room with Mountain View"        
    "Twin Room with Balcony"          
    
    
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      
      ###### ##################
    ####################################
    ###########################################Создадим фильтр категории номера
    #####################################
    ###############НАСТРОЙКА ФИЛЬТРА ===========СТАНДАРТНЫЙ НОМЕР
    
    
    three_star <- joined  %>% 
      group_by(Category) %>%
      filter(Category == "1-3 звезды") 
    
    unique(three_star$Hotel)
    
    
    #####################################
    
    three_star1 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "AZIMUT Hotel FREESTYLE Rosa Khutor") 
    
    three_star1 <- unique(three_star1$Room)
    "Superior Twin Room"                                                                 
    
    ######## 
    ####################################
    
    three_star2 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Gorky Premium Art Hotel") 
    three_star2 <- unique(three_star2$Room)
    ####################################
    "Deluxe Double or Twin Room"          
    
    
    three_star3 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Hotel 28") 
    three_star3 <- unique(three_star3$Room)
    "Double or Twin Room with Mountain View" "Double or Twin Room with Pool View"    
    
    ####################################
    three_star4 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Tulip Inn Rosa Khutor Hotel") 
    three_star4 <- unique(three_star4$Room)
    
    [1] "Standard Double or Twin Room"                                
    [4] "Double or Twin Room with River View"
    
    
    three_star5 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Gorki Grand") 
    three_star5 <- unique(three_star5$Room)
    "Standard Double or Twin Room"
    
    
    three_star6 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Priyut Pandy") 
    three_star6 <- unique(three_star6$Room) 
    
    [1] "Bed in 8-Bed Mixed Dormitory Room"      "Single Bed in 10-Bed Dormitory Room"    "Bed in 4-Bed Dormitory Room"           
    [4] "Economy Double or Twin Room"            "Superior Double or Twin Room"           "Basic Single Room with Shared Bathroom"
    [7] "Economy Twin Room"                      "Economy Triple Room"                   
    
    ###############################################################################################################################
    three_star7 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Rosa Ski Inn Hotel") 
    four_star7 <- unique(three_star7$Room) 
    
    
    [2] "Standard Triple Room - Additional Building B"                    
    [3] "Standard Twin Room - Additional Building B"                      
    [4] "Two-Bedroom Apartment - Additional Building"                     
    [5] "Double or Twin Room with Shared Bathroom - Additional Building B"
    
    
    
    three_star8 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Crystal Hotel") 
    three_star8 <- unique(three_star8$Room) 
    
    [1] "Superior Double or Twin Room with Mountain View" "Superior Double or Twin Room with Terrace"      
    [3] "Double or Twin Room with Terrace"                "Standard Double or Twin Room"                   
    [5] "Quadruple Room with Mountain View"              
    
    
    three_star9 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "AYS Let It Snow Hotel Rosa Khutor") 
    three_star9 <- unique(three_star9$Room) 
    "Single Room with Shared Bathroom" "Twin Room with Shared Bathroom"  
    
    
    three_star10 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Ays Design Hotel Rosa Khutor") 
    three_star10 <- unique(three_star10$Room) 
    [1] "Standard Double or Twin Room"                               
    
    three_star11 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Hotel BoogelWoogel Bar Rosa Khutor") 
    three_star11 <- unique(three_star11$Room)
    
    
    three_star12 <- joined  %>% 
      group_by(Hotel) %>%
      filter(Hotel == "Rosa Village Family Hotel") 
    three_star12 <- unique(three_star12$Room) 
    
    "Standard Double or Twin Room with Balcony"    








############################## ##########################
############################## ##########################
############################## ##########################
# average<- joined %>%
#   group_by(Hotel) %>%
#   dplyr::summarize(Mean = mean(Price, na.rm=TRUE))

#  
# colnames(joined)
# 
# warnings()
# 
# Temp <- joined %>% select(Hotel, Region)
# average<-left_join(Temp, joined, by="Hotel")
# 
# g <- ggplot(joined, aes(Hotel))
# g + geom_bar(aes(fill=Region), width = 0.5) + 
#   theme(axis.text.x = element_text(angle=45, vjust=0.6)) + 
#   labs(title="Histogram on Categorical Variable", 
#        subtitle="Manufacturer across Vehicle Classes") 
# 
# 
# 
# #####################################################################################
# #####################################################################################
# 
# Apart<- joined %>% group_by(Category) %>%
#   select("date", "Hotel", "Price", "Room", "Occupancy", "Refundable", 
#          "Category", "Region") %>% filter(Category=="apart")
# 
# 
# 
# one_three<- joined %>% group_by(Category) %>%
#   select("date", "Hotel", "Price", "Room", "Occupancy", "Refundable", 
#          "Category", "Region") %>% filter(Category=="1-3")
# 
# four_five<- joined %>% group_by(Category) %>%
#   select("date", "Hotel", "Price", "Room", "Occupancy", "Refundable", 
#          "Category", "Region") %>% filter(Category=="4-5")
# 
# ggplot(four_five, aes(date, Price))+
#   scale_x_date(date_breaks = "1 month", date_labels = "%b-%y",expand = c(0,0))+
#   geom_point(aes(color = Region, shape = Region))
# 
# +
#   geom_smooth(aes(color = cyl, fill = cyl), 
#               method = "lm", fullrange = TRUE) +
#   facet_wrap(~cyl) +
#   scale_color_manual(values = c("#00AFBB", "#E7B800", "#FC4E07"))+
#   scale_fill_manual(values = c("#00AFBB", "#E7B800", "#FC4E07")) +
#   theme_bw()
# 
# 
# 
# 
# #scale_x_date(date_breaks = "1 month", expand = c(0,0)) 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# #write.csv(data, file = "c:\\ANNA\\BookingPrice.csv", row.names = FALSE)
# 
# #write.xlsx(data, file = "c:\\ANNA\\", sheetName="Booking", 
# #col.names=TRUE, row.names=TRUE, append=FALSE)
# ggplot(joined, aes(x = Price, y = Region)) +
#   geom_density_ridges(aes(fill = Region)) +
#   scale_fill_manual(values = c("red4", "yellow2","navyblue", "purple4" )) +
#   labs(title = 'Цены лето 2019 - BOOKING.COM')
# 
# 
# x<-"Пт 2019-июл-05"
# x <- 'Вт 2019-июн-04'
# 
# # 
# #    FunctionMay <- function(x){
# #     if(str_detect(x, 'май') == 'TRUE'){
# #       #удаляет первые две буквы
# #         x<-str_replace_all(x, substring(x, 1, 2), ' ')
# #       #удаляет пробел
# #         x<-str_replace_all(x, '[[:space:]]', '')
# #       #меняет май на may
# #         x<-gsub("май","may", x)
# #     } else if(str_detect(x, 'июн') == 'TRUE'){
# #         x<-str_replace_all(x, substring(x, 1, 2), ' ')
# #       #удаляет пробел
# #         x<-str_replace_all(x, '[[:space:]]', '')
# #       #меняет июнь на june
# #         x<-gsub("июн","june", x)
# #     } else {
# #         print(x)
# #     }
# #      FunctionMay(x)
# 
# #   
# # data$day<-sapply()
# #   
# #   #############################
# # 
# #   
# #   
# #   ###Reserv 1
# # 
# #   FunctionMay <- function(x){
# #     if(str_detect(x, 'май') == 'TRUE'){
# #       #удаляет первые две буквы
# #       x<-str_replace_all(x, substring(x, 1, 2), ' ')
# #       #удаляет пробел
# #       x<-str_replace_all(x, '[[:space:]]', '')
# #       #меняет may на май
# #       x<-gsub("май","may", x)
# #       print(x)
# #     } else {                  
# #       print("smile")
# #     }
# #   }
# #   
# #   ###########################33
# #   
# #   
# #   FunctionMay <- function(x){
# #     if(x == TRUE){
# #       x<-str_replace_all(x, substring(x, 1, 2), ' ')
# #       x<-gsub("май","may", x)
# #     } else {                  
# #       print("smile")
# #     }
# #   }
# #   
# #   ##########
# #   
# #   RESERV 2
# #   
# #   nctionMay <- function(x){
# #     if(str_detect(x, 'май') == 'TRUE'){
# #       #удаляет первые две буквы
# #       x<-str_replace_all(x, substring(x, 1, 2), ' ')
# #       #удаляет пробел
# #       x<-str_replace_all(x, '[[:space:]]', '')
# #       #меняет май на may
# #       x<-gsub("май","may", x)
# #     } else if(str_detect(x, 'июн') == 'TRUE'){               
# #       x<-str_replace_all(x, substring(x, 1, 2), ' ')
# #       #удаляет пробел
# #       x<-str_replace_all(x, '[[:space:]]', '')
# #       #меняет июнь на june
# #       x<-gsub("июн","june", x)
# #     } else if(str_detect(x, 'июл') == 'TRUE'){
# #       x<-str_replace_all(x, substring(x, 1, 2), ' ')
# #       #удаляет пробел
# #       x<-str_replace_all(x, '[[:space:]]', '')
# #       #меняет июль на july
# #       x<-gsub("июл","july", x)
# #       print(x)
# #     } else {
# #       print(x)
# #     }
# #     
# #     
# #     x <- 5
# #     if(x > 0){
# #       print("Positive number")
# #     }
# #     
# #     rstudio --run-diagnostics
# 
# 
# library(ggplot2)
# theme_set(theme_classic())
# 
# # Histogram on a Categorical variable
# 
# 
# colnames(data)[2] <- 'HotelName'
# colnames(data)[3] <- 'price'
# colnames(data)[4] <- 'RoomType'
# colnames(data)[5] <- 'Occupancy'
# colnames(data)[6] <- 'Refund'
# colnames(data)[7] <- 'Breakfast'
# colnames(data)[8] <- 'PayMethod'
# colnames(data)[9] <- 'Mlos'
