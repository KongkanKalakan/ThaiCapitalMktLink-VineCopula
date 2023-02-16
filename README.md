# ThaiCapitalMktLink-VineCopula

This is the original implementation in the following paper ⚡️ : [Analysis of Thai Capital Market Linkages: Part I. Bivariate Copula Approach](https://www.researchgate.net/publication/362544586_Analysis_of_Thai_Capital_Market_Linkages_Part_I_Bivariate_Copula_Approach). I hope these codes are helpful to you, 🌟!

## Abstract

Analytically thorough understanding of financial-market dynamics is fundamental to the promotion of capital-market innovation, efficiency, and resilience; innovative, efficient, and resilient capital market, in turn, is fundamental to the sustainable economic development of the nation and the robust financial stability of its economy. This paper uses Bivariate Copula (semi-parametric statistics) techniques to analyse probabilistic co-movement amongst 14 variables representing domestic (Thai) and international (US/Emerging Market/Asia) foreign-exchange, fixed-income, and equity market movements, as well as foreign portfolio-investment flows into Thai equity shares and bonds. In addition, by staggering paired time-series w/ time lag on one of the pairs, the resulting copula relationship is suggestive of information flow, similar in spirit to testing for Granger Causality. The methodology pipeline thus developed can be applied to any other time-series pairings of interest, not just those related to Thai financial markets.

## Requirements

- R
    - readxl (or tidyverse)
    - network
    - [VineCopula](https://cran.r-project.org/web/packages/VineCopula/index.html)

## How to Run

```bash
git clone https://github.com/KongkanKalakan/ThaiCapitalMktLink-VineCopula.git
cd ThaiCapitalMktLink-VineCopula/src
mkdir -p data/raw result
```
Download `retnTimeSeries.csv` to `data/raw`

Run `requirements.R` to install initial packages

Change config at `config.R` here

```
INPUT_PATH <- "./data/raw/retnTimeSeries.csv"
OUTPUT_SIM_PATH = "./result/RVineCopula_sim.csv"

COLUMNS_NAME <- c('Date',
                  'SET',
                  'MAI',
                  'ZeroShort',
                  'ZeroLong',
                  'CorpBond',
                  'THB',
                  'EquityFlow',
                  'BondFlow',
                  'EMAsiaEquity',
                  'SP500',
                  'EMBond',
                  'USBond',
                  'EMAsiaFX',
                  'USD')

index_col = "Date"

MATRIX_STRUCTURE = c(2,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 
                     5,  11,  0, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
                     3,  5,  7,  0,  0,  0, 0,  0,  0,  0,  0,  0,  0,  0,
                     11,  3,  5, 14,  0,  0,  0,  0,  0, 0,  0,  0,  0,  0,
                     4,  7,  3,  5,  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,
                     12, 14,  4,  3,  5,  1,  0,  0,  0,  0,  0,  0,  0,  0,
                     10,  8, 12,  4,  3,  5,  9,  0,  0,  0,  0,  0,  0,  0,
                     14,  1, 10, 12,  4,  3,  5,  6,  0,  0,  0,  0,  0,  0,
                     7,  9, 14, 10, 12,  4,  3,  5, 13,  0,  0,  0,  0,  0,
                     13,  6, 13,  8, 10, 12,  4,  3,  5, 10,  0,  0,  0,  0,
                     6,  13,  6,  1, 13, 10, 12,  4,  3,  5, 12,  0,  0,  0,
                     9,  10,  9,  9,  6,  13,  10,  12,  4,  3,  5,  3,  0,  0,
                     8,  4,  1,  6,  9,  6,  13,  10,  12,  4,  3,  5,  4,  0,
                     1, 12,  8, 13,  1,  9,  6,  13,  10,  12,  4,  4,  5,  5
                    )

NUM_DAYS_GENERATE = 50000
PLOT_BRANCHES = FALSE
STRUCTURE_SELECT = FALSE
```

Run `RVineCopulaSelect.R` to find best rvine copula

## Results

<p align="center">
  <img width="500" height="500" src=./figs/RVineCopula_contour.png>
</p>

## Cite (Bibtex)
If you make use of this code in your own work, please cite our paper:
 ```latex
@article{ThaiCapitalMktLinkPart2,
    author = {Nacaskul, Poomjai and Khlaisamniang, Pitikorn and Sukcharoenchaikul, Isariyaporn},
    year = {2022},
    month = {08},
    pages = {},
    title = {Analysis of Thai Capital Market Linkages: Part I. Bivariate Copula Approach}
}
```
