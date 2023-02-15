
# Loading Packages
library(annotate) 

# Running BLAST
Blast=blastSequences(UnknSeq, timeout=240, hitListSize=10, as='data.frame')

# Saving Blast as a file to load in Analysis
write.csv(Blast, "Blast.csv")

