--1
--DROP TABLE types
CREATE TABLE types
(
 	type_id varchar(50) NOT NULL,
 	type_name   varchar(50) ,
 	PRIMARY KEY ( type_id )
);

--2
--DROP TABLE title
CREATE TABLE title
(
 	tconst         varchar(50) NOT NULL,
 	titleType      varchar(50) ,
 	primaryTitle   varchar(50) ,
 	originalTitle  varchar(50) ,
 	isAdult        boolean ,
 	startYear      int ,
 	endYear        int ,
 	runtimeMinutes numeric ,
 	PRIMARY KEY ( tconst ),
	CONSTRAINT title CHECK (isAdult IN ('1','0'))
);


--3
--DROP TABLE akas
CREATE TABLE akas
(
 	aka_id          int PRIMARY KEY,
 	local_title     varchar(50) ,
 	tconst          varchar(50) NOT NULL,
 	region          varchar(50) ,
 	language        varchar(50) ,
 	attribute       varchar(50) ,
 	isOriginalTitle boolean ,
 	FOREIGN KEY ( tconst ) REFERENCES title ( tconst ),
	CONSTRAINT akas CHECK (isOriginalTitle IN ('1','0'))
);


--4
--DROP TABLE type_akas
CREATE TABLE type_akas
(
 	aka_id int NOT NULL,
 	type_id  varchar (50) NOT NULL,
	PRIMARY KEY ( type_id, aka_id),
 	FOREIGN KEY ( aka_id )REFERENCES akas ( aka_id),
 	FOREIGN KEY ( type_id )REFERENCES types ( type_id )
);


--5
--DROP TABLE episode
CREATE TABLE episode
(
 	tconst        varchar(50) NOT NULL PRIMARY KEY,
 	parentTconst  varchar(50) ,
 	seasonNumber  int ,
 	episodeNumber int ,
 	FOREIGN KEY ( tconst ) REFERENCES title ( tconst )
);

--6
--DROP TABLE genres
CREATE TABLE genres
(
 	genre_id   varchar(50) NOT NULL,
 	genre_name varchar(50) ,
 	PRIMARY KEY ( genre_id )
);

--7
--DROP TABLE title_genres
CREATE TABLE title_genres
(
 	tconst   varchar(50) NOT NULL,
 	genre_id varchar(50) NOT NULL,
	PRIMARY KEY ( tconst, genre_id),
 	FOREIGN KEY ( tconst ) REFERENCES title ( tconst ),
 	FOREIGN KEY ( genre_id ) REFERENCES genres ( genre_id )
);

--8
--DROP TABLE rating
CREATE TABLE rating
(	
 	tconst        varchar(50) NOT NULL,
 	averageRating numeric ,
	numVotes      numeric ,
	PRIMARY KEY ( tconst ),
 	FOREIGN KEY ( tconst ) REFERENCES title ( tconst )
);


--9
--DROP TABLE profession
CREATE TABLE profession
(
 	profession_id   varchar(50) NOT NULL,
	profession_name varchar(50) ,
 	PRIMARY KEY ( profession_id )
);

--10
--DROP TABLE crews
CREATE TABLE crews
(
 	nconst      varchar(50) NOT NULL,
 	primaryName varchar(50) ,
	birthYear   int , 
 	deathYear   int ,
 	PRIMARY KEY ( nconst )
);

--11
--DROP TABLE name_profession
CREATE TABLE name_profession
(
 	profession_id varchar(50) NOT NULL,
 	nconst        varchar(50) NOT NULL,
	PRIMARY KEY ( nconst, profession_id),
 	FOREIGN KEY ( profession_id ) REFERENCES profession ( profession_id ),
 	FOREIGN KEY ( nconst ) REFERENCES crews ( nconst )
);

--12
--DROP TABLE principal
CREATE TABLE principal
(
 	principal_id    int PRIMARY KEY,
 	tconst       	varchar(50) NOT NULL,
 	nconst       	varchar(50) NOT NULL,
 	job_category 	varchar(50) ,
 	specific_job 	varchar(50) ,
 	characters   	varchar(50) ,
 	FOREIGN KEY ( tconst ) REFERENCES title ( tconst ),
 	FOREIGN KEY ( nconst ) REFERENCES crews ( nconst )
);

--13
--DROP TABLE knownForTitles
CREATE TABLE knownForTitles
(
 	tconst varchar(50) NOT NULL,
 	nconst varchar(50) NOT NULL,
	PRIMARY KEY ( tconst, nconst),
 	FOREIGN KEY ( tconst ) REFERENCES title ( tconst ),
 	FOREIGN KEY ( nconst ) REFERENCES crews ( nconst )
);



--14
--DROP TABLE directors
CREATE TABLE directors
(
 	nconst varchar(50) NOT NULL,
 	tconst varchar(50) NOT NULL,
	PRIMARY KEY ( tconst, nconst),
 	FOREIGN KEY ( nconst ) REFERENCES crews ( nconst ),
 	FOREIGN KEY ( tconst ) REFERENCES title ( tconst )
);



--15
--DROP TABLE writers
CREATE TABLE writers
(
 	nconst varchar(50) NOT NULL,
 	tconst varchar(50) NOT NULL,
	PRIMARY KEY ( tconst, nconst),
 	FOREIGN KEY ( nconst ) REFERENCES crews ( nconst ),
 	FOREIGN KEY ( tconst ) REFERENCES title ( tconst )
);
