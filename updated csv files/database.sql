CREATE TABLE locations (
    location_name VARCHAR(30) PRIMARY KEY,
    isoCode VARCHAR(30)
);---------------------------------------------to create locations table

CREATE TABLE vaccinesList (
    location_name VARCHAR(30) NOT NULL,
    vaccines VARCHAR(80) NOT NULL,
    lastObservationDate DATE NOT NULL,
    FOREIGN KEY (location_name) REFERENCES locations(location_name),
    PRIMARY KEY (location_name)
);--------------------------------------------- to create vaccinesList

CREATE TABLE sourceObservation (
    location_name VARCHAR(30) NOT NULL,
    sourceName VARCHAR(30) NOT NULL,
    sourceWebsite VARCHAR(50) NOT NULL,
    FOREIGN KEY (location_name) REFERENCES locations(location_name)
    PRIMARY KEY (location_name)
);--------------------------------------------- to create sourceObservation table


CREATE TABLE vaccinationsByAgeGroup (
    location_name VARCHAR(30) NOT NULL,
    date DATE NOT NULL,
    ageGroup VARCHAR(30) NOT NULL,
    peopleVaccinatedPerHundred INT, 
    peopleFullyVaccinatedPerHundred INT, 
    peopleWithBoosterPerHundred INT,
    FOREIGN KEY (location_name) REFERENCES locations(location_name)
    PRIMARY KEY (location_name, date, ageGroup)
);--------------------------------------------- to create vaccinationsByAgeGroup table

CREATE Table usStateVaccinations (
    date DATE NOT NULL,
    location_name VARCHAR(30) NOT NULL,
    totalVaccinations INT, 
    totalDistributed INT, 
    peopleVaccinated INT, 
    peopleFullyVaccinated INT, 
    dailyVaccinationsRaw INT, 
    dailyVaccinations INT, 
    shareDoseUsed INT, 
    totalBoosters INT,
    PRIMARY KEY (date, location_name)   
);--------------------------------------------- to create usStateVaccinations table

CREATE TABLE vaccinationsByManufactures (
    location_name VARCHAR(30) NOT NULL, 
    date DATE NOT NULL, 
    vaccine VARCHAR(30) NOT NULL, 
    totalVaccinations INT,
    PRIMARY KEY (location_name, date, vaccine)
);--------------------------------------------- to create vaccinationsByManufactures table

CREATE  TABLE vaccinations (
    location_name VARCHAR(30) NOT NULL, 
    date DATE NOT NULL, 
    totalVaccinations INT, 
    peopleVaccinated INT, 
    peopleFullyVaccinated INT, 
    totalBoosters INT, 
    dailyVaccinationsRaw INT, 
    dailyVaccinations INT, 
    dailyPeopleVaccinated INT,
    PRIMARY KEY (date, location_name)
);--------------------------------------------- to create vaccinations table

CREATE TABLE CountryData (
    location_name VARCHAR(30) NOT NULL, 
    date DATE NOT NULL, 
    vaccine VARCHAR(80) NOT NULL, 
    totalVaccinations INT, 
    peopleVaccinated INT, 
    peopleFullyVaccinated INT, 
    totalBoosters INT,
    FOREIGN KEY (location_name) REFERENCES locations(location_name),
    PRIMARY KEY (date, location_name)
);--------------------------------------------- to create CountryData table


CREATE TABLE CountryDataUrl (
    location_name VARCHAR(30) NOT NULL,
    date DATE NOT NULL,
    source_url VARCHAR(80) NOT NULL,
    FOREIGN KEY (location_name) REFERENCES locations(location_name),
    PRIMARY KEY (date, location_name) 
);--------------------------------------------- to create CountryData with source_Url table
