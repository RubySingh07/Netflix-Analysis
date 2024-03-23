Create table Netflix(
	show_id varchar Primary key,
	type varchar,
	title varchar,
	director varchar,
	"cast" varchar,
	country varchar,
	date_added varchar,
	release_year varchar,
	rating varchar,
	duration varchar,
	listed_in varchar,
	description varchar
)



Select * from Netflix;

---Is there any missing data? Deal with them accordingly.
Delete from Netflix where date_added is null;

---Using the ‘date_added’ column a new column called ‘year_added’ that only has the year the title was added.
ALTER TABLE Netflix
ALTER COLUMN date_added TYPE date USING date_added::date;

ALTER TABLE Netflix 
ADD COLUMN year_added int;

UPDATE Netflix 
SET year_added = EXTRACT(YEAR FROM date_added);

---Using the ‘date_added’ column a new column called ‘month_added’ that only has the month the title was added.
ALTER TABLE Netflix
ADD COLUMN month_added int;

UPDATE Netflix
SET month_added = EXTRACT(YEAR FROM date_added);

---Check the data types. Anything look odd? Adjust accordingly.
Select * from Netflix;

---What is the most popular release year for movies on Netflix?
Select release_year, count(release_year) as total_release 
from Netflix
group by release_year
order by total_release desc
limit 1;

---What year did Netflix add the most content to its platform?
Select year_added, count(year_added) as movies_added
from Netflix 
group by year_added
order by movies_added desc
limit 1;

---What is the movie with the longest title in the dataset?
SELECT title, LENGTH(title) AS longest_title
FROM Netflix
order by longest_title desc
limit 1;

---What are the top 5 most popular movie genres?
Select listed_in, count(listed_in) total_movies
from Netflix
group by listed_in
order by total_movies desc
limit 5;