library(rvest)
url <- "https://weather.com/ko-KR/weather/hourbyhour/l/KSST0387:1:KS"
text <- read_html(url, encoding="UTF-8")

nodes<- html_nodes(text,"table div.hourly-time")
kw1 <- html_text(nodes ,trim=TRUE)
kw1 <- unlist(kw1)

nodes<- html_nodes(text,"table div > span:nth-child(2) > span")
kw6 <- html_text(nodes ,trim=TRUE)
kw6 <- unlist(kw6)
kw6 <- gsub("%","",kw6)

nodes<- html_nodes(text,"table td.humidity > span > span")
kw7 <- html_text(nodes ,trim=TRUE)
kw7 <- unlist(kw7)
kw7 <- gsub("%","",kw7)

nodes<- html_nodes(text,"table td.wind > span")
kw8 <- html_text(nodes ,trim=TRUE)
kw8 <- unlist(kw8)
kw8 <- gsub("동","",kw8)
kw8 <- gsub("서","",kw8)
kw8 <- gsub("남","",kw8)
kw8 <- gsub("북","",kw8)
kw8 <- gsub("잔잔함","0",kw8)
kw8 <- gsub("km/h","",kw8)

result <- cbind(kw1,kw6,kw7,kw8)
result_v <- as.data.frame(result,stringsAsFactors = F) 

hour <- as.numeric(substr(result_v$kw1, 1, 2))
day <- as.numeric(format(Sys.Date(), "%d"))
convert_f <- F # 16개 크롤링,9+16=25 day+1 조건 성사위해
if(hour[1] > 9) {
  convert_f <- T
} 
xlabel <- sapply(hour, function(x) { 
  dd <- ifelse(convert_f == T & x < 9, day+1, day); 
  return (paste(dd, "일 ", x, "시", sep=""))
})

plot(result_v$kw6, type="o", col="blue", ylim=c(0, 100), axes=F, ann=F)  
lines(result_v$kw7, type="o", pch=16, col="red", ylim=c(0, 100))  
lines(result_v$kw8, type="o", pch=16, col="orange", ylim=c(0, 100)) 
axis(1, 1:16, xlabel, las=2, cex=0.8) 
axis(2, c(0, 5, 10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100)) 
title(main="강수량/ 습도/ 바람")
legend(1,100,c("강수량 %","습도 %","바람 km/h"),cex=0.6,col=c("blue","red","orange"),lty=1)
