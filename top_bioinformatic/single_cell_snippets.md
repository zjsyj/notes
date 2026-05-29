## useful colors themes

```R
gene_expr_colors <- c("#E5E5E5", "#F6D746", "#E55C30", "#84206B", "#140B34", "#000000")
dim_colors <- list(c("#FFC72F", "#1A00F8", "#0955F9", "#CD00F9", "#FF00C2", "#6200F8", "#FF5C21", "#00FF31", "#00FFC6", "#00FF66", "#FF011C", "#FF005D", "#BFFF36", "#00C4FB", "#41FF32"), 
                                 c("#4700F8", "#DE00F9", "#00D5FC", "#00D5FC", "#FF00D2", "#00FF8D", "#FF011C", "#79FF33", "#8E00F9", "#1A00F8", "#FF0045", "#00FF50", "#FF0087", "#00FF32", "#FFD832", "#00FFD6", "#1337F8", "#FF8826", "#D1FF37", "#00FF31", "#0084FA"), 
                                 c("#99C7DD", "#5B9DC5", "#2275AD", "#3E8D9B", "#7DBF8C", "#87CD71", "#4BAE4B", "#2E9636", "#90925D", "#F58F8B", "#F55B5F", "#E92931", "#ED4034", "#F28253", "#FFAC5C", "#FF8E37", "#FF7726", "#E58D60", "#CAA3BC", "#9E7AB5", "#754798", "#845F8D", "#C9B991", "#F3E987", "#CF9956", "#AC4F2B"), 
                                 c("#87D1D4", "#A398D5", "#89D79B", "#D8E19A", "#D76F42", "#FFAD88", "#FFA2BF", "#EC7CDC", "#264785", "#CC494C", "#00A64E", "#3FB8BD", "#428FD4", "#F49195", "#C9D899", "#C069DD", "#F1282B", "#006193"))

```

```R
Figure.2.DEGs.Heatmap.data <- mLu.combined.IMs[["SCT"]]@scale.data[unlist(Figure.2.DEGs.DotPlot.Features), ]
Figure.2.DEGs.Heatmap.data.cell.names <- c(sample(colnames(mLu.combined.IMs)[mLu.combined.IMs$IMs.Subtypes == "CD206hi.IMs"], 2000), sample(colnames(mLu.combined.IMs)[mLu.combined.IMs$IMs.Subtypes == "CD206lo.IMs"], 2000))
Figure.2.DEGs.Heatmap.data <- Figure.2.DEGs.Heatmap.data[, Figure.2.DEGs.Heatmap.data.cell.names]
colors <- c("#F96650", "#FEE8E5")
column_split <- factor(c(rep("CD206hi.IMs", 2000), rep("CD206lo.IMs", 2000)), levels = c(meta.data.list$IMs.Subtypes[1:2]))
row_split <- factor(c(rep("CD206hi.IMs", 20), rep("CD206lo.IMs", 20)), levels = c(meta.data.list$IMs.Subtypes[1:2]))
top_annotation <- columnAnnotation(IMs.Cell.Types = c(rep("CD206hi.IMs", 2000), rep("CD206lo.IMs", 2000)), col = list(IMs.Cell.Types = setNames(colors, meta.data.list$IMs.Subtypes[1:2])), simple_anno_size = unit(0.2, "cm"), show_legend = FALSE, show_annotation_name = FALSE)
right_annotation <- rowAnnotation(IMs.Cell.Types = c(rep("CD206hi.IMs", 20), rep("CD206lo.IMs", 20)), col = list(IMs.Cell.Types = setNames(colors, meta.data.list$IMs.Subtypes[1:2])), simple_anno_size = unit(0.2, "cm"), show_legend = FALSE, show_annotation_name = FALSE)
Figure.2.DEGs.Heatmap <- Heatmap(Figure.2.DEGs.Heatmap.data, use_raster = TRUE, cluster_rows = FALSE, cluster_columns = TRUE, show_column_dend = FALSE, show_column_names = FALSE, column_split = column_split, column_gap = unit(2, "mm"), column_title = NULL, row_split = row_split, row_gap = unit(2, "mm"), row_title = NULL, cluster_column_slices = FALSE, 
                                 row_names_gp = gpar(fontsize = 12, fontface = "italic"), show_heatmap_legend = FALSE, width = unit(3.75, "in"), height = unit(8, "in"), top_annotation = top_annotation, right_annotation = right_annotation)
```

```R
scale_p_val <- scale_fill_gradientn(
    colors = c("red", "yellow", "white"),
    limits = c(0, 0.05),
    guide = guide_colorbar(reverse = TRUE)
)
```

## scanpy 
```python
sc.tl.rank_genes_groups(adata, groupby = "leiden", layer = "lognorm", pts=True)

sc.pl.rank_genes_groups_dotplot(adata, n_genes=5)

markers = sc.get.rank_genes_groups_df(adata, group = "6")
markers.head(10)

# only print the gene names
print(markers.head(10)["names"].to_string(index=False))
```