select GenreID,avg(IMDBScore) from netflix_originals group by GenreID;

select GenreID,avg(IMDBScore) from netflix_originals group by GenreID having avg(IMDBScore) > 7.5;

select Title from netflix_originals order by IMDBScore desc;

select Title,runtime from netflix_originals order by runtime desc limit 10;

select n.title,g.Genre from netflix_originals n left join genre_details g on n.GenreID = g.GenreID;

select Title,IMDBScore,GenreID,
rank() over (partition by GenreID order by IMDBScore desc) as rank_no
from netflix_originals;

select title,IMDBScore 
from netflix_originals 
where IMDBScore > (
   select avg(IMDBScore) 
   from netflix_originals
   );
   
select g.Genre,count(*) as count_netflix_originals 
from netflix_originals n join genre_details g 
on n.GenreID = g.GenreID
group by g.genre
order by count(*);

select g.Genre,count(*) as count_netflix_originals 
from netflix_originals n join genre_details g 
on n.GenreID = g.GenreID
where n.IMDBScore > 8
group by g.genre
having count(*) > 5
order by count(*);

select g.Genre,avg(IMDBScore),count(*) as count_netflix_originals 
from netflix_originals n join genre_details g 
on n.GenreID = g.GenreID
group by g.genre
order by avg(IMDBScore) desc
limit 3;