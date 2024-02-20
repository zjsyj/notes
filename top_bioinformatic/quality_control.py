#!/usr/bin/env python3

# install omicverse with conda
# conda install omicverse -c conda-forge

# after installation, upgrade omicverse
# pip install -U omicverse

# import data and environment
import omicverse as ov
import scanpy as sc

ov.utils.ov_plot_set()
adata = sc.read_10x_h5(
        filename="filtered_feature_bc_matrix.h5",
        backup_url="https://figshare.com/ndownloader/files/39546196",
        )

# adata
adata.var_names_make_unique()
adata.obs_names_make_unique()

adata.var["mt"] = adata.var_names.str.startswith("MT-")
adata.var["ribo"] = adata.var_names.str.startswith(("RPS","RPL"))
adata.var["hb"] = adata.var_names.str.contains(("^HB[^(P)]"))
sc.pp.calculate_qc_metrics(
        adata, qc_vars=["mt", "ribo", "hb"], inplace=True, percent_top=[20], log1p=True
        )
print(adata)

import matplotlib.pyplot as plt
mito_filter = 15
n_counts_filter = 4300
fig, axs = plt.subplots(ncols = 2, figsize = (8,4))
sc.pl.scatter(adata, x='total_counts', y='pct_counts_mt',ax = axs[0], show=False)
sc.pl.scatter(adata, x='total_counts', y='n_genes_by_counts',ax = axs[1], show = False)
#draw horizontal red lines indicating thresholds.
axs[0].hlines(y = mito_filter, xmin = 0, xmax = max(adata.obs['total_counts']), color = 'red', ls = 'dashed')
axs[1].hlines(y = n_counts_filter, xmin = 0, xmax = max(adata.obs['total_counts']), color = 'red', ls = 'dashed')
fig.tight_layout()
plt.show()

