library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
income=read.csv("F:/Datasets/income.csv")
print(income)
print(summary(income))
print(head(income))
hist(income$happiness)
plot(happiness ~ income,data=income)
inc_linear=lm(happiness ~ income,data=income)
print(inc_linear)
print(summary(inc_linear))
par(mfrow=c(2,2))
plot(inc_linear)


income_graph=ggplot(income,aes(x=income,y=happiness))+
  geom_point()
print(income_graph)

income_graph=income_graph + geom_smooth(method="lm",col="red")
print(income_graph)

income_graph=income_graph + 
  stat_regline_equation(label.x=3,label.y=7)
print(income_graph)

income_graph=income_graph + 
  theme_bw()+
  labs(title= "Reorted Happiness as a function of income",
       x="Income (x$10,000)",
       y="Happiness score (0 to 10)")
print(income_graph)