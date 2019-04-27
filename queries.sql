use demo;

select actor_name as List_of_Actors
from actors;

select actor_name as English_Actors
from actors 
where nationality = 'English';

select actor_name as American_Actors
from actors 
where nationality = 'American';

select actor_name as Indian_Actors
from actors 
where nationality = 'Indian';

select actor_name as French_Actors
from actors 
where nationality = 'French';

select actor_name as Chinese_Actors
from actors 
where nationality = 'Chinese';

select actor_name as Bangladeshi_Actors
from actors 
where nationality = 'Bangladeshi';

select distinct nationality
from actors;

select *
from actors
where years_active = '1996-present';

select *
from actors
order by DOB;

select *
from actors
order by DOB desc;

select top 3 *
from actors;

select *
from actors
where actor_name like 'Kate%';

select *
from actors
where actor_name like '%Khan';

select *
from actors
where actor_name like '%nny%';

select *
from actors
where DOB like '1979%';

select *
from actors
where actor_name like '[KAS]%'
order by actor_name;

select *
from actors
where actor_name not like '[KAS]%'
order by DOB;

select *
from actors
where nationality IN ('French', 'Bangladeshi');

select *
from actors
where DOB between '1975' and '1977';

select *
from actors
where nationality = 'English' 
and DOB like '1975%';

select MAX(actor_id)
from actors;

select COUNT(actor_id) as No_of_Actors
from actors;

select COUNT(actor_id) as No_of_Actors, nationality
from actors
group by nationality;

select COUNT(actor_id) as No_of_Actors, nationality
from actors
group by nationality
having COUNT(actor_id)>1;

select actor_name as Actors_of_Same_Nationality_as_Johnny_Depp
from actors
where nationality = (select nationality from actors where actor_name = 'Johnny Depp');

select actor_name as Actors_older_than_Kate_Winslet
from actors
where DOB < (select DOB from actors where actor_name = 'Kate Winslet');

select actor_name as Actors_younger_than_Kate_Winslet
from actors
where DOB > (select DOB from actors where actor_name = 'Kate Winslet');

select actor_name as Actors_older_than_Kate_Winslet_or_Chanchal_Chowdhury
from actors
where DOB < ANY (select DOB from actors where actor_name = 'Kate Winslet' or actor_name = 'Chanchal Chowdhury');

select actor_name as Actors_older_than_Kate_Winslet_and_Chanchal_Chowdhury
from actors
where DOB < ALL (select DOB from actors where actor_name = 'Kate Winslet' or actor_name = 'Chanchal Chowdhury');

(select *
from actors)
except
(select *
from actors
where nationality = 'American');

select LEFT(actor_name,4)
from actors;

select SUBSTRING(years_active, 1, 4) as Starting_Year, actor_name
from actors;

select DATEADD(YEAR,5, DOB) as Five_years_from_birthday, actor_name 
from actors;

select DATEDIFF(YEAR, (select DOB from actors where actor_name = 'Leonardo DiCaprio'), (select DOB from actors where actor_name = 'Kate Winslet'))
as Years_Leo_is_older_than_Kate;

select DATEPART(YEAR, DOB) as Birth_Year, actor_name
from actors;

select DATEPART(MONTH, DOB) as Birth_Month, DATEPART(DAY,DOB) as Birth_Day, actor_name
from actors;

select DATEDIFF(YEAR, DOB, GETDATE()) as Age, actor_name
from actors
order by Age;

select COUNT(distinct category) as No_of_Categories
from awards;

select category, COUNT(category) as No_of_Awards_in_Category
from awards
group by category;

select *
from awards
order by year;

select *
from companies
order by year_of_establishment;

select *
from movies
order by release_date;

select movie_name
from movies
where rating>8;

select *
from movies
where genre like '%romance%'
or genre like '%romantic%'
order by rating;

select *
from tvshows
where number_of_seasons>7;

select AVG(number_of_seasons) as average_no_of_seasons
from tvshows;

select DATEDIFF(year, release_date, getdate()) as No_of_years_since_The_Simpsons_was_released
from tvshows
where tvshow_name = 'The Simpsons';

select actors.actor_id, actors.actor_name, movies.movie_name, movie_character
from actors
join cast_in_movies
on actors.actor_id = cast_in_movies.actor_id
join movies
on (movies.movie_name = cast_in_movies.movie_name and movies.release_date = cast_in_movies.release_date);

select actors.actor_id, actors.actor_name, movies.movie_name, movie_character
from actors
join cast_in_movies
on actors.actor_id = cast_in_movies.actor_id
join movies
on (movies.movie_name = cast_in_movies.movie_name and movies.release_date = cast_in_movies.release_date)
where movies.movie_name = 'Titanic';

select actors.actor_id, actors.actor_name, movies.movie_name, movie_character
from actors
join cast_in_movies
on actors.actor_id = cast_in_movies.actor_id
join movies
on (movies.movie_name = cast_in_movies.movie_name and movies.release_date = cast_in_movies.release_date)
where actors.nationality = 'American';

select actors.actor_id, actors.actor_name, movies.movie_name, movie_character
from actors
join cast_in_movies
on actors.actor_id = cast_in_movies.actor_id
join movies
on (movies.movie_name = cast_in_movies.movie_name and movies.release_date = cast_in_movies.release_date)
where actors.actor_name like '%Leo%';

select actors.actor_id, actors.actor_name, movies.movie_name, movie_character
from actors
join cast_in_movies
on actors.actor_id = cast_in_movies.actor_id
join movies
on (movies.movie_name = cast_in_movies.movie_name and movies.release_date = cast_in_movies.release_date)
where actors.actor_name like '%Aamir%';

select movie_character as Aamir_Khans_character_in_3Idiots
from actors
join cast_in_movies
on actors.actor_id = cast_in_movies.actor_id
join movies
on (movies.movie_name = cast_in_movies.movie_name and movies.release_date = cast_in_movies.release_date)
where actors.actor_name like '%Aamir%'
and movies.movie_name = '3 Idiots';

select actors.actor_id, actors.actor_name, tvshows.tvshow_name, tvshow_character
from actors
join cast_in_tvshows
on actors.actor_id = cast_in_tvshows.actor_id
join tvshows
on (tvshows.tvshow_name = cast_in_tvshows.tvshow_name and tvshows.release_date = cast_in_tvshows.release_date);

select companies.company_id, actors.actor_id, actors.actor_name, managed_by.starting_year, managed_by.finishing_year
from companies
join managed_by
on companies.company_id = managed_by.company_id
join actors
on actors.actor_id = managed_by.actor_id;

select *
from movies
join movies_adaptedfrom
on (movies.movie_name = movies_adaptedfrom.movie_name and movies.release_date = movies_adaptedfrom.release_date)
join books
on books.ISBN = movies_adaptedfrom.ISBN;

select *
from tvshows
join tvshows_adaptedfrom
on (tvshows.tvshow_name = tvshows_adaptedfrom.tvshow_name and tvshows.release_date = tvshows_adaptedfrom.release_date)
join books
on books.ISBN = tvshows_adaptedfrom.ISBN;

select *
from movies
join movies_produced_by
on (movies.movie_name = movies_produced_by.movie_name and movies.release_date = movies_produced_by.release_date)
join companies
on companies.company_id = movies_produced_by.company_id;

select *
from tvshows
join tvshow_produced_by
on (tvshows.tvshow_name = tvshow_produced_by.tvshow_name and tvshows.release_date = tvshow_produced_by.release_date)
join companies
on companies.company_id = tvshow_produced_by.company_id;

select *
from actors
join voice_cast_in
on actors.actor_id = voice_cast_in.actor_id
join books
on books.ISBN = voice_cast_in.ISBN;

select *
from actors
join won
on actors.actor_id = won.actor_id
join awards
on awards.award_id = won.award_id;

select COUNT(won.award_id) as No_of_Awards
from actors
join won
on actors.actor_id = won.actor_id
join awards
on awards.award_id = won.award_id
where actors.actor_name = 'Johnny Depp';

select award_name
from actors
join won
on actors.actor_id = won.actor_id
join awards
on awards.award_id = won.award_id
where actors.actor_name = 'Johnny Depp';

select COUNT(won.award_id) as No_of_Awards, actor_name
from actors
join won
on actors.actor_id = won.actor_id
join awards
on awards.award_id = won.award_id
group by actor_name
having COUNT(won.award_id)>1;

select *
from actors
left join won
on actors.actor_id = won.actor_id
left join awards
on awards.award_id = won.award_id;

select *
from actors
right join won
on actors.actor_id = won.actor_id
join awards
on awards.award_id = won.award_id;

select *
from actors
full join won
on actors.actor_id = won.actor_id
full join awards
on awards.award_id = won.award_id;

