create table ott(	show_id  integer,	
	"type" varchar(100) ,	
	title varchar(500),	
	director varchar(60),	
	"Cast" text,	
	country  varchar(50),	
	date_added	 date,
	release_year integer,
	rating varchar(50),	
	duration varchar(50),	
	listed_in text,	
	description text			
);

select * from ott

 alter table ott
 alter column country type text

1 --count the number of movies vs tv show


 select typee, count(*) as total_count from ott
 group by typee;

2 --find the most common rating for movies and tvshows
 
select unique(rating) from ott

select * from



 3--list all movies released on specific year 2020

select typee, title, release_year from ott
where release_year = '2020' and
typee = 'Movie'

4 --find the top 5 countries with a most content on netflix

select country,
count(show_id) as total_content
from ott
group by country
order by total_content desc
limit 5


5 --identify the longest movie

select typee, duration from ott
where typee = 'Movie' and
duration = (select max(duration)from ott)

6 --find content added in last five year
select * from ott
where date_added >= current_date - interval '5 years'


7 --list all movies that are documentry

select typee, title, listed_in from ott
where listed_in = 'Documentaries'

SELECT * FROM ott
WHERE listed_in LIKE '%Documentaries'

8 --find all the content without a director

	select * from ott
	where director is null

9 --count the number of content item on each genre



10 -- List all TV shows with more than 5 seasons
select * from ott
where typee = 'TV Show' 
and cast(split_part(duration, ' ',1)as int)>5


11 -- Find all the movies/TV shows by director 'Rajiv Chilaka'

select typee, count(*), director from ott
group by typee, director
having director = 'Rajiv Chilaka'


12 -- Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT * FROM netflix
WHERE 
	casts LIKE '%Salman Khan%'
	AND 
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10




	










	
 
	







