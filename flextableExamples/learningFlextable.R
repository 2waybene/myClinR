setwd("/Users/jyli/myGit/myClinR/flextableExamples")
set_flextable_defaults(
  font.family="Inconsolata", 
  cs.family = "Symbol", 
  eastasia.family = "仿宋")

df = data.frame(
  `标题Title`='微软MS',
  `内容Content`='无题lorem',
  stringsAsFactors = FALSE)

ft = df %>% 
  flextable %>% 
  autofit %>% 
  width(width=1) %>% 
  theme_box()

save_as_docx(ft, path = "reports/df_eastasia.docx")
