### Data Viz Graph 4

## Tree Map

library(treemap)
library(RColorBrewer)

contributions <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California Campaign Contributions 2016 2.csv")

contributions2 <- contributions[contributions$sector != "Uncoded",]
contributions2 <- contributions[contributions$sector != "Unitemized Contributions",]

contributions3 <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California Campaign Contributions 2016 3.csv")

treemap(contributions,
        index = c("sector"),
        vSize= "contributions")

treemap(contributions,
        index = c("sector","industry"),
        vSize = "contributions")

# Complete one
treemap(contributions3,
        index = c("sector","industry"),
        vSize = "contributions",
        type = "value",
        vColor = "dem_pct")



## Works best with color variable scaled around 0 | make the scale -0.5 to 0.5, rather than 0 to 1 for % to Dems
contributions3$dem_pct_zeroscale <- contributions3$dem_pct - 0.5

display.brewer.pal(10,"RdBu")

brewer.pal(10, "RdBu")

# This does not include Uncoded, unitemized contributions, and contributions from party committees and other candidates
treemap(contributions3,
        index= c("sector","industry"),
        vSize= "contributions",
        type= "value",
        vColor= "dem_pct_zeroscale",
        palette= brewer.pal(10,"RdBu"),
        range= c(-0.5, 0.5),
        title="Campaign Contributions to Federal, State, and Local Candidates in California, 2016",
        fontsize.labels=7,
        title.legend="% of Industry's Contributions to Republican/Democrat")


# to make a granular palette of 100 blues/reds
blue_red_ramp <- colorRampPalette(brewer.pal(10,"RdBu"))(100)






## Stacked bar of proposition finances

props <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California Proposition Finance.csv", header=TRUE)


# Convert to matrix
props_matrix = as.matrix(props)


## BARPLOT
barplot(props_matrix, border = NA, space=0.25,
        xlab="Money Raised",
        main="Money Raised by Proposition Campaigns, 2016",
        col=c("#24CF54","#FF5252"),
        cex.sub=0.7,
        cex.names=0.8,
        horiz=TRUE,
        las=1)

# Sets the legend
legend("topright", 
       legend = c("Yes", "No"), 
       fill = c("#24CF54","#FF5252"),
       bty="n",
       cex=0.8)

# Adds the horizontal grid, nx=NA and ny=NULL make it just horizontal
# grid(nx=NA, ny=NULL, col="#cccccc", lty="dotted")

# More space between y axis labels and title
# mtext(side=2, text="Presidential Votes in CA", line=3.5)