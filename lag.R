# R's lag function

# Simple examples of `lag` and `lead` functions
library(tidyverse)

df <- tibble(
  x = c(28, 25, 24, 17, 10),
  lagx = lag(x),
  leadx = lead(x),
  diff = x - lead(x))
df
# # A tibble: 5 x 4
#       x  lagx leadx  diff
#   <dbl> <dbl> <dbl> <dbl>
# 1    28    NA    25     3
# 2    25    28    24     1
# 3    24    25    17     7
# 4    17    24    10     7
# 5    10    17    NA    NA
# tidyverse-way with pipe and mutate
df %>% mutate(diff2 = x - lead(x))
# # A tibble: 5 x 5
#       x  lagx leadx  diff diff2
#   <dbl> <dbl> <dbl> <dbl> <dbl>
# 1    28    NA    25     3     3
# 2    25    28    24     1     1
# 3    24    25    17     7     7
# 4    17    24    10     7     7
# 5    10    17    NA    NA    NA
sessionInfo()
# R version 4.0.1 (2020-06-06)
# Platform: x86_64-pc-linux-gnu (64-bit)
# Running under: Manjaro Linux
# 
# Matrix products: default
# BLAS:   /usr/lib/libblas.so.3.9.0
# LAPACK: /usr/lib/liblapack.so.3.9.0
# 
# locale:
#  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C               LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8     LC_MONETARY=en_US.UTF-8   
#  [6] LC_MESSAGES=en_US.UTF-8    LC_PAPER=en_US.UTF-8       LC_NAME=C                  LC_ADDRESS=C               LC_TELEPHONE=C            
# [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
#  [1] forcats_0.5.0   stringr_1.4.0   dplyr_1.0.0     purrr_0.3.4     readr_1.3.1     tidyr_1.1.0     tibble_3.0.1    ggplot2_3.3.2   tidyverse_1.3.0
# [10] nvimcom_0.9-100
# 
# loaded via a namespace (and not attached):
#  [1] Rcpp_1.0.4.6     cellranger_1.1.0 pillar_1.4.4     compiler_4.0.1   dbplyr_1.4.4     tools_4.0.1      jsonlite_1.6.1   lubridate_1.7.9 
#  [9] lifecycle_0.2.0  nlme_3.1-148     gtable_0.3.0     lattice_0.20-41  pkgconfig_2.0.3  rlang_0.4.6      reprex_0.3.0     cli_2.0.2       
# [17] rstudioapi_0.11  DBI_1.1.0        haven_2.3.1      withr_2.2.0      xml2_1.3.2       httr_1.4.1       fs_1.4.1         generics_0.0.2  
# [25] vctrs_0.3.1      hms_0.5.3        grid_4.0.1       tidyselect_1.1.0 glue_1.4.1       R6_2.4.1         fansi_0.4.1      readxl_1.3.1    
# [33] modelr_0.1.8     blob_1.2.1       magrittr_1.5     backports_1.1.8  scales_1.1.1     ellipsis_0.3.1   rvest_0.3.5      assertthat_0.2.1
# [41] colorspace_1.4-1 utf8_1.1.4       stringi_1.4.6    munsell_0.5.0    broom_0.5.6      crayon_1.3.4    





