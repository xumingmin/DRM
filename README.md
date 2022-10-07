DRM(Delta Rank matrix) construction from scRNA-seq data


-------------------------References----------------------------------------
# Here is the source code of the construction of DRM(Delta Rank matrix) construction from gene expression matrix.

References:
Yuanyuan Chen, Hao Zhang, Xiao Sun, “Improving Single-Cell RNA-seq Analysis based on relative expression orderings”.


--------------------------Description---------------------------------------------
The advent of single-cell RNA-sequencing (scRNA-seq) provides an unprecedented opportunity to explore gene expression profiles at the single-cell level. 
However, gene expression values are variables and may be different if measured at different time points or conditions even in the same cell. 
There is an urgent need for more stable and reliable feature variables in single-cell level to depict cell heterogeneity. 
Thus, we construct a new feature matrix called delta rank matrix (DRM) from scRNA-seq data by integrating a priori gene interaction network, 
which transforms the unreliable gene expression value to the stable gene interaction/edge value on a single-cell basis. 
Particularly, it is the first time that we transform the gene-level feature to interaction/edge-level for scRNA-seq data analysis based on relative expression orderings. 
Experiments on various scRNA-seq datasets demonstrated that DRM had better performances than original gene expression matrix (GEM) in cell clustering, 
cell identification and pseudo-trajectory reconstruction. But more importantly, DRM really achieves the fusion of gene expressions and gene interactions,
 and provides a method of measuring gene interactions at single-cell level. Thus DRM can be used to find the change of gene interactions among different cell types.
 This may open up a new way to analyze scRNA-seq data from interaction perspective. 
In addition, DRM provides a new method to construct a cell-specific network for each single cell instead of a group of cells in traditional network construction methods. 
The excellent performance of DRM is due to it extracting richer gene-association information of biological systems and providing more stable characterization for cells.

We construct DRM in three steps. 
Schematic illustration of DRM construction.
(i) Convert GEM with M genes and N cells into rank matrix by ranking all genes according to gene expression values. 
(ii) Collect gene-gene interaction networks, such as gene association networks in pathways, as the priori background network, which consists of L edges. 
(iii) Integrate rank matrix and background network to construct DRM, which is comprised of L rows and N columns.
It's rows and columns are corresponding to edges and cells, respectively, and it can be analyzed by any existing scRNA-seq analysis method.



--------------------------Contact---------------------------------------------
If any problem or suggestion, please contact Yuanyuan Chen (chenyuanyuan@njau.edu.cn)
