source('/cloud/project/library.R')

data <- read.csv('/cloud/project/02202019/data.csv')

#pipe to filter and clean for each broad field comparison
data %>%
  filter(year >= 2010 ) %>%
  filter(broad_field == "Education" | broad_field == "Life sciences") %>%

    #baseplot
   ggplot( aes(x = year, y = n_phds, col = major_field)) +
 facet_grid(. ~ broad_field, scale = "free_y", space = "free_y") +
    stat_summary(fun.y = sum, geom = "line")+
  
    #theme formatting
    theme_fivethirtyeight() + 
    ggtitle("PHDs Awarded Annually")+
    geom_hline(yintercept=0,size=1.2,colour="#535353")+
    theme(legend.title = element_blank(),
          legend.direction = "vertical")+
    theme(plot.title = element_text(hjust = 0.5))
