library("phyloseq")
OTU = otu_table(home_data[,2], taxa_are_rows = TRUE)
TAX = tax_table(home_data[,1])
colnames(TAX)=c('Phylum')
OTU
TAX
physeq = phyloseq(OTU, TAX)
physeq
plot_bar(physeq, fill = 'Phylum')

data("physeq")
TopNOTUs <- names(sort(taxa_sums(physeq), TRUE)[1:10])
ent10   <- prune_species(TopNOTUs, physeq)

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
plot_bar(ent10, fill="Phylum")
