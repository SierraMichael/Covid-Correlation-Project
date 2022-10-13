# Covid-Correlation-Project


The Relationship between Covid-19 Tests/Vaccinations and Deaths



Summary
Since January 2020, the United States has experienced a pandemic. As one of the world’s most populous countries, Covid-19 affected citizens significantly. However, each state/territory of the US handled the pandemic differently. One of those elements was testing. As a country, tests were pushed to be as widely available as possible as the pandemic continued. Did states with more widely available tests see a decrease in deaths due to Covid-19? While it was hypothesized that more tests would help to lower the death rate, the opposite occurred. States with a higher number of tests saw the deaths due to Covid-19 grow in numbers.
In winter 2021, Covid-19 vaccines were approved and distributed. It is believed that the vaccine helps lower the symptoms of Covid-19, including death. However, the vaccine was rushed to be developed in a time of crisis. Does the data support the idea that the release of the vaccine has helped to lower the death rate? Using data starting on Dec 14th through April 8th, it was proved, as hypothesized, that as more people received the vaccine, the deaths due to covid decreased.
This report will go into depth to explain the methods and algorithms used to come to these conclusions. An appendix will include visuals to further aid in understanding the results. 
Datasets
My datasets came from the CDC’s Covid Data Tracker. They can be found here: https://covid.cdc.gov/covid-data-tracker/#cases-deaths-testing-trends.   
The first dataset has 64 rows of US states and territories and their data on the Covid-19 virus. Some variables include the cases, deaths, and tests administered for each state/territory. The total number for each variable and the number in the last seven days for each variable will be studied. 
The second dataset has approximately 800 rows. Each row has information on the deaths that occurred on a specific date and the total number of vaccines administered as of that date. The table dates back to December 14th and continues until April 8th 2022. 



Conclusion of First Dataset
The null hypothesis for this dataset was the states with a higher total number of tests would have a lower total number of deaths. After analyzing both the results of Pearson Correlation Test and of linear regression, the null hypothesis was rejected. This was concluded due to a high, positive correlation constant and a statically significant p-value for both methods. The results were visually interpreted and validated through the graphs (see appendix) from linear regression. Based on both methods, it was found that the total number of tests and the total number of deaths in each state have a positive, linear correlation. Based on the results found, the alternate hypothesis that states with a higher total number of tests have a higher total number of deaths, was accepted. This unexpected result could be due to the availability of testing in each state. States with a smaller number of tests may not have been able to test every patient due to their limited number of tests. Thus, certain deaths due Covid-19 may not have been documented due not having the ability to test those patients. However, states with more tests available were able to test and validate the cause of death for Covid-19 patients. 

Conclusion of Second Dataset
The null hypothesis for this dataset was that as more people were fully vaccinated on each day, the number of deaths per day would decrease. The results of the Pearson Correlation Test and linear regression were analyzed, and the null hypothesis for this dataset was accepted. These results were the two variables having a slight, negative correlation coefficient as well as a statistically significant p-value from both methods. This can be visually analyzed and proven through the graphs of the linear regression model. Thus, it was found that the number of people fully vaccinated each day and the number of deaths per day have a negative correlation. This validates the null hypothesis. Thus, while it is not causation, the vaccine is correlated to the number of deaths due to Covid-19 decreasing. 


