library(dplyr)

cr_data <- read.csv("2017년.csv")

ratio <- function(a,b) {
  if(a!=0) {
    return(b/a*100)
  }else {
    return(100)
  }
}



##종로구
종로구 <- cr_data %>% 
  filter(구분=='종로' | 구분=='혜화')
종로<-cr_data %>%
  filter(구분=='종로') %>%
  select(건수)
tmp1<-c(종로[1,1],종로[2,1],0,종로[3,1],종로[4,1],0,종로[5,1],종로[6,1],0,종로[7,1],종로[8,1],0,종로[9,1],종로[10,1],0)
tmp<-tmp1
혜화<-cr_data %>%
  filter(구분=='혜화') %>%
  select(건수)
tmp2<-c(혜화[1,1],혜화[2,1],0,혜화[3,1],혜화[4,1],0,혜화[5,1],혜화[6,1],0,혜화[7,1],혜화[8,1],0,혜화[9,1],혜화[10,1],0)
tmp<-tmp1+tmp2
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-matrix(tmp, nrow=1, ncol=15, byrow=TRUE)


#중구
중구 <- cr_data %>% 
  filter(구분=='중부' | 구분=='남대문')
중부<-cr_data %>%
  filter(구분=='중부') %>%
  select(건수)
tmp1<-c(중부[1,1],중부[2,1],0,중부[3,1],중부[4,1],0,중부[5,1],중부[6,1],0,중부[7,1],중부[8,1],0,중부[9,1],중부[10,1],0)
tmp<-tmp1
남대문<-cr_data %>%
  filter(구분=='남대문') %>%
  select(건수)
tmp2<-c(남대문[1,1],남대문[2,1],0,남대문[3,1],남대문[4,1],0,남대문[5,1],남대문[6,1],0,남대문[7,1],남대문[8,1],0,남대문[9,1],남대문[10,1],0)

tmp<-tmp1+tmp2

tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)




##용산구
용산구 <- cr_data %>% 
  filter(구분=='용산')

용산<-cr_data %>%
  filter(구분=='용산') %>%
  select(건수)
tmp1<-c(용산[1,1],용산[2,1],0,용산[3,1],용산[4,1],0,용산[5,1],용산[6,1],0,용산[7,1],용산[8,1],0,용산[9,1],용산[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)


##성동구
성동구 <- cr_data %>% 
  filter(구분=='성동')
성동<-cr_data %>%
  filter(구분=='성동') %>%
  select(건수)
tmp1<-c(성동[1,1],성동[2,1],0,성동[3,1],성동[4,1],0,성동[5,1],성동[6,1],0,성동[7,1],성동[8,1],0,성동[9,1],성동[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)
##crime<-crime[-5,]



##광진구
광진구 <- cr_data %>% 
  filter(구분=='광진')

광진<-cr_data %>%
  filter(구분=='광진') %>%
  select(건수)
tmp1<-c(광진[1,1],광진[2,1],0,광진[3,1],광진[4,1],0,광진[5,1],광진[6,1],0,광진[7,1],광진[8,1],0,광진[9,1],광진[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##동대문구
동대문구 <- cr_data %>% 
  filter(구분=='동대문')

동대문<-cr_data %>%
  filter(구분=='동대문') %>%
  select(건수)
tmp1<-c(동대문[1,1],동대문[2,1],0,동대문[3,1],동대문[4,1],0,동대문[5,1],동대문[6,1],0,동대문[7,1],동대문[8,1],0,동대문[9,1],동대문[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##중랑구
중랑구 <- cr_data %>% 
  filter(구분=='중랑')

중랑<-cr_data %>%
  filter(구분=='중랑') %>%
  select(건수)
tmp1<-c(중랑[1,1],중랑[2,1],0,중랑[3,1],중랑[4,1],0,중랑[5,1],중랑[6,1],0,중랑[7,1],중랑[8,1],0,중랑[9,1],중랑[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##성북구
성북구 <- cr_data %>% 
  filter(구분=='성북' | 구분=='종암')
성북<-cr_data %>%
  filter(구분=='성북') %>%
  select(건수)
tmp1<-c(성북[1,1],성북[2,1],0,성북[3,1],성북[4,1],0,성북[5,1],성북[6,1],0,성북[7,1],성북[8,1],0,성북[9,1],성북[10,1],0)
tmp<-tmp1

종암<-cr_data %>%
  filter(구분=='종암') %>%
  select(건수)
tmp2<-c(종암[1,1],종암[2,1],0,종암[3,1],종암[4,1],0,종암[5,1],종암[6,1],0,종암[7,1],종암[8,1],0,종암[9,1],종암[10,1],0)

tmp<-tmp1+tmp2

tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)


##강북구
강북구 <- cr_data %>% 
  filter(구분=='강북')

강북<-cr_data %>%
  filter(구분=='강북') %>%
  select(건수)
tmp1<-c(강북[1,1],강북[2,1],0,강북[3,1],강북[4,1],0,강북[5,1],강북[6,1],0,강북[7,1],강북[8,1],0,강북[9,1],강북[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)


##도봉구
도봉구 <- cr_data %>% 
  filter(구분=='도봉')

도봉<-cr_data %>%
  filter(구분=='도봉') %>%
  select(건수)
tmp1<-c(도봉[1,1],도봉[2,1],0,도봉[3,1],도봉[4,1],0,도봉[5,1],도봉[6,1],0,도봉[7,1],도봉[8,1],0,도봉[9,1],도봉[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)


##노원구
노원구 <- cr_data %>% 
  filter(구분=='노원')

노원<-cr_data %>%
  filter(구분=='노원') %>%
  select(건수)
tmp1<-c(노원[1,1],노원[2,1],0,노원[3,1],노원[4,1],0,노원[5,1],노원[6,1],0,노원[7,1],노원[8,1],0,노원[9,1],노원[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)


##은평구
은평구 <- cr_data %>% 
  filter(구분=='서부' | 구분=='은평')

서부<-cr_data %>%
  filter(구분=='서부') %>%
  select(건수)
tmp1<-c(서부[1,1],서부[2,1],0,서부[3,1],서부[4,1],0,서부[5,1],서부[6,1],0,서부[7,1],서부[8,1],0,서부[9,1],서부[10,1],0)
tmp<-tmp1

은평<-cr_data %>%
  filter(구분=='은평') %>%
  select(건수)
tmp2<-c(은평[1,1],은평[2,1],0,은평[3,1],은평[4,1],0,은평[5,1],은평[6,1],0,은평[7,1],은평[8,1],0,은평[9,1],은평[10,1],0)

tmp<-tmp1+tmp2

tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)




##서대문구
서대문구 <- cr_data %>% 
  filter(구분=='서대문')

서대문<-cr_data %>%
  filter(구분=='서대문') %>%
  select(건수)
tmp1<-c(서대문[1,1],서대문[2,1],0,서대문[3,1],서대문[4,1],0,서대문[5,1],서대문[6,1],0,서대문[7,1],서대문[8,1],0,서대문[9,1],서대문[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##마포구
마포구 <- cr_data %>% 
  filter(구분=='마포')

마포<-cr_data %>%
  filter(구분=='마포') %>%
  select(건수)
tmp1<-c(마포[1,1],마포[2,1],0,마포[3,1],마포[4,1],0,마포[5,1],마포[6,1],0,마포[7,1],마포[8,1],0,마포[9,1],마포[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##양천구
양천구 <- cr_data %>% 
  filter(구분=='양천')

양천<-cr_data %>%
  filter(구분=='양천') %>%
  select(건수)
tmp1<-c(양천[1,1],양천[2,1],0,양천[3,1],양천[4,1],0,양천[5,1],양천[6,1],0,양천[7,1],양천[8,1],0,양천[9,1],양천[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##강서구
강서구 <- cr_data %>% 
  filter(구분=='강서')

강서<-cr_data %>%
  filter(구분=='강서') %>%
  select(건수)
tmp1<-c(강서[1,1],강서[2,1],0,강서[3,1],강서[4,1],0,강서[5,1],강서[6,1],0,강서[7,1],강서[8,1],0,강서[9,1],강서[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##구로구
구로구 <- cr_data %>% 
  filter(구분=='구로')

구로<-cr_data %>%
  filter(구분=='구로') %>%
  select(건수)
tmp1<-c(구로[1,1],구로[2,1],0,구로[3,1],구로[4,1],0,구로[5,1],구로[6,1],0,구로[7,1],구로[8,1],0,구로[9,1],구로[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##금천구
금천구 <- cr_data %>% 
  filter(구분=='금천')

금천<-cr_data %>%
  filter(구분=='금천') %>%
  select(건수)
tmp1<-c(금천[1,1],금천[2,1],0,금천[3,1],금천[4,1],0,금천[5,1],금천[6,1],0,금천[7,1],금천[8,1],0,금천[9,1],금천[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##영등포구
영등포구 <- cr_data %>% 
  filter(구분=='영등포')

영등포<-cr_data %>%
  filter(구분=='영등포') %>%
  select(건수)
tmp1<-c(영등포[1,1],영등포[2,1],0,영등포[3,1],영등포[4,1],0,영등포[5,1],영등포[6,1],0,영등포[7,1],영등포[8,1],0,영등포[9,1],영등포[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##동작구
동작구 <- cr_data %>% 
  filter(구분=='동작')

동작<-cr_data %>%
  filter(구분=='동작') %>%
  select(건수)
tmp1<-c(동작[1,1],동작[2,1],0,동작[3,1],동작[4,1],0,동작[5,1],동작[6,1],0,동작[7,1],동작[8,1],0,동작[9,1],동작[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##관악구
관악구 <- cr_data %>% 
  filter(구분=='관악')

관악<-cr_data %>%
  filter(구분=='관악') %>%
  select(건수)
tmp1<-c(관악[1,1],관악[2,1],0,관악[3,1],관악[4,1],0,관악[5,1],관악[6,1],0,관악[7,1],관악[8,1],0,관악[9,1],관악[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)


##서초구
서초구 <- cr_data %>% 
  filter(구분=='방배' | 구분=='서초')

방배<-cr_data %>%
  filter(구분=='방배') %>%
  select(건수)
tmp1<-c(방배[1,1],방배[2,1],0,방배[3,1],방배[4,1],0,방배[5,1],방배[6,1],0,방배[7,1],방배[8,1],0,방배[9,1],방배[10,1],0)
tmp<-tmp1

서초<-cr_data %>%
  filter(구분=='서초') %>%
  select(건수)
tmp2<-c(서초[1,1],서초[2,1],0,서초[3,1],서초[4,1],0,서초[5,1],서초[6,1],0,서초[7,1],서초[8,1],0,서초[9,1],서초[10,1],0)

tmp<-tmp1+tmp2

tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##강남구
강남구 <- cr_data %>% 
  filter(구분=='수서' | 구분=='강남')

수서<-cr_data %>%
  filter(구분=='수서') %>%
  select(건수)
tmp1<-c(수서[1,1],수서[2,1],0,수서[3,1],수서[4,1],0,수서[5,1],수서[6,1],0,수서[7,1],수서[8,1],0,수서[9,1],수서[10,1],0)
tmp<-tmp1

강남<-cr_data %>%
  filter(구분=='강남') %>%
  select(건수)
tmp2<-c(강남[1,1],강남[2,1],0,강남[3,1],강남[4,1],0,강남[5,1],강남[6,1],0,강남[7,1],강남[8,1],0,강남[9,1],강남[10,1],0)

tmp<-tmp1+tmp2

tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##송파구
송파구 <- cr_data %>% 
  filter(구분=='송파')

송파<-cr_data %>%
  filter(구분=='송파') %>%
  select(건수)
tmp1<-c(송파[1,1],송파[2,1],0,송파[3,1],송파[4,1],0,송파[5,1],송파[6,1],0,송파[7,1],송파[8,1],0,송파[9,1],송파[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)


crime<-rbind(crime,tmp)



##강동구
강동구 <- cr_data %>% 
  filter(구분=='강동')

강동<-cr_data %>%
  filter(구분=='강동') %>%
  select(건수)
tmp1<-c(강동[1,1],강동[2,1],0,강동[3,1],강동[4,1],0,강동[5,1],강동[6,1],0,강동[7,1],강동[8,1],0,강동[9,1],강동[10,1],0)
tmp<-tmp1
tmp[seq(3,15,3)] <-c(ratio(tmp[1],tmp[2]),ratio(tmp[4],tmp[5]),ratio(tmp[7],tmp[8]),ratio(tmp[10],tmp[11]),ratio(tmp[13],tmp[14]))
tmp<-as.integer(tmp)

crime<-rbind(crime,tmp)



## make data.frame
colnames(crime)<-c("살인_발생", "살인_검거", "살인_검거율", "강도_발생", "강도_검거", "강도_검거율", "강간_발생", "강간_검거", "강간_검거율", "절도_발생", "절도_검거", "절도_검거율", "폭력_발생", "폭력_검거", "폭력_검거율")

crime<-as.data.frame(crime)
crime

gu <- data.frame(c("종로구","중구","용산구","성동구","광진구","동대문구","중랑구","성북구","강북구","도봉구","노원구","은평구","서대문구","마포구","양천구","강서구","구로구","금천구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구"))
colnames(gu) =c("자치구")
crime<-cbind(gu,crime)

## make total data
total1<-sum(crime[1,seq(2,14,3)])
total2<-sum(crime[1,seq(3,15,3)])
for(i in 2:25) {
  total1<-c(total1, sum(crime[i,seq(2,14,3)]))  # 범죄_발생_총합
  total2<-c(total2, sum(crime[i,seq(3,15,3)]))  # 범죄_검거_총합
}
total3<-ratio(total1,total2)
# 검거율_총합
total3<-as.integer(total3)

total <- data.frame(
  범죄_발생_총합 = total1,
  범죄_검거_총합 = total2,
  검거율 = total3
)

crime <- cbind(crime,total)
rownames(crime)<-c("종로구","중구","용산구","성동구","광진구","동대문구","중랑구","성북구","강북구","도봉구","노원구","은평구","서대문구","마포구","양천구","강서구","구로구","금천구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구")




write.csv(crime,"2017crime.csv")




View(crime)
dim(crime)
