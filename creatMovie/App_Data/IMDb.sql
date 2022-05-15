drop TABLE Comments
drop TABLE Favorite_Actor
drop TABLE Favorite_Director
drop TABLE Favorite_Movie
drop TABLE likes
drop TABLE Staff

GO

drop TABLE Movies

GO

drop TABLE Users
drop TABLE Actor
drop TABLE Director


create database IMDb

GO

USE IMDb

CREATE TABLE [dbo].[Users] (
    [id]       INT            NOT NULL primary key identity (1, 1),
    [name]     NVARCHAR (255) NULL,
    [email]    NVARCHAR (255) NULL,
    [password] NVARCHAR (255) NULL,
    [image]    NVARCHAR (255) NULL,
);

CREATE TABLE [dbo].[Actor] (
    [id]    INT            NOT NULL primary key identity (1, 1),
    [name]  NVARCHAR (255) NULL,
    [age]   INT            NULL,
    [image] NVARCHAR (255) NULL,
    [bio]   NVARCHAR (1000) NULL,
);

CREATE TABLE [dbo].[Director] (
    [id]    INT            NOT NULL primary key identity (1, 1),
    [name]  NVARCHAR (255) NULL,
    [age]   INT            NULL,
    [image] NVARCHAR (255) NULL,
    [bio]   NVARCHAR (1000) NULL,
);

GO

CREATE TABLE [dbo].[Movies] (
    [id]          INT            NOT NULL primary key identity (1, 1),
    [name]        NVARCHAR (255) NULL,
    [description] NVARCHAR (1000) NULL,
    [likes]       INT            NULL,
    [dislikes]    INT            NULL,
	[rate]    INT            NULL,
    [image]    NVARCHAR (255) NULL,
	[dir_id]      INT  NOT NULL ,

    CONSTRAINT [FK_fav_movies_director] FOREIGN KEY ([dir_id]) REFERENCES [dbo].[Director] ([id]) ON DELETE CASCADE ON UPDATE CASCADE, 
);

GO

CREATE TABLE [dbo].[Favorite_Movie] (
    [id]    INT            NOT NULL primary key identity (1, 1),
    [user_id]  INT NOT NULL,
    [movie_id] INT NOT NULL,
   
	CONSTRAINT [FK_fav_movies_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_fav_movies_movies] FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Comments] (
    [id]    INT            NOT NULL primary key identity (1, 1),
    [user_id]  INT            NOT NULL,
    [movie_id] INT            NOT NULL,
    [comment]  NVARCHAR (1000) NULL,
    
	CONSTRAINT [FK_comments_users] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_comments_movies] FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[likes] (
    [id]    INT            NOT NULL primary key identity (1, 1),
    [user_id]  INT NOT NULL,
    [movie_id] INT NOT NULL,
    [like]     BIT NULL,
    
	CONSTRAINT [FK_likes_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_likes_movie] FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Staff] (
    [id]    INT             NOT NULL primary key identity (1, 1),
    [actor_id] INT NOT NULL,
    [movie_id]    INT NOT NULL,
    
	CONSTRAINT [FK_staff_actor] FOREIGN KEY ([actor_id]) REFERENCES [dbo].[Actor] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_staff_movies] FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Favorite_Actor] (
    [id]    INT             NOT NULL primary key identity (1, 1),
    [user_id]     INT NOT NULL,
    [actor_id] INT NOT NULL,
    
	CONSTRAINT [FK_fav_actor_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_fav_actor_actor] FOREIGN KEY ([actor_id]) REFERENCES [dbo].[Actor] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE [dbo].[Favorite_Director] (
    [id]    INT             NOT NULL primary key identity (1, 1),
    [user_id]     INT NOT NULL,
    [Director_id] INT NOT NULL,
    
	CONSTRAINT [FK_fav_director_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_fav_director_actor] FOREIGN KEY ([director_id]) REFERENCES [dbo].[Director] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

GO

INSERT INTO Actor (name , age , image , bio) VALUES ('Chris Pratt' , 42 , '~/images/Actor/Chris Pratt.jpg' , 'Chris Pratt,(born June 21, 1979, Virginia, Minnesota, U.S.), American actor known for his amiable charm in roles ranging from comic nitwits to heroic leading men. He gained fame as a television actor before becoming a movie star.');
INSERT INTO Actor (name , age , image , bio) VALUES ('Bryce Dallas Howard' , 41 , '~/images/Actor/Bryce Dallas Howard.jpg' , 'Bryce Dallas Howard was born on March 2, 1981, in Los Angeles, California. She was conceived in Dallas, Texas (the reason for her middle name). Her father, Ron Howard, is a former actor turned Oscar-winning director.');
INSERT INTO Actor (name , age , image , bio) VALUES ('Nick Robinson' , 27 , '~/images/Actor/Nick Robinson.jpg' , 'Nicholas John Robinson (born March 22, 1995)[1] is an American actor. As a child, he appeared in a 2008 stage production of A Christmas Carol and Mame, after which he starred in the television sitcom Melissa & Joey (2010–2015).');
INSERT INTO Actor (name , age , image , bio) VALUES ('Irrfan Khan' , 53 , '~/images/Actor/irrfan khan.jpg' , 'Birth. Sahabzade Irfan Ali Khan who is now known as Irrfan Khan was born on 7 January 1967 in Tonk, Rajasthan, India. He belonged to a Muslim Pathan family, his father was a wealthy Zamindar and owned a tire business.');
INSERT INTO Actor (name , age , image , bio) VALUES ('Tom Hardy' , 44 , '~/images/Actor/Tom Hardy.jpg' , 'Edward Thomas Hardy was born on September 15, 1977 in Hammersmith, London; his mother, Elizabeth Anne (Barrett), is an artist and painter, and his father, Chips Hardy, is a writer. He is of English and Irish descent.');
INSERT INTO Actor (name , age , image , bio) VALUES ('Charlize' , 46 , '~/images/Actor/Charlize.jpg' , 'Charlize Theron was born in Benoni, a city in the greater Johannesburg area, in South Africa, the only child of Gerda Theron (née Maritz) and Charles Theron. She was raised on a farm outside the city.');
INSERT INTO Actor (name , age , image , bio) VALUES ('Hugh Keays-Byrne' , 73 , '~/images/Actor/Hugh Keays-Byrne.jpg' , 'Hugh Keays-Byrne (18 May 1947 – 2 December 2020) was a British-Australian actor and film director. ');
INSERT INTO Actor (name , age , image , bio) VALUES ('Shailene Woodley' , 30 , '~/images/Actor/Shailene Woodley.jpg' , 'Actress and activist Shailene Woodley was born in Simi Valley, California, to Lori (Victor), a middle school counselor, and Lonnie Woodley, a school principal. She has one brother, Tanner.');
INSERT INTO Actor (name , age , image , bio) VALUES ('Theo James' , 37 , '~/images/Actor/Theo James.jpg' , 'Theo James was born on December 16, 1984 in Oxford, Oxfordshire, England, United Kingdom as Theodore Peter James Kinnaird Taptiklis. He is an actor, known for his role as Tobias "Four" Eaton in the films Divergent (2014)');
INSERT INTO Actor (name , age , image , bio) VALUES ('Kate Winslet' , 46 , '~/images/Actor/Kate Winslet.jpg' , 'Kate Winslet, in full Kate Elizabeth Winslet, (born October 5, 1975, Reading, Berkshire, England), English actress known for her sharply drawn portrayals of spirited and unusual women.');
INSERT INTO Actor (name , age , image , bio) VALUES ('Harrison Ford' , 79 , '~/images/Actor/Harrison Ford.jpg' , 'Harrison Ford was born on July 13, 1942 in Chicago, Illinois, to Dorothy (Nidelman), a radio actress, and Christopher Ford (born John William Ford), an actor turned advertising executive.');

INSERT INTO Director(name , age , image , bio) VALUES ('J.J. Abrams' , 55 , '~/images/Director/J.J. Abrams.jpg' , 'J.J. Abrams, byname of Jeffrey Jacob Abrams, (born June 27, 1966, New York City, New York, U.S.), American writer, director, and producer who was known for his role in creating several hit television series, including Lost (2004–10).');
INSERT INTO Director(name , age , image , bio) VALUES ('Robert Schwentke' , 54 , '~/images/Director/Robert Schwentke.jpg' , 'Robert Schwentke was born in 1968 in Stuttgart, Germany. He is a director and writer, known for The Captain (2017), RED (2010) and The Family Jewels (2003). Born: 1968 in Stuttgart, Germany');
INSERT INTO Director(name , age , image , bio) VALUES ('Mark Hamill' , 70 , '~/images/Director/Mark Hamill.jpg' , 'Mark Hamill is best known for his portrayal of Luke Skywalker in the original Star Wars trilogy - Star Wars (1977), Star Wars: Episode V - The Empire Strikes Back (1980)');
INSERT INTO Director(name , age , image , bio) VALUES ('Colin Trevorrow' , 45 , '~/images/Director/Colin Trevorrow.jpg' , 'He Born in San Francisco and raised in Oakland, Colin Trevorrow started making short films when he was 12 years old. He studied film and dramatic writing at New York University. After graduation.');
INSERT INTO Director(name , age , image , bio) VALUES ('James Wan' , 45 , '~/images/Director/James Wan.jpg' , 'James Wan (born 26 February 1977) is an Australian film producer, screenwriter and film director of Malaysian Chinese descent. He is widely known for directing the horror film Saw (2004) and creating Billy the puppet.');
INSERT INTO Director(name , age , image , bio) VALUES ('Alan Taylor' , 63 , '~/images/Director/Alan Taylor.jpg' , 'Alan Shaw Taylor (born June 17, 1955) is an American historian and scholar who is the Thomas Jefferson Memorial Foundation Professor of History at the University of Virginia.[1] A specialist in the early history of the United States.');
INSERT INTO Director(name , age , image , bio) VALUES ('Ridley Scott' , 84 , '~/images/Director/Ridley Scott.jpg' , 'Ridley Scott is a British film director and producer whose movies are acclaimed for their visual style and rich details. His best-known films include The Duellists (1977), Alien (1979), Blade Runner (1982), Legend(1985).');
INSERT INTO Director(name , age , image , bio) VALUES ('Pierre Coffin' , 55 , '~/images/Director/Pierre Coffin.jpg' , 'Pierre-Louis Padang Coffin (born 1967) is a French animator, film director, and voice actor best known for co-directing all four films in the Despicable Me franchise and as the voice of the Minions');
INSERT INTO Director(name , age , image , bio) VALUES ('Pete Docter' , 53 , '~/images/Director/Pete Docter.jpg' , 'Pete Docter is the Oscar®-winning director of "Monsters, Inc.," "Up," and "Inside Out," and Chief Creative Officer at Pixar Animation Studios.');
INSERT INTO Director(name , age , image , bio) VALUES ('Sam Mendes' , 56 , '~/images/Director/Sam Mendes.jpg' , 'am Mendes, byname of Sir Samuel Alexander Mendes, (born August 1, 1965, Reading, Berkshire, England), English film and theatre director who was known for his innovative treatments of classic stage productions as well as for his thought-provoking films.');
INSERT INTO Director(name , age , image , bio) VALUES ('George Miller' , 77 , '~/images/Director/George Miller.jpg' , 'George Miller AO (3 March 1945 ) is an Australian filmmaker best known for his Mad Max franchise, whose second installment, Mad Max 2, and fourth, Fury Road.');

GO

INSERT INTO Movies(name , description , likes , dislikes , rate , image , dir_id) VALUES ('Jurassic World' , 'Twenty-two years after the events of Jurassic Park, Isla Nublar now features a fully functioning dinosaur theme park, Jurassic World, as originally envisioned by John Hammond.', 150 , 14 , 6 , '~/images/Movie/Jurassic World.jpg' , 4);
INSERT INTO Movies(name , description , likes , dislikes , rate , image , dir_id) VALUES ('Mad Max: Fury Road' , 'An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and most everyone is crazed fighting for the necessities of life.', 100 , 19 , 6 , '~/images/Movie/Mad Max Fury Road' , 11);
INSERT INTO Movies(name , description , likes , dislikes , rate , image , dir_id) VALUES ('Insurgent' , 'Beatrice Prior must confront her inner demons and continue her fight against a powerful alliance which threatens to tear her society apart.', 70 , 4 , 6 , '~/images/Movie/Insurgent.jpg' , 3);
INSERT INTO Movies(name , description , likes , dislikes , rate , image , dir_id) VALUES ('Star Wars: The Force Awakens' , 'Thirty years after defeating the Galactic Empire, Han Solo and his allies face a new threat from the evil Kylo Ren and his army of Stormtroopers.', 150 , 14 , 7 , '~/images/Movie/Star Wars The Force Awakens.jpg' , 1);
INSERT INTO Movies(name , description , likes , dislikes , rate , image , dir_id) VALUES ('Furious 7' , 'Deckard Shaw seeks revenge against Dominic Toretto and his family for his comatose brother.', 280 , 54 , 7 , '~/images/Movie/Furious 7.jpg' , 5);
INSERT INTO Movies(name , description , likes , dislikes , rate , image , dir_id) VALUES ('Terminator Genisys' , 'The year is 2029. John Connor, leader of the resistance continues the war against the machines. At the Los Angeles offensive.', 655 , 54 , 5 , '~/images/Movie/Terminator Genisys.jpg' , 6);

GO

INSERT INTO Staff(actor_id , movie_id) VALUES (1 , 1);
INSERT INTO Staff(actor_id , movie_id) VALUES (2 , 1);
INSERT INTO Staff(actor_id , movie_id) VALUES (4 , 1);
INSERT INTO Staff(actor_id , movie_id) VALUES (5 , 2);
INSERT INTO Staff(actor_id , movie_id) VALUES (6 , 2);
INSERT INTO Staff(actor_id , movie_id) VALUES (7 , 2);
INSERT INTO Staff(actor_id , movie_id) VALUES (8 , 3);
INSERT INTO Staff(actor_id , movie_id) VALUES (9 , 3);
INSERT INTO Staff(actor_id , movie_id) VALUES (10 , 3);
INSERT INTO Staff(actor_id , movie_id) VALUES (11 , 4);

GO

USE IMDb
SELECT * FROM Movies;
SELECT * FROM Actor;

