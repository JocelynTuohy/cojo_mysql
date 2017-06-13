# 1. All countries that speak Slovene
# Return: Name of Country, Language, Language Percentage
# Sort: Language Percentage, descending order
SELECT countries.name, languages.language, languages.percentage
FROM countries
JOIN languages ON languages.country_id = countries.id
WHERE languages.language = 'Slovene'
ORDER BY languages.percentage DESC;

# 2. Count of cities for each country
# Return: name of country, number of cities
# Sort: # of cities, descending
SELECT countries.name, COUNT(cities.id)
FROM countries
JOIN cities ON cities.country_id = countries.id
GROUP BY countries.name
ORDER BY COUNT(cities.id) DESC;

# 3. Cities in Mexico with population greater than 500,000
# Sort: population, descending
SELECT cities.name, cities.population
FROM cities
JOIN countries ON countries.id = cities.country_id
WHERE countries.name = 'Mexico' AND cities.population > 500000
ORDER BY cities.population DESC;

# 4. Languages in each country greater than 89%
# Sort: percentage, descending
SELECT countries.name, languages.language, languages.percentage
FROM countries
JOIN languages ON languages.country_id = countries.id
WHERE languages.percentage > 89
ORDER BY languages.percentage DESC;

# 5. All countries with surface area below 501 and population above 100,000
SELECT countries.name, countries.surface_area, countries.population
FROM countries
WHERE countries.surface_area < 501 AND countries.population > 100000;

# 6. All countries with Constitutional Monarchy, capital > 200, life expectancy > 75 years
SELECT countries.name, countries.government_form, countries.capital, countries.life_expectancy
FROM countries
WHERE countries.government_form = 'Constitutional Monarchy' AND countries.life_expectancy > 75 AND countries.capital > 200;
# BOOKMARK--LEFT OFF HERE!

# 7. All Argentine cities within Buenos Aires district, population > 500k
# Return: country name, city name, district, population
SELECT countries.name AS country_name, cities.name AS city_name, cities.district, cities.population AS city_population
FROM countries
JOIN cities ON cities.country_id = countries.id
WHERE cities.district = 'Buenos Aires' AND cities.population > 500000;

# 8. Number of countries by region
# Sort: number of countries, descending
SELECT countries.region, COUNT(countries.id)
FROM countries
GROUP BY countries.region
ORDER BY COUNT(countries.id) DESC;