ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") # creates a list of 3 IDs
library(rentrez)  # loading rentrez package
Bburg<-entrez_fetch(db = "nuccore", 
                    id = ncbi_ids, 
                    rettype = "fasta") # Creates Bburg object from the nuccore database and loads as a FASTA file.
str(Bburg)

Sequences=strsplit(Bburg, split="\n\n") # Splits the sequences by the double return "\n\n"
Sequences=unlist(Sequences) # Unlisting so we can convert to a dataframe

Header=gsub("(^>.*sequence)\\n[ATCG].*", "\\1", Sequences) # Pulls out just the header
Seq=gsub("^>.*sequence\\n([ATCG].*)", "\\1", Sequences) # Pulls out just the sequence
Sequences=data.frame(Name=Header, Sequence=Seq) # Creates a dataframe with header and sequence

Sequences$Sequence=gsub("\n", "", Sequences$Sequence) # Removing "\n" from sequences

write.csv(Sequences, "Sequences.csv")
