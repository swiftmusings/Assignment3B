setwd("C:/Users/david.ESTESBROS/Downloads/UCI HAR Dataset")
setwd("C:/Users/dave/Downloads/UCI HAR Dataset")

df1<-read.table ("./train/subject_train.txt")

df2<-read.table("./train/y_train.txt")
                
df3<-cbind(df1,df2)

df1a<-read.table ("./test/subject_test.txt")
df2a<-read.table ("./test/y_test.txt")

df4<-read.table("./train/x_train.txt")
df4a<-read.table("./test/x_test.txt")

df5<-cbind(df1,df2,df4)
df5b<-cbind(df1a,df2a,df4a)

df6<-rbind(df5,df5b)



colnames<-c("subject","y_train")
colnames2<-read.table("features.txt")

colnames3<-as.character(colnames2[[2]])

colnames7<-c(colnames,colnames3)

colnames(df6)<-colnames7


names(df6[,grepl("-mean()|-std()",names(df6))])
df7<-df6[,grepl("subject|y_train|-mean()|-std()",names(df6))]



actnames<-read.table("activity_labels.txt")

for( i in 1:NROW(actnames)){
  print (i)
  df7[,2]<-gsub(actnames[i,1],actnames[i,2],df7[,2])
}

df9<-aggregate(df7, by=list(df7$subject,df7$y_train), FUN=mean, na.rm=TRUE)

df9$y_train<-NULL
df9$subject<-NULL

names(df9)[names(df9) == 'Group.1'] <- 'subject'
names(df9)[names(df9) == 'Group.2'] <- 'activity'

write.table(df9,"submission.txt")
