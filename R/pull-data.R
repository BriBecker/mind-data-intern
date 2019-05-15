library(tidyverse)
library(queryr)

district_eid <- 12642
iids_df <- monthlytables::get_iids_from_district(district_eid)
iids_list <- as.list(iids_df$iid)

sys_df <- dw_sda_slice(iids_list, school_year = 2018)
sys_prep <- sys_df %>%
  select(iid, gcd, student_entity_id, total_minutes, content_progress) %>%
  filter(gcd %in% c('GRADE1', 'GRADE2'))

write_csv(sys_prep, 'data/student-year-summary.csv')