
library(ggplot2)
library(gsheet)
library(stringr)
library(curl)
library(dplyr)
library(lubridate)

data <- gsheet2tbl('https://drive.google.com/open?id=1DO_VldRlFXCQYBAbFmFjoQRKYj8zbBuK')

colnames(data)[2] <- 'Hotel'


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
                "Courtyard by Marriott Sochi Krasnaya Polyana")
                #32

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
              "апартаменты",
              #10 "Gorky Hotel Suites (ex. Solis Sochi Suites)"
              "5 зезд", 
              #11 "Rixos Krasnaya Polyana Sochi",
              "5 зезд",
              #12 "Novotel Resort Krasnaya Polyana Sochi"
              "5 зезд",
              #13 Grand Hotel Polyana"
              "5 зезд", 
              #14 Radisson Rosa Khutor Hotel"
              "5 зезд",
              #15 Sochi Marriott Krasnaya Polyana Hotel"
              "4 зезды", 
              #16 "Dolina 960 Hotel",
              "4 зезды", 
              #17  "Polyana 1389 Hotel & Spa",
              "4 зезды", 
              #18  "Rosa Khutor Chalet",   
              "4 зезды",
              #19  "Medical Spa Hotel Rosa Springs", 
              "1-3 звезды",
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
              "Courtyard by Marriott Sochi Krasnaya Polyana")
              #32
        

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
                                                                "Гокри-Город")
                             #32  "Courtyard by Marriott Sochi Krasnaya Polyana"
                                                 

                                               
                              
                    
              
              
              
names_category <- data.frame(Hotel, Category,  Region)
joined <- left_join(data, names_category, by="Hotel")




colnames(joined)[3] <- 'price'

joined$Price <- str_replace_all(joined$price, '[^[:alnum:]]', ' ')
joined$Price <- as.numeric(joined$price)
is.numeric(joined$price)

colnames(joined)

colnames(joined)[1] <- 'date'
joined$date <- as_date(joined$date)
str(joined)


############################## ##########################
############################## ##########################
############################## ##########################
average<- joined %>%
  group_by(Hotel) %>%
  dplyr::summarize(Mean = mean(Price, na.rm=TRUE))

colnames(joined)

Temp <- joined %>% select(Hotel, Region)
average<-left_join(Temp, joined, by="Hotel")

g <- ggplot(joined, aes(Hotel))
g + geom_bar(aes(fill=Region), width = 0.5) + 
  theme(axis.text.x = element_text(angle=45, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable", 
       subtitle="Manufacturer across Vehicle Classes") 



#####################################################################################
#####################################################################################

Apart<- joined %>% group_by(Category) %>%
select("date", "Hotel", "Price", "Room", "Occupancy", "Refundable", 
       "Category", "Region") %>% filter(Category=="apart")



one_three<- joined %>% group_by(Category) %>%
  select("date", "Hotel", "Price", "Room", "Occupancy", "Refundable", 
         "Category", "Region") %>% filter(Category=="1-3")

four_five<- joined %>% group_by(Category) %>%
  select("date", "Hotel", "Price", "Room", "Occupancy", "Refundable", 
         "Category", "Region") %>% filter(Category=="4-5")

ggplot(four_five, aes(date, Price))+
  scale_x_date(date_breaks = "1 month", date_labels = "%b-%y",expand = c(0,0))+
  geom_point(aes(color = Region, shape = Region))

+
  geom_smooth(aes(color = cyl, fill = cyl), 
              method = "lm", fullrange = TRUE) +
  facet_wrap(~cyl) +
  scale_color_manual(values = c("#00AFBB", "#E7B800", "#FC4E07"))+
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#FC4E07")) +
  theme_bw()




#scale_x_date(date_breaks = "1 month", expand = c(0,0)) 









#write.csv(data, file = "c:\\ANNA\\BookingPrice.csv", row.names = FALSE)

#write.xlsx(data, file = "c:\\ANNA\\", sheetName="Booking", 
#col.names=TRUE, row.names=TRUE, append=FALSE)
ggplot(joined, aes(x = Price, y = Region)) +
  geom_density_ridges(aes(fill = Region)) +
  scale_fill_manual(values = c("red4", "yellow2","navyblue", "purple4" )) +
  labs(title = 'Цены лето 2019 - BOOKING.COM')


x<-"Пт 2019-июл-05"
x <- 'Вт 2019-июн-04'

# 
#    FunctionMay <- function(x){
#     if(str_detect(x, 'май') == 'TRUE'){
#       #удаляет первые две буквы
#         x<-str_replace_all(x, substring(x, 1, 2), ' ')
#       #удаляет пробел
#         x<-str_replace_all(x, '[[:space:]]', '')
#       #меняет май на may
#         x<-gsub("май","may", x)
#     } else if(str_detect(x, 'июн') == 'TRUE'){
#         x<-str_replace_all(x, substring(x, 1, 2), ' ')
#       #удаляет пробел
#         x<-str_replace_all(x, '[[:space:]]', '')
#       #меняет июнь на june
#         x<-gsub("июн","june", x)
#     } else {
#         print(x)
#     }
#      FunctionMay(x)

#   
# data$day<-sapply()
#   
#   #############################
# 
#   
#   
#   ###Reserv 1
# 
#   FunctionMay <- function(x){
#     if(str_detect(x, 'май') == 'TRUE'){
#       #удаляет первые две буквы
#       x<-str_replace_all(x, substring(x, 1, 2), ' ')
#       #удаляет пробел
#       x<-str_replace_all(x, '[[:space:]]', '')
#       #меняет may на май
#       x<-gsub("май","may", x)
#       print(x)
#     } else {                  
#       print("smile")
#     }
#   }
#   
#   ###########################33
#   
#   
#   FunctionMay <- function(x){
#     if(x == TRUE){
#       x<-str_replace_all(x, substring(x, 1, 2), ' ')
#       x<-gsub("май","may", x)
#     } else {                  
#       print("smile")
#     }
#   }
#   
#   ##########
#   
#   RESERV 2
#   
#   nctionMay <- function(x){
#     if(str_detect(x, 'май') == 'TRUE'){
#       #удаляет первые две буквы
#       x<-str_replace_all(x, substring(x, 1, 2), ' ')
#       #удаляет пробел
#       x<-str_replace_all(x, '[[:space:]]', '')
#       #меняет май на may
#       x<-gsub("май","may", x)
#     } else if(str_detect(x, 'июн') == 'TRUE'){               
#       x<-str_replace_all(x, substring(x, 1, 2), ' ')
#       #удаляет пробел
#       x<-str_replace_all(x, '[[:space:]]', '')
#       #меняет июнь на june
#       x<-gsub("июн","june", x)
#     } else if(str_detect(x, 'июл') == 'TRUE'){
#       x<-str_replace_all(x, substring(x, 1, 2), ' ')
#       #удаляет пробел
#       x<-str_replace_all(x, '[[:space:]]', '')
#       #меняет июль на july
#       x<-gsub("июл","july", x)
#       print(x)
#     } else {
#       print(x)
#     }
#     
#     
#     x <- 5
#     if(x > 0){
#       print("Positive number")
#     }
#     
#     rstudio --run-diagnostics


library(ggplot2)
theme_set(theme_classic())

# Histogram on a Categorical variable


colnames(data)[2] <- 'HotelName'
colnames(data)[3] <- 'price'
colnames(data)[4] <- 'RoomType'
colnames(data)[5] <- 'Occupancy'
colnames(data)[6] <- 'Refund'
colnames(data)[7] <- 'Breakfast'
colnames(data)[8] <- 'PayMethod'
colnames(data)[9] <- 'Mlos'
colnames(data)[10] <- 'Source'

