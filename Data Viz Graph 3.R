### Data Viz Graph 3



## Heat map

# Load data
margins <- read.csv("/Users/davidbradford/Documents/Johns Hopkins/Data Visualization/California County Presidential Margins.csv", header=TRUE)

# mins <- c(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
# maxs <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
#margins <- rbind(margins, mins, maxs)

# Order by 2016 Margin
margins <- margins[order(margins$margin_2016, decreasing=FALSE),]

# Subset just margin columns
margins <- subset(margins, select=c("county", "margin_1960", "margin_1964", "margin_1968", "margin_1972", "margin_1976", "margin_1980", "margin_1984", "margin_1988", "margin_1992", "margin_1996", "margin_2000", "margin_2004", "margin_2008", "margin_2012", "margin_2016"))

# Change row names to county names
row.names(margins) <- margins$county

# Get rid of superfluous county column
margins <- margins[,2:16]

# Change column names to just the year
names(margins) <- c("1960", "1964", "1968", "1972", "1976", "1980", "1984", "1988", "1992", "1996", "2000", "2004", "2008", "2012", "2016")

# Convert to data matrix
margins_matrix <- data.matrix(margins)

# Color spectrum, blue -> red
blue_red <- c("#67040e", "#770510", "#880512", "#980614", "#a80716", "#b90718", "#c9081a", "#d9091d", "#ea091f", "#f60e25", "#f61f33", "#f72f42", "#f73f51", "#f85060", "#f9606f", "#f9707e", "#fa818c", "#fb919b", "#fba1aa", "#fcb2b9", "#fdc2c8", "#fdd2d7", "#fee3e5", "#fff3f4", "#fbfcff", "#eceffd", "#dce3fb", "#cdd7fa", "#becaf8", "#afbef6", "#9fb2f5", "#90a5f3", "#8199f1", "#718df0", "#6280ee", "#5374ec", "#4368ea", "#345be9", "#254fe7", "#1944e2", "#1740d3", "#153bc4", "#1437b4", "#1232a5", "#102d96", "#0f2986", "#0d2477", "#0b1f68")

blue_red_2 <- c("#67040e", "#770510", "#880512", "#980614", "#a80716", "#b90718", "#c9081a", "#d9091d", "#ea091f", "#f60e25", "#f61f33", "#f72f42", "#f73f51", "#f85060", "#f9606f", "#f9707e", "#fa818c", "#fb919b", "#fba1aa", "#fcb2b9", "#fdc2c8", "#fdd2d7", "#dce3fb", "#cdd7fa", "#becaf8", "#afbef6", "#9fb2f5", "#90a5f3", "#8199f1", "#718df0", "#6280ee", "#5374ec", "#4368ea", "#345be9", "#254fe7", "#1944e2", "#1740d3", "#153bc4", "#1437b4", "#1232a5", "#102d96", "#0f2986", "#0d2477", "#0b1f68")

# Heat map
margins_heatmap <- heatmap(margins_matrix, Rowv=NA, Colv=NA,
                        col=blue_red_2,
                        scale="none", margins=c(5,10),
                        main="Presidential Vote Margins in California Counties, 1960-2016")

# Heat map with more colors in the heat map, I think?
blue_red_ramp <- colorRampPalette(brewer.pal(10,"RdBu"))(100)

margins_heatmap <- heatmap(margins_matrix, Rowv=NA, Colv=NA,
                           col=blue_red_ramp,
                           scale="none", margins=c(5,10),
                           main="Presidential Vote Margins in California Counties, 1960-2016")





## Parallel coordinates plot