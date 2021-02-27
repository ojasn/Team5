library("phyloseq")
OTU_ind = otu_table(Home_school_mix[,c(2:6)], taxa_are_rows = TRUE)
  TAX_ind = tax_table(Home_school_mix[,1])
colnames(TAX_ind)=c('Phylum')
OTU_ind
TAX_ind
physeq_ind = phyloseq(OTU_ind, TAX_ind)
physeq_ind
library(ggplot2)
theme_set(theme_bw())
pal='Spectral'
par(margin(0,0,0,0))
plot_bar(physeq_ind, fill = 'Phylum')

data("physeq_ind")
TopNOTUs <- names(sort(taxa_sums(physeq_ind), TRUE)[1:10])
ent10   <- prune_species(TopNOTUs, physeq_ind)


plot_bar(ent10, fill="Phylum")
