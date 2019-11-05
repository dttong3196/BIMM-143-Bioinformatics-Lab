Class 11: Structural Bioinformatics 1
================

## The PDB Database for Biomolecular Structure Data

> Q1: Determine the percentage of structures solved by X-Ray and
> Electron Microscopy. Percentage for structures solved by X-Ray = 89%
> Percentage for structured solved by Electron Microscopy = 2.5%

> Q2: Determine how many HIV-1 protease structures are in the current
> PDB? 92.7% for proteins of HIV-1 protease structures

Download CSV File From

``` r
data<-read.csv("Data Export Summary.csv")
head(data)
```

    ##   Experimental.Method Proteins Nucleic.Acids Protein.NA.Complex Other
    ## 1               X-Ray   131278          2059               6759     8
    ## 2                 NMR    11235          1303                261     8
    ## 3 Electron Microscopy     2899            32                999     0
    ## 4               Other      280             4                  6    13
    ## 5        Multi Method      144             5                  2     1
    ##    Total
    ## 1 140104
    ## 2  12807
    ## 3   3930
    ## 4    303
    ## 5    152

``` r
(data$Total)
```

    ## [1] 140104  12807   3930    303    152

Total Number of Entries

``` r
sum(data$Total)
```

    ## [1] 157296

Proportion of Entries From Each Method

``` r
(data$Total / sum(data$Total)) * 100
```

    ## [1] 89.0702879  8.1419744  2.4984742  0.1926305  0.0966331

Proportion That Are Protein

``` r
sum(data$Proteins) / sum(data$Total) * 100
```

    ## [1] 92.71437

Significant Figures

``` r
round(sum(data$Proteins) / sum(data$Total) *100, 2)
```

    ## [1] 92.71

## HIV-Pr Structure Analysis

Here we will read the 1HSG PDB structure and select protein component
and write out a **new protein-only** PDB format file. We then do the
same for the ligand (i.e. knwn drug molecule) creating a **ligand-only**
PDB file.

``` r
library(bio3d)
```

``` r
# Read pdb
pdb <- read.pdb("1hsg.pdb")
pdb
```

    ## 
    ##  Call:  read.pdb(file = "1hsg.pdb")
    ## 
    ##    Total Models#: 1
    ##      Total Atoms#: 1686,  XYZs#: 5058  Chains#: 2  (values: A B)
    ## 
    ##      Protein Atoms#: 1514  (residues/Calpha atoms#: 198)
    ##      Nucleic acid Atoms#: 0  (residues/phosphate atoms#: 0)
    ## 
    ##      Non-protein/nucleic Atoms#: 172  (residues: 128)
    ##      Non-protein/nucleic resid values: [ HOH (127), MK1 (1) ]
    ## 
    ##    Protein sequence:
    ##       PQITLWQRPLVTIKIGGQLKEALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYD
    ##       QILIEICGHKAIGTVLVGPTPVNIIGRNLLTQIGCTLNFPQITLWQRPLVTIKIGGQLKE
    ##       ALLDTGADDTVLEEMSLPGRWKPKMIGGIGGFIKVRQYDQILIEICGHKAIGTVLVGPTP
    ##       VNIIGRNLLTQIGCTLNF
    ## 
    ## + attr: atom, xyz, seqres, helix, sheet,
    ##         calpha, remark, call

``` r
#atom.select()
#write.pdb()
#trim.pdb()
# Select chain A
a.inds <- atom.select(pdb, chain="A")
#
```

## Atom Select With “ligand” we only see 45 atoms, with a non-protein nucleic residue of 1 (MK1)

``` r
ligand <- atom.select(pdb, "ligand", value = TRUE)
write.pdb(ligand, file ="1hsg_ligand.pdb")
```

## Atom Select With “protein”

``` r
protein <- atom.select(pdb, "protein", value = TRUE)
write.pdb(protein, file = "1hsg_protein.pdb")
```
