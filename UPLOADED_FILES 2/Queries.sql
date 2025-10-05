WITH DailyAverage AS (
    SELECT
        date,
        AVG(dailyVaccinations) AS avgDailyVaccinations
    FROM usStateVaccinations
    GROUP BY date
)
SELECT
    us.location_name AS "Country Name (CN)",
    us.totalVaccinations AS "Total Vaccinations (administered to date)",
    us.dailyVaccinations AS "Daily Vaccinations",
    us.date AS "Date"
FROM usStateVaccinations us
INNER JOIN DailyAverage da ON us.date = da.date
WHERE us.dailyVaccinations > da.avgDailyVaccinations
ORDER BY us.date, us.location_name;
-------------------------------------------Query to display List the country that has more than average 
------------------------------number of people taking vaccines in each observation day recorded in the dataset among all countries


WITH CountryCumulative AS (
    SELECT
        location_name AS "Country",
        SUM(totalVaccinations) AS "Cumulative Doses"
    FROM usStateVaccinations
    GROUP BY location_name
)
SELECT
    "Country",
    "Cumulative Doses"
FROM CountryCumulative
WHERE "Cumulative Doses" > (
    SELECT AVG("Cumulative Doses") FROM CountryCumulative
);
--------------------------------------------Query to display the countries with more than the
-------------------- average cumulative numbers of COVID-19 doses administered by each country 

SELECT
    location_name AS "Country",
    vaccines AS "Vaccine Type"
FROM vaccinesList
ORDER BY "Country";
--------------------------------------------Query to display the Produce a list of countries
----------------------- with the vaccine types being taken in each country.

SELECT
    strftime('%Y-%W', date) AS "Date",
    SUM(CASE WHEN location_name = 'Australia' THEN peopleFullyVaccinated ELSE 0 END) AS "Australia",
    SUM(CASE WHEN location_name = 'Germany' THEN peopleFullyVaccinated ELSE 0 END) AS "Germany",
    SUM(CASE WHEN location_name = 'England' THEN peopleFullyVaccinated ELSE 0 END) AS "England",
    SUM(CASE WHEN location_name = 'France' THEN peopleFullyVaccinated ELSE 0 END) AS "France"
FROM vaccinations
WHERE strftime('%Y', date) IN ('2021', '2022')
GROUP BY strftime('%Y-%W', date)
ORDER BY "Date";
-----------------query to display countries compare in the speed of their vaccine administration
-----------------to Produce a report that lists all the observation weeks in 2021 and 2022

WITH MaxVaccinations AS (
    SELECT
        cu.location_name AS "Country",
        cu.source_url AS "Source Name (URL)",
        MAX(cd.totalVaccinations) AS "Biggest total Administered Vaccines"
    FROM CountryData cd
    INNER JOIN CountryDataUrl cu ON cd.location_name = cu.location_name AND cd.date = cu.date
    GROUP BY "Country", "Source Name (URL)"
)
SELECT
    "Country",
    "Source Name (URL)",
    "Biggest total Administered Vaccines"
FROM MaxVaccinations
ORDER BY "Source Name (URL)";
------------------ query to display different data sources used to produce the dataset. Produce a report showing the biggest total
-----------------number of vaccines administered in each country

