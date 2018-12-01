###############seoul

# install.packages("devtools")
# install.packages("Rcpp")
# install.packages("webshot")
library(devtools)
library(Rcpp)
# install_github("cardiomoon/Kormaps")
# install_github("rstudio/leaflet", force=TRUE)
require(Kormaps)
library(webshot)
require(tmap)
require(leaflet)
library(data.table)
library(dplyr)
library(htmltools)

crime <- read.csv("2017crime.csv")
inf <- read.csv("Report3.csv")

Encoding(names(korpopmap2))<-"UTF-8"
Encoding(korpopmap2@data$name)<-"UTF-8"
Encoding(korpopmap2@data$행정구역별_읍면동)<-"UTF-8"

##틀 자르기(서울시만)
korpopmap2@data <- korpopmap2@data[-26:-251,]  ## - 로 행 제거해서 해보자

##데이터 묶기(우리 데이터)
korpopmap2@data <- cbind(korpopmap2@data, crime) # 범죄 데이터와 korpopmap2와 결합
korpopmap2@data <- cbind(korpopmap2@data, inf) # 질병 데이터와 korpopmap2와 결합

##경계 자르기(서울시만)
korpopmap2@polygons<-korpopmap2@polygons[-26:-251] # korpopmap2@polygons 서울 제외 지역 제거

mymap <- korpopmap2@data


palette1<-colorNumeric(palette = "Reds", domain = mymap$범죄_발생_총합)
popup1 <- paste0(mymap$name,"<br> 살인 : ",mymap$살인_발생, "건",
                 "<br> 강도 : ",mymap$강도_발생, "건",
                 "<br> 강간 : ",mymap$강간_발생, "건",
                 "<br> 절도 : ",mymap$절도_발생, "건",
                 "<br> 폭력 : ",mymap$폭력_발생, "건",
                 "<br> 총 범죄 : ",mymap$범죄_발생_총합, "건")
palette2<-colorNumeric(palette = "Purples", domain = mymap$합계)
popup2 <- paste0(mymap$name,"<br> A형간염 : ",mymap$A형간염, "건",
                 "<br> 볼거리 : ",mymap$유행성이하선염, "건",
                 "<br> B형간염 : ",mymap$B형간염, "건",
                 "<br> 수두 : ",mymap$수두, "건",
                 "<br> 결핵 : ",mymap$결핵, "건",
                 "<br> 성홍열 : ",mymap$성홍열, "건",
                 "<br> 쯔쯔가무시 : ",mymap$쯔쯔가무시, "건",
                 "<br> 총 질병 : ",mymap$합계, "건")

multilayer_map<-leaflet(korpopmap2)%>%
  addTiles() %>%
  setView(lat=37.559957 ,lng=126.975302 , zoom=11) %>%
  # setView(lat=as.numeric(x),lng=as.numeric(y) , zoom=12) %>%
  # addMarkers(lat=as.numeric(x), lng=as.numeric(y)) %>%
  addPolygons(stroke=FALSE,
              smoothFactor=0.2,
              fillOpacity=.5,
              popup=popup1,
              color=~palette1(mymap$범죄_발생_총합),
              group="범죄") %>%
  addPolygons(stroke=FALSE,
              smoothFactor=0.2,
              fillOpacity=.5,
              popup=popup2,
              color=~palette2(mymap$합계),
              group="질병") %>%
  addLayersControl(
    baseGroups = c("범죄","질병"),
    position="bottomright",
    options=layersControlOptions(collapsed=FALSE)
  )


# saveWidget(multilayer_map, file="seoulmap.html")
# library(rvest)
# map<-read_html("seoulmap.html", encoding="UTF-8")
# body <- html_nodes(map, "body")
# div <- html_children(body)
# HTML <- paste(as.character(div[1]),as.character(div[2]),as.character(div[3]))
# getwd()
# # source(file="C:/Rstudy/exam1/10_25.R")
# 
# 
# # str(multilayer_map)


