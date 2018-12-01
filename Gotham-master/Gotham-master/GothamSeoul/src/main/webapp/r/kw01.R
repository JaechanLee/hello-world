library(rvest)
url <- "https://weather.com/ko-KR/weather/hourbyhour/l/KSST0387:1:KS"
text <- read_html(url, encoding="UTF-8")


nodes<- html_nodes(text,"table div.hourly-time")
kw1 <- html_text(nodes ,trim=TRUE)
kw1 <- unlist(kw1)

nodes<- html_nodes(text,"table div.hourly-date")
kw2 <- html_text(nodes ,trim=TRUE)
kw2 <- gsub("요일","",kw2)
kw2 <- unlist(kw2)

nodes<- html_nodes(text,"table td.temp > span")
kw4 <- html_text(nodes ,trim=TRUE)
kw4 <- unlist(kw4)
kw4 <- gsub("°","",kw4)

nodes<- html_nodes(text,"table td.feels > span")
kw5 <- html_text(nodes ,trim=TRUE)
kw5 <- unlist(kw5)
kw5 <- gsub("°","",kw5)

result <- cbind(kw1,kw2,kw4,kw5)
result_v <- as.data.frame(result, stringsAsFactors=FALSE)

hour <- as.numeric(substr(result_v$kw1, 1, 2))
day <- as.numeric(format(Sys.Date(), "%d"))
convert_f <- F
if(hour[1] > 9) {
  convert_f <- T
} 
xlabel <- sapply(hour, function(x) { 
  dd <- ifelse(convert_f == T & x < 9, day+1, day); 
  return (paste(dd, "일 ", x, "시", sep=""))
})

plot(result_v$kw4, type="o", col="blue", ylim=c(-25, 30), axes=F, ann=F)   
lines(result_v$kw5, type="o", pch=16, col="red", ylim=c(-25, 30)) 
axis(1, 1:16, xlabel, las=2, cex=0.8) 
axis(2, c(-25,-20,-15,-10, -5, 0, 5, 10,15,20,25,30)) 
title(main="실시간 온도")
legend(1,-20,c("온도 °","체감 온도 °"),cex=0.6,col=c("blue","red"),lty=1)