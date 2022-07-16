drop schema if exists projectschema cascade; -- You can choose a different schema name.
create schema projectschema;
set search_path to projectschema;

--Ratio of males vs the ratio of females that occupy 
-- “specialized middle management positions” by province/territory.
-- location denotes the province/territory and ratioMale and ratioFemale 
-- denotes the ratio of males to ratio of females occupying those specialized 
-- middle management positions respectiively 

CREATE TABLE mmSpecialized (
	location TEXT NOT NULL,
	ratioMale FLOAT NOT NULL,
	ratioFemale FLOAT NOT NULL,
	PRIMARY KEY (location),
    FOREIGN KEY (location) REFERENCES provinces(location)
	CHECK ratioMale + ratioFemale = 1
);
-- the ratio of males and ratio of females that occupy 
-- “middle management occupations in retail and wholesale 
-- trade and customer services”.
-- location denotes the province/territory and ratioMale and ratioFemale 
-- denotes the ratio of males to ratio of females occupying those middle management 
-- occupations in retail and wholesale trade and customer services

CREATE TABLE mmRetailCustomerService (
	location TEXT NOT NULL,
	ratioMale FLOAT NOT NULL,
	ratioFemale FLOAT NOT NULL,
	PRIMARY KEY (location),
    FOREIGN KEY (location) REFERENCES provinces(location)
	CHECK ratioMale + ratioFemale = 1
);

-- the ratio of males and the ratio of females that occupy 
-- “middle management occupations in trades, transportation,
-- production and utilities”.
-- location denotes the province/territory, and ratioMale and ratioFemale denotes 
-- the ratio of males and ratio of females occupying occupations in trades, 
-- transportation, production and utilities respectively.

CREATE TABLE mmTradesProduction (
	location TEXT NOT NULL,
	ratioMale FLOAT NOT NULL,
	ratioFemale FLOAT NOT NULL,
	PRIMARY KEY (location),
    FOREIGN KEY (location) REFERENCES provinces(location),
	CHECK ratioMale + ratioFemale = 1
);

-- ratio of males and the ratio of females that occupy 
-- “senior management positions”. 
-- location denotes the province/territory, and ratioMale 
-- and ratioFemale denotes the ratio of males and ratio of
-- females occupying senior management positions

CREATE TABLE mmSenior (
	location TEXT NOT NULL,
	ratioMale FLOAT NOT NULL,
	ratioFemale FLOAT NOT NULL,
	PRIMARY KEY (location),
    FOREIGN KEY (location) REFERENCES provinces(location),
	CHECK ratioMale + ratioFemale = 1
);

-- Gross Domestic Product (GDP) by province/territory
-- location denotes the province/territory and GDP denotes the Gross 
-- Domestic Product in that respective province/territory. 

CREATE TABLE GDP (
	location TEXT NOT NULL,
	GDP FLOAT NOT NULL,
	PRIMARY KEY (location),
    FOREIGN KEY (location) REFERENCES provinces(location)
	CHECK GDP > 0
);

-- relationship status of the population in its respective province/territory. 
-- ratioCouplesMarried represents the number of couples that are 
-- married, ratioCouplesCommonLaw represents number of couples in common law 
-- relationships, and ratioNotInCouple represents number of people that are not in a couple.
-- All these ratios are calculated using the total population aged 15 or more
-- in that province  

CREATE TABLE relationshipStatus (
	location TEXT NOT NULL,
	ratioCouplesMarried FLOAT NOT NULL,
    ratioCouplesCommonLaw FLOAT NOT NULL,
    ratioNotInCouple FLOAT NOT NULL,
	PRIMARY KEY (location),
    FOREIGN KEY (location) REFERENCES provinces(location),
	CHECK ratioCouplesCommonLaw + ratioCouplesMarried + ratioNotInCouple = 1

);

-- enrollment into postsecondary institutions in different 
-- provinces/territories by sex. 
-- location denotes the province/territory, and ratioMale 
-- and ratioFemale denotes the ratio of males and ratio of
-- females in post secondary institutions in each province respectively.
-- Note that the ratio of enrollment is computed using 
-- the total number of students enrolled in post secondary education

CREATE TABLE postsecondaryInstitutions  (
    	location TEXT NOT NULL,
	    enrollmentFemale INT,
        enrollmentMale INT,
	    PRIMARY KEY (location),
        FOREIGN KEY (location) REFERENCES provinces(location),
		CHECK enrollmentFemale + enrollmentMale = 1
);

-- table of provinces and teritories of canada
-- location denotes province and territores in canada 
CREATE TABLE provinces  (
    	location TEXT NOT NULL,
	    PRIMARY KEY (location)
);