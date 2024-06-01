Create Database Movie;
use Movie;

/*   Query
i.	Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.
ii.	Write a SQL query to find those movies, which were released before 1998. Return movie title.
iii. Write a query where it should contain all the data of the movies which were released after 1995 and their movie duration was greater than 120.
iv.	Write a query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
v.	Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and the movie year was 2001.
vi.	Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.
vii.	Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.
viii.	Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Fetch all the fields of actor table. (Hint: Use the IN operator).
ix.	Write a SQL query to find those movies that have been released in countries other than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
x.	Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)
xi.	Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
xii.	Write a SQL query to find the movies with the lowest ratings
xiii.	Finally Mail the script to jeevan.raj@imarticus.com      */
use movies;
select * from movie;


# 1. Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.
select mov_title,mov_year,mov_dt_rel from movie where mov_title ='American Beauty';

# 2. Write a SQL query to find those movies, which were released before 1998. Return movie title.
select mov_title,mov_year from movie where mov_year <1998;

# 3. Write a query where it should contain all the data of the movies which were released after 1995 
#and their movie duration was greater than 120.
select * from movie where mov_year >1995 and mov_time >120;

# 4. Write a query to determine the Top 7 movies which were released in United Kingdom. 
# Sort the data in ascending order of the movie year.
select * from movie where mov_rel_country = 'UK' order by mov_year asc limit 7;

# 5.Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese 
# and the movie year was 2001.
update movie set mov_lang = 'Chinese' where mov_lang = 'Japanese' and mov_year = 2001;
select * from movie where mov_lang = 'Chinese' and mov_year = 2001;     # to cross varify

# 6. Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.
select * from reviewer;
select * from ratings;
select * from movie;
select rev_id, rev_name,mov_title from reviewer as rv inner join ratings as rt using(rev_id) inner join
 movie as m using(mov_id) where mov_title ='slumdog Millionaire';

# 7. Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.
select * from cast;
select * from actor;
select act_fname,act_lname,act_gender,role from cast c inner join
 actor using(act_id) where act_gender != 'M';

# 8. Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. 
# Fetch all the fields of actor table. (Hint: Use the IN operator).
select *,mov_title from actor as a inner join cast as c using(act_id) inner join
 movie as m using(mov_id) where m.mov_title = 'Annie Hall';

# 9. Write a SQL query to find those movies that have been released in countries other than the United Kingdom. 
#Return movie title, movie year, movie time, and date of release, releasing country.
select mov_title,mov_year,mov_dt_rel,mov_rel_country from movie where mov_rel_country !='UK';

# 10. Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)
select * from genres;
select * from movie_genres;
select * from movie;
select gen_title,max(mov_time) as Max_Mov_duration, count(*) as Number_of_movies from genres as g
 inner join movie_genres as mg using(gen_id) inner join movie as m using(mov_id) group by gen_title;

# 11 .Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
select * from cast;
select * from actor;
select * from movie;
create view actor_detail as(select act_fname,act_lname,mov_title,role from cast as c
 inner join actor as a using(act_id) inner join movie as m using(mov_id));
select * from actor_detail;

# 12. Write a SQL query to find the movies with the lowest ratings
select * from ratings;
select * from movie;
select mov_title,num_o_ratings from ratings as r inner join movie as m using(mov_id)
 order by num_o_ratings asc limit 1;












