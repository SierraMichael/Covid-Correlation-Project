# Covid-Correlation-Project









The Relationship between Covid-19 Tests/Vaccinations and Deaths



Introduction
Since January 2020, the United States has experienced a pandemic. As one of the world’s most populous countries, Covid-19 affected citizens significantly. However, each state/territory of the US handled the pandemic differently. One of those elements was testing. As a country, tests were pushed to be as widely available as possible as the pandemic continued. Did states with more widely available tests see a decrease in deaths due to Covid-19? While it was hypothesized that more tests would help to lower the death rate, the opposite occurred. States with a higher number of tests saw the deaths due to Covid-19 grow in numbers.
 In winter 2021, Covid-19 vaccines were approved and distributed. It is believed that the vaccine helps lower the symptoms of Covid-19, including death. However, the vaccine was rushed to be developed in a time of crisis. Does the data support the idea that the release of the vaccine has helped to lower the death rate? Using data starting on Dec 14th through April 8th, it was proved, as hypothesized, that as more people received the vaccine, the deaths due to covid decreased.
This report will go into depth to explain the methods and algorithms used to come to these conclusions. An appendix will include visuals to further aid in understanding the results. 
Datasets
My datasets came from the CDC’s Covid Data Tracker. They can be found here: https://covid.cdc.gov/covid-data-tracker/#cases-deaths-testing-trends.   
The first dataset has 64 rows of US states and territories and their data on the Covid-19 virus. Some variables include the cases, deaths, and tests administered for each state/territory. The total number for each variable and the number in the last seven days for each variable will be studied. 
The second dataset has approximately 800 rows. Each row has information on the deaths that occurred on a specific date and the total number of vaccines administered as of that date. The table dates back to December 14th and continues until April 8th 2022. 
Methods/Analysis of First Dataset
When trying to prove/disprove a correlation between the number of Covid-19 tests distributed in each state and the number of deaths due to Covid-19 in each state, three methods were used. This dataset did not require preparation or cleaning.
First, a Pearson correlation tests was used to find the p-value and the correlation coefficient. The data found was numerical data.

cor.test(state.df$TotalDeaths, state.df$TotalTests, method="pearson")                                          

Pearson's product-moment correlation
data:  state.df$TotalDeaths and state.df$TotalTests
t = 9.5348, df = 51, p-value = 6.38e-13
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.6764343 0.8802490
sample estimates:
      cor 
0.8003883 

The correlation coefficient between the number of tests of each state and the number of deaths of each state was 0.8003883. This shows a strong, positive correlation between both. However, this does not prove causation between the two variables. The p-value found was 6.38e-18 which is both smaller than 0.05 and a number very close to zero. Therefore, the p-value is statistically significant. Analyzing this number, it can be determined that a positive, linear relationship exists between the total number of tests and deaths in each state in America. Therefore, the null hypothesis, a higher number of tests would correlate to a smaller number of deaths, is rejected and an alternative hypothesis is accepted. Therefore, it can be said that a higher number of tests correlates to a higher number of deaths. 
Originally, a Chi-Square test was to be used, however, the data in the datasets was solely numerical data. A Chi-Square is better used to find a p-value of categorical data. Therefore, the results of the Chi-Square tests were inaccurate and unhelpful in analyzing these data sets. 
chisq.test(state.df$TotalDeaths, state.df$TotalTests, correct = FALSE)

	Pearson's Chi-squared test

data:  state.df$TotalDeaths and state.df$TotalTests
X-squared = 2756, df = 2704, p-value = 0.2383

Warning message:
In chisq.test(state.df$TotalDeaths, state.df$TotalTests, correct = FALSE) :
  Chi-squared approximation may be incorrect
The statement above is proved correct by the warning message in the output of the code.

 Lastly, linear regression was used to find a second p-value and an R-squared value. This was then graphed to create a visual representation of the results. 
state.summary <- lm(formula = state.df$TotalDeaths ~ state.df$TotalTests)
summary(state.summary)

Call:
lm(formula = state.df$TotalDeaths ~ state.df$TotalTests)

Residuals:
   Min     1Q Median     3Q    Max 
-38452  -6278  -3377   4115  45054 

Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
(Intercept)         6.390e+03  2.033e+03   3.144  0.00278 ** 
state.df$TotalTests 7.012e-04  7.354e-05   9.535 6.38e-13 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 12070 on 51 degrees of freedom
  (3 observations deleted due to missingness)
Multiple R-squared:  0.6406,	Adjusted R-squared:  0.6336 
F-statistic: 90.91 on 1 and 51 DF,  p-value: 6.38e-13
This data shows a very similar p-value, 6.38e-13, to the one calculated in the Pearson Correlation Test. Thus, using this p-value and F-statistics, it is found that these results are also statistically significant. This further proves the positive, linear relationship between the total number of tests and deaths in each state in America. The multiple R-squared is 0.6406. This implies that 64.06% of the variation in the total number of deaths, can be explained by the total number of tests. However, the residual standard error for this linear regression is 12070 and is something to keep in consideration.  
This data was then graphed in order to visually interpret and further understand the conclusion found (see appendix). 
plot(state.df$TotalTests, state.df$TotalDeaths, xlab= "Total Number of Deaths", 
     ylab="Total Number of Tests", main=" Number of Covid Tests v Deaths")
abline(lm(formula = state.df$TotalDeaths ~ state.df$TotalTests))

Methods/Analysis of Second Dataset
When trying to prove or disprove the correlation between the total number of deaths and total number of vaccines per day, the same three methods were used. This dataset did not require preparation or cleaning.
	The Pearson Correlation Test was used to the find a correlation coefficient and a p-value for this set of data.
cor.test(death.df$NewDeaths, death.df$DailyCountofPeopleFullyVaccinated, method="pearson")

	Pearson's product-moment correlation

data:  death.df$NewDeaths and death.df$DailyCountofPeopleFullyVaccinated
t = -4.0725, df = 479, p-value = 5.442e-05
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.26796070 -0.09508402
sample estimates:
       cor 
-0.1829361

The correlation coefficient between the total number people fully vaccinated each day and the total number of deaths per day have a slight negative correlation. Again, this does not prove causation between the two variables. The p-value, 5.442e-05, was found to be statistically significant because it was less than 0.05 and a number very close to zero. Therefore, a slight, negative, linear relationship exists between the total number people fully vaccinated each day and deaths per day. Thus, the null hypothesis, as the total number people fully vaccinated each day given increases, the number of deaths per day decreases, is accepted. 
	The Chi-Square was also originally chosen to be used for this second dataset as well. However, again, the data in this dataset was solely numerical data. Therefore, a Chi-Square tests, which works with categorical data, is not suited to analyze this data. Thus, the results of the Chi-Square for this dataset are also inaccurate and unhelpful.
chisq.test(death.df$NewDeaths, death.df$DailyCountofPeopleFullyVaccinated, correct=FALSE)
 
	Pearson's Chi-squared test

data:  death.df$NewDeaths and death.df$DailyCountofPeopleFullyVaccinated
X-squared = 208754, df = 208320, p-value = 0.2505

Warning message:
In chisq.test(death.df$NewDeaths, death.df$DailyCountofPeopleFullyVaccinated,  :
  Chi-squared approximation may be incorrect
Again, the warning in the output of the code reinforces that the data found in the Chi-Square is incorrect.

	Linear regression was used to again to find a second p-value and an R-squared value for the second dataset. This was also graphed.
death.summary <- lm(formula= death.df$DailyCountofPeopleFullyVaccinated ~ death.df$NewDeaths)
summary(death.summary)

Call:
lm(formula = death.df$DailyCountofPeopleFullyVaccinated ~ death.df$NewDeaths)

Residuals:
    Min      1Q  Median      3Q     Max 
-562016 -313345 -176248  107201 2015266 

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)    
(Intercept)        583226.97   39113.89  14.911  < 2e-16 ***
death.df$NewDeaths    -94.53      23.21  -4.072 5.44e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 502000 on 479 degrees of freedom
  (326 observations deleted due to missingness)
Multiple R-squared:  0.03347,	Adjusted R-squared:  0.03145 
F-statistic: 16.59 on 1 and 479 DF,  p-value: 5.442e-05
The p-value found using linear regression, 5.44e-05, is almost exactly the same as the p-value found using the Pearson Correlation Test. This validates the results found from the Pearson Correlation Test, using the p-value and F-statistics. It is found, again, that the results are statistically significant. Thus, a slight, negative, linear relationship between the total number people fully vaccinated each day and the number of deaths per day exists and is validated. The Multiple R-Squared value is 0.03347. This implies that 3.347% of the variation in the number deaths per day, can be explained by the number people fully vaccinated each day. However, the residual standard error for this linear regression is 502000, and it is something to keep in consideration.
	This data was then graphed (see appendix) as well in order to visually interpret the results found by linear regression.
plot(death.df$NewDeaths, death.df$DailyCountofPeopleFullyVaccinated,
     xlab="Numbers of People Fully Vaccinated per Day", 
     ylab="Number of Deaths per Day", 
     main="Number of Covid Deaths and Vaccinations per Day")
abline(lm(formula= death.df$DailyCountofPeopleFullyVaccinated ~ death.df$NewDeaths)

Conclusion of First Dataset
The null hypothesis for this dataset was the states with a higher total number of tests would have a lower total number of deaths. After analyzing both the results of Pearson Correlation Test and of linear regression, the null hypothesis was rejected. This was concluded due to a high, positive correlation constant and a statically significant p-value for both methods. The results were visually interpreted and validated through the graphs (see appendix) from linear regression. Based on both methods, it was found that the total number of tests and the total number of deaths in each state have a positive, linear correlation. Based on the results found, the alternate hypothesis that states with a higher total number of tests have a higher total number of deaths, was accepted. This unexpected result could be due to the availability of testing in each state. States with a smaller number of tests may not have been able to test every patient due to their limited number of tests. Thus, certain deaths due Covid-19 may not have been documented due not having the ability to test those patients. However, states with more tests available were able to test and validate the cause of death for Covid-19 patients. 
Conclusion of Second Dataset
The null hypothesis for this dataset was that as more people were fully vaccinated on each day, the number of deaths per day would decrease. The results of the Pearson Correlation Test and linear regression were analyzed, and the null hypothesis for this dataset was accepted. These results were the two variables having a slight, negative correlation coefficient as well as a statistically significant p-value from both methods. This can be visually analyzed and proven through the graphs of the linear regression model. Thus, it was found that the number of people fully vaccinated each day and the number of deaths per day have a negative correlation. This validates the null hypothesis. Thus, while it is not causation, the vaccine is correlated to the number of deaths due to Covid-19 decreasing. 

Recommendations for Future Research
There are several factors that may have contributed to deaths due to Covid-19 that were included in this report. There are potential relations to these variables and deaths due to Covid-19.
1.	Population: Places that are more populous allow for a higher rate of the spread of Covid-19 which could lead to more deaths.
2.	Other Health Complications: People who have other health problems have lower immune systems which makes them more susceptible to getting Covid-19 and dying because of it.
3.	Age: Infants and elderly have lower immune systems are more likely to get Covid-19 and die from it.
4.	Quality of Nearby Hospitals: Not all hospitals were able to adequately help patients and give them the best chance possible against death.

Appendix
Analysis of Plots from Linear Regression
 
This plot visually shows the positive, linear correlation between the total number of deaths and the total number of tests for each state. The slope is steep and positive, showing the high, positive correlation between the two variables.
 
This plot visually shows the negative, linear correlation between the total number of people fully vaccinated per day and the number of deaths per day. The slope is smaller and negative, showing the slight, negative correlation between the two variables.
