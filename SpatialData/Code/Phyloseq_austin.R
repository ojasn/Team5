library("phyloseq")
OTU = otu_table(Austin_data[,c(12:28)], taxa_are_rows = TRUE)
TAX = tax_table(Austin_data[,c(1:7)])
colnames(TAX)=c('Domain','Phylum','Class','Order','Family','subfamily','otu')
OTU
TAX
physeq = phyloseq(OTU, TAX)
physeq
plot_bar(physeq, fill = 'Phylum')
plot_heatmap(physeq, taxa.label="Phylum")
 plot_bar(physeq, fill = 'Phylum')
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