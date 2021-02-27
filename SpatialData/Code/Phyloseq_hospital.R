library("phyloseq")
OTU_ind = otu_table(hospital_trim_data[,c(4,5,6,21,22,23,34,35)], taxa_are_rows = TRUE)
TAX_ind = tax_table(hospital_trim_data[,c(1:3)])
colnames(TAX_ind)=c('Phylum','Class','Order')
OTU_ind
TAX_ind
physeq_ind = phyloseq(OTU_ind, TAX_ind)
physeq_ind
plot_bar(physeq_ind, fill = 'Class')

data("physeq_ind")
TopNOTUs <- names(sort(taxa_sums(physeq_ind), TRUE)[1:10])
ent10   <- prune_species(TopNOTUs, physeq_ind)

library(ggplot2)
theme_set(theme_bw())
pal = "Set1"
scale_colour_discrete <-  function(palname=pal, ...){
  scale_colour_brewer(palette=palname, ...)
}
scale_fill_discrete <-  function(palname=pal, ...){
  scale_fill_brewer(palette=palname, ...)
}
par(margin(0,0,0,0))
plot_bar(ent10, fill="Class")
