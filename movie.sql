use new_schema;


-- Movies Table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    release_year INT,
    genre VARCHAR(50),
    director_id INT,
    duration INT, 
    language VARCHAR(50)
);

INSERT INTO Movies VALUES
(1, 'Inception', 2010, 'Science Fiction', 1, 148, 'English'),
(2, 'The Dark Knight', 2008, 'Action', 1, 152, 'English'),
(3, 'Parasite', 2019, 'Thriller', 2, 132, 'Korean'),
(4, 'Interstellar', 2014, 'Science Fiction', 1, 169, 'English'),
(5, 'The Godfather', 1972, 'Crime', 3, 175, 'English'),
(6, 'Pulp Fiction', 1994, 'Crime', 4, 154, 'English'),
(7, 'The Shawshank Redemption', 1994, 'Drama', 5, 142, 'English'),
(8, 'Fight Club', 1999, 'Drama', 6, 139, 'English'),
(9, 'The Matrix', 1999, 'Science Fiction', 7, 136, 'English'),
(10, 'Schindler\'s List', 1993, 'Historical Drama', 8, 195, 'English'),
(11, 'The Lord of the Rings: The Fellowship of the Ring', 2001, 'Fantasy', 9, 178, 'English'),
(12, 'Forrest Gump', 1994, 'Drama', 10, 142, 'English'),
(13, 'The Silence of the Lambs', 1991, 'Thriller', 11, 118, 'English'),
(14, 'Gladiator', 2000, 'Action', 12, 155, 'English'),
(15, 'The Avengers', 2012, 'Superhero', 13, 143, 'English');

-- Directors Table
CREATE TABLE Directors (
    D_id INT PRIMARY KEY,
    director_name VARCHAR(100),
    country VARCHAR(50)
);

INSERT INTO Directors VALUES
(1, 'Christopher Nolan', 'UK'),
(2, 'Bong Joon-ho', 'South Korea'),
(3, 'Francis Ford Coppola', 'USA'),
(4, 'Quentin Tarantino', 'USA'),
(5, 'Frank Darabont', 'France'),
(6, 'David Fincher', 'USA'),
(7, 'Lana Wachowski', 'USA'),
(8, 'Steven Spielberg', 'USA'),
(9, 'Peter Jackson', 'New Zealand');

-- Actors Table
CREATE TABLE Actors (
    actor_id INT PRIMARY KEY,
    actor_name VARCHAR(100),
    nationality VARCHAR(50)
);

INSERT INTO Actors VALUES
(1, 'Leonardo DiCaprio', 'USA'),
(2, 'Christian Bale', 'UK'),
(3, 'Song Kang-ho', 'South Korea'),
(4, 'Marlon Brando', 'USA'),
(5, 'Al Pacino', 'USA');

-- Movie_Actors Table
CREATE TABLE Movie_Actors (
    movie_id INT,
    actor_id INT,
    role VARCHAR(100),
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

INSERT INTO Movie_Actors VALUES
(1, 1, 'Dom Cobb'),
(2, 2, 'Bruce Wayne'),
(3, 3, 'Kim Ki-taek'),
(4, 1, 'Cooper'),
(5, 4, 'Vito Corleone'),
(5, 5, 'Michael Corleone');

-- Reviews Table
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    movie_id INT,
    rating DECIMAL(2, 1), -- out of 10
    review_text TEXT,
    reviewer VARCHAR(100),
    review_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

INSERT INTO Reviews VALUES
(1, 1, 8.8, 'A mind-bending experience.', 'John Doe', '2022-05-12'),
(2, 2, 9.0, 'Nolan at his best with this thrilling sequel.', 'Jane Smith', '2022-07-18'),
(3, 3, 8.6, 'A brilliant social satire.', 'Chris Park', '2022-03-20'),
(4, 4, 8.6, 'A visually stunning space odyssey.', 'Alice Brown', '2022-08-24'),
(5, 5, 9.2, 'The ultimate crime drama.', 'Peter White', '2022-10-02'),
(6, 6, 8.9, 'Tarantino’s iconic storytelling at its best.', 'Samuel Green', '2022-11-15'),
(7, 7, 9.3, 'A powerful portrayal of hope and friendship.', 'Lily Adams', '2022-12-03'),
(8, 8, 8.7, 'A dark and gripping psychological thriller.', 'Mike Johnson', '2023-01-10'),
(9, 9, 9.1, 'A groundbreaking sci-fi masterpiece.', 'Robert Black', '2023-02-22'),
(10, 10, 9.0, 'An epic fantasy journey of a lifetime.', 'Emily Davis', '2023-03-17');

-- Genres Table
CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50)
);

INSERT INTO Genres VALUES
(1, 'Science Fiction'),
(2, 'Action'),
(3, 'Thriller'),
(4, 'Crime'),
(5, 'Drama'),
(6, 'Fantasy'),
(7, 'Historical Drama'),
(8, 'Superhero');

-- Movie_Genres Table
CREATE TABLE Movie_Genres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

INSERT INTO Movie_Genres VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 4),
(6, 4),
(7, 5),
(8, 5),
(9, 1),
(10, 7),
(11, 6),
(12, 5),
(13, 3),
(14, 2),
(15, 8);

-- Final Query
SELECT 
    m.movie_id,
    m.title,
    m.release_year,
    m.duration,
    m.language,
    d.director_name,
    d.country AS director_country,
    a.actor_name,
    a.nationality AS actor_nationality,
    r.rating,
    r.review_text,
    r.reviewer,
    r.review_date,
    g.genre_name
FROM 
    Movies m
JOIN 
    Directors d ON m.director_id = d.D_id
JOIN 
    Movie_Actors ma ON m.movie_id = ma.movie_id
JOIN 
    Actors a ON ma.actor_id = a.actor_id
LEFT JOIN 
    Reviews r ON m.movie_id = r.movie_id
JOIN 
    Movie_Genres mg ON m.movie_id = mg.movie_id
JOIN 
    Genres g ON mg.genre_id = g.genre_id;
    
    
    
#Ten queries to test the project 
    
#1. Get all movies directed by Christopher Nolan
SELECT m.title, m.release_year, m.duration, m.language
FROM Movies m
JOIN Directors d ON m.director_id = d.D_id
WHERE d.director_name = 'Christopher Nolan';
#2. List all actors who acted in 'Inception'
SELECT a.actor_name, a.nationality
FROM Actors a
JOIN Movie_Actors ma ON a.actor_id = ma.actor_id
JOIN Movies m ON ma.movie_id = m.movie_id
WHERE m.title = 'Inception';
#3. Find all movies released after the year 2000 with a rating above 8.5
SELECT m.title, m.release_year, r.rating
FROM Movies m
JOIN Reviews r ON m.movie_id = r.movie_id
WHERE m.release_year > 2000 AND r.rating > 8.5;
#4. Retrieve the highest-rated movie along with its director and rating
SELECT m.title, d.director_name, MAX(r.rating) AS highest_rating
FROM Movies m
JOIN Directors d ON m.director_id = d.D_id
JOIN Reviews r ON m.movie_id = r.movie_id
GROUP BY m.title, d.director_name
ORDER BY highest_rating DESC
LIMIT 1;
#5. Find all genres for the movie 'The Godfather'
SELECT g.genre_name
FROM Genres g
JOIN Movie_Genres mg ON g.genre_id = mg.genre_id
JOIN Movies m ON mg.movie_id = m.movie_id
WHERE m.title = 'The Godfather';
#6. List all movies along with their genre(s) and director’s country
SELECT m.title, g.genre_name, d.country AS director_country
FROM Movies m
JOIN Movie_Genres mg ON m.movie_id = mg.movie_id
JOIN Genres g ON mg.genre_id = g.genre_id
JOIN Directors d ON m.director_id = d.D_id;
#7. Show the number of movies each director has directed
SELECT d.director_name, COUNT(m.movie_id) AS movie_count
FROM Directors d
JOIN Movies m ON d.D_id = m.director_id
GROUP BY d.director_name;
#8. Get all reviews for movies in the 'Science Fiction' genre
SELECT m.title, r.reviewer, r.rating, r.review_text
FROM Movies m
JOIN Reviews r ON m.movie_id = r.movie_id
JOIN Movie_Genres mg ON m.movie_id = mg.movie_id
JOIN Genres g ON mg.genre_id = g.genre_id
WHERE g.genre_name = 'Science Fiction';
#9. Find the average rating for all movies directed by directors from 'USA'
SELECT d.director_name, AVG(r.rating) AS average_rating
FROM Directors d
JOIN Movies m ON d.D_id = m.director_id
JOIN Reviews r ON m.movie_id = r.movie_id
WHERE d.country = 'USA'
GROUP BY d.director_name;
#10. Retrieve the total number of movies in each genre
SELECT g.genre_name, COUNT(mg.movie_id) AS total_movies
FROM Genres g
JOIN Movie_Genres mg ON g.genre_id = mg.genre_id
GROUP BY g.genre_name;
