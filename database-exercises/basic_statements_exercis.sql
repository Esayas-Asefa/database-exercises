-- basic_statements_exercises
# 1
use albums_db;

# 2 Primary key  for the albums table is 'id'
select *
from albums;

# 3 The column 'name' represents the names of the albums.

# 4 The Sales column represents the sale of albums in the millions of each album.

 /* #5 The names of the albums by Pink Floyd are 'The Dark Side of the Moon'
and  'The Wall' */

select *
from albums
where artist = 'Pink Floyd';


# 6 The year Sgt. Peppers Lonely Hearts Club was released was in 1967
select *
from albums
where artist = 'The Beatles';

#7 Genre is Grunge, Alternative rock

select *
from albums
where name = 'Nevermind';

#8 

select *
from albums
where '1989' < release_date
and release_date < '2000';

#9

select name, artist, sales as low_selling_albums
from albums
where sales < '20';