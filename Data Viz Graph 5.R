### Data Viz Graph 5

## Urban/Rural Voters

counties <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California County Election Results 2016 2.csv")

counties_1 <- subset(counties, nchs_code==1)
counties_2 <- subset(counties, nchs_code==2)
counties_3 <- subset(counties, nchs_code==3)
counties_4 <- subset(counties, nchs_code==4)
counties_5 <- subset(counties, nchs_code==5)
counties_6 <- subset(counties, nchs_code==6)

# Vertical
boxplot(counties_1$X2016_dem_margin, counties_2$X2016_dem_margin, counties_3$X2016_dem_margin, counties_4$X2016_dem_margin, counties_5$X2016_dem_margin, counties_6$X2016_dem_margin,
        col=c("#01665e","#5ab4ac","#c7eae5","#f6e8c3","#d8b365","#8c510a"),
        main="Clinton and Trump Performance in Urban versus Rural California Counties, 2016",
        frame=F, las=1, cex.axis=0.9, pch=19, cex=0.6, cex.main=0.95,
        ylab="Win Margin (percentage points)",
        xlab="Urban-Rural Classification",
        boxwex=0.5, boxcol="#ffffff", whisklty=1, medcol="white")
abline(a = 0, b = 0, lty = 2, lwd = 1, col="#cccccc")




## White vote

whites <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California White Vote 2016.csv", header=TRUE)

whites_matrix = as.matrix(whites)

barplot(whites_matrix, border = NA, space=0.25,
        xlab="% Vote for President",
        main="White Vote in California by Education and Sex, 2016",
        col=c("#2196F3","#FF5252","#FFC61C"),
        cex.names=0.8,
        horiz=TRUE)


## Ethnicities
ethnicities <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California White Vote 2016 2.csv", header=TRUE)

ethnicities_matrix <- as.matrix(ethnicities)

barplot(ethnicities_matrix, border = NA, space=0.25,
        xlab="% Vote for President",
        main="Vote in California by Ethnicity, 2016",
        col=c("#2196F3","#FF5252","#FFC61C"),
        cex.names=0.8,
        horiz=TRUE)


## White men vs. women
white_gender <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California White Vote 2016 3.csv", header=TRUE)

white_gender_matrix <- as.matrix(white_gender)

barplot(white_gender_matrix, border = NA, space=0.25,
        xlab="% Vote for President",
        main="White Vote in California by Sex, 2016",
        col=c("#2196F3","#FF5252","#FFC61C"),
        cex.names=0.8,
        horiz=TRUE)