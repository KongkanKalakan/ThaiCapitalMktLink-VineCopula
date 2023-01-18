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