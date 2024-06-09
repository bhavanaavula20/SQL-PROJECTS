-------------BILLIONAIRESDATA PROJECT-------

SELECT * FROM class.`billinaiers data`;
use class;
show tables;


----find personName and total worth from Billionairesdata.


SELECT personName , 
sum(finalworth) as totalworth 
FROM class.`billinaiers data`
GROUP BY personName ;

-----find personName,country,source,industries,sum total worth from Billionairesdata.

SELECT  personName,country,source,industries, 
SUM(finalworth)  as totalworth 
FROM  class.`billinaiers data`
GROUP BY personName,country,source,industries
limit 10;

-----find personName,gdp_country,total gdp from Billionairesdata.

SELECT personName,gdp_country,
SUM(gdp_country) as totalgdp
FROM class.`billinaiers data`
GROUP BY  personName,gdp_country
LIMIT 30;

-----find personName,country,source,industries,total worth,total tax from Billionairesdata.

SELECT personName,country,source,industries,cpi_country,
SUM(gdp_country) as totalgdp,
sum(tax_revenue_country_country)as totaltax
FROM class.`billinaiers data`
GROUP BY personName,country,source,industries,cpi_country
LIMIT 10;

-----find industries,total population from Billionairesdata.

SELECT industries, 
SUM(population_country) as totalpopulation
FROM class.`billinaiers data`
GROUP BY industries;

-----find personName,average life_expectancy_country from Billionairesdata.

SELECT personName, 
AVG(life_expectancy_country) as avgoflifeexpectancycountry
FROM class.`billinaiers data`
GROUP BY personName
LIMIT 10;

-----find personName,cpi_country,average life_expectancy_country,total population from Billionairesdata.


SELECT personName,cpi_country,
AVG(total_tax_rate_country)as avgtaxrate,
SUM(population_country) as totalpopulation 
FROM class.`billinaiers data` 
GROUP BY personName,cpi_country
LIMIT 10;

-----find personName,categorys with Technology,Automotive,Fashion & Retail from Billionairesdata.

SELECT personName,category 
FROM class.`billinaiers data`
WHERE category in ("Technology","Automotive","Fashion & Retail");


----find personName,count gender upto 40 from Billionairesdata.


SELECT personName,gender
FROM class.`billinaiers data`
WHERE  gender in ("M","f")
limit 40;






































-



