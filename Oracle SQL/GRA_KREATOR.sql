
-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-06-23 16:42:06.103



-- tables
-- Table: BronieKlasowe

CREATE TABLE BronieKlasowe (
    ID_klasa  number  NOT NULL,
    ID_Broni  number  NOT NULL,
    Punkty_bieglosci  number  NOT NULL,
    CONSTRAINT BronieKlasowe_pk PRIMARY KEY (ID_klasa,ID_Broni)
) ;

-- Table: Gracze
 
CREATE TABLE Gracze (
    ID_Gracza  number  NOT NULL,
    Nick_Gracza  varchar2(30)  NOT NULL,
    ID_Klanu  number  NULL,
    ID_Rekrutera  number  NULL,
    CONSTRAINT Gracze_pk PRIMARY KEY (ID_Gracza)
) ;

-- Table: Klany
 
CREATE TABLE Klany (
    ID_Klanu  number  NOT NULL,
    Nazwa_Klanu  varchar2(30)  NOT NULL,
    CONSTRAINT Klany_pk PRIMARY KEY (ID_Klanu)
) ;

-- Table: Klasy
 
CREATE TABLE Klasy (
    ID_klasa  number  NOT NULL,
    Nazwa_Klasy  varchar2(30)  NOT NULL,
    ID_Skills  number  NOT NULL,
    CONSTRAINT Klasy_pk PRIMARY KEY (ID_klasa)
) ;

-- Table: Postaci
 
CREATE TABLE Postaci (
    ID_Postaci  number  NOT NULL,
    ImiePostaci  varchar2(30)  NOT NULL,
    ID_Rasa  number  NOT NULL,
    ID_klasa  number  NOT NULL,
    ID_Gracza  number NOT NULL,
    Poziom  number NOT NULL,
    CONSTRAINT Postaci_pk PRIMARY KEY (ID_Postaci)
) ;

-- Table: Rasy
 
CREATE TABLE Rasy (
    ID_Rasa  number  NOT NULL,
    Nazwa  varchar2(30)  NOT NULL,
    ID_Skills  number  NOT NULL,
    CONSTRAINT Rasy_pk PRIMARY KEY (ID_Rasa)
) ;

-- Table: Skille_Postaci
 
CREATE TABLE Skille_Postaci (
    ID_Postaci  number  NOT NULL,
    ID_Skills  number  NOT NULL,
    Wartosc_Umiejetnosci  number  NOT NULL,
    CONSTRAINT Skille_Postaci_pk PRIMARY KEY (ID_Postaci,ID_Skills)
) ;

-- Table: Skills
 
CREATE TABLE Skills (
    ID_Skills  number  NOT NULL,
    Nazwa  varchar2(30)  NOT NULL,
    CONSTRAINT Skills_pk PRIMARY KEY (ID_Skills)
) ;

-- Table: TypyBroni
 
CREATE TABLE TypyBroni (
    ID_Broni  number  NOT NULL,
    NazwaBroni  varchar2(30)  NOT NULL,
    Obrazenia  number  NOT NULL,
    CONSTRAINT TypyBroni_pk PRIMARY KEY (ID_Broni)
) ;

-- foreign keys
-- Reference: BronieKlasowe_Bronie (table: BronieKlasowe)
 
ALTER TABLE BronieKlasowe ADD CONSTRAINT BronieKlasowe_Bronie
    FOREIGN KEY (ID_Broni)
    REFERENCES TypyBroni (ID_Broni);
 
-- Reference: BronieKlasowe_Klasy (table: BronieKlasowe)
ALTER TABLE BronieKlasowe ADD CONSTRAINT BronieKlasowe_Klasy
    FOREIGN KEY (ID_klasa)
    REFERENCES Klasy (ID_klasa);
 
-- Reference: Gracze_Klany (table: Gracze)
ALTER TABLE Gracze ADD CONSTRAINT Gracze_Klany
    FOREIGN KEY (ID_Klanu)
    REFERENCES Klany (ID_Klanu);
 
-- Reference: ID_Trenera (table: Gracze)
ALTER TABLE Gracze ADD CONSTRAINT ID_Trenera
    FOREIGN KEY (ID_Rekrutera)
    REFERENCES Gracze (ID_Gracza);
 
-- Reference: Klasy_Skills (table: Klasy)
ALTER TABLE Klasy ADD CONSTRAINT Klasy_Skills
    FOREIGN KEY (ID_Skills)
    REFERENCES Skills (ID_Skills);
 
-- Reference: Postaci_Gracze (table: Postaci)
ALTER TABLE Postaci ADD CONSTRAINT Postaci_Gracze
    FOREIGN KEY (ID_Gracza)
    REFERENCES Gracze (ID_Gracza);
 
-- Reference: Postaci_Klasy (table: Postaci)
ALTER TABLE Postaci ADD CONSTRAINT Postaci_Klasy
    FOREIGN KEY (ID_klasa)
    REFERENCES Klasy (ID_klasa);
 
-- Reference: Postaci_Rasy (table: Postaci)
ALTER TABLE Postaci ADD CONSTRAINT Postaci_Rasy
    FOREIGN KEY (ID_Rasa)
    REFERENCES Rasy (ID_Rasa);
 
-- Reference: Rasy_Skills (table: Rasy)
ALTER TABLE Rasy ADD CONSTRAINT Rasy_Skills
    FOREIGN KEY (ID_Skills)
    REFERENCES Skills (ID_Skills);
 
-- Reference: Table_2_Postaci (table: Skille_Postaci)
ALTER TABLE Skille_Postaci ADD CONSTRAINT Table_2_Postaci
    FOREIGN KEY (ID_Postaci)
    REFERENCES Postaci (ID_Postaci);
 
-- Reference: Table_2_Skills (table: Skille_Postaci)
ALTER TABLE Skille_Postaci ADD CONSTRAINT Table_2_Skills
    FOREIGN KEY (ID_Skills)
    REFERENCES Skills (ID_Skills);
 
-- End of file.











Insert into KLANY Values(
0, 'DAWNBREAKERS');
Insert into KLANY Values(
1, 'SMOCZYCE');
Insert into KLANY Values(
2, 'SUNBROS');
Insert into KLANY Values(
3, 'HOLLOWKNIGHTS');



INSERT into Gracze Values(
0, 'Manno-al-mano', 2, NULL
);
INSERT into Gracze Values(
1, 'Lithola', 2, NULL
);
INSERT into Gracze Values(
2, 'TheKosiarz', 2, 0
);
INSERT into Gracze Values(
3, 'AtomowyJohnny', 0, NULL
);
INSERT into Gracze Values(
4, 'Shin Godzilla23', 1, NULL
);
INSERT into Gracze Values(
5, 'Burkan', 3, NULL
);
INSERT into Gracze Values(
6, 'DRASK', NULL, 4
);



INSERT into Skills Values(
0, 'Powozenie'
);
INSERT into Skills Values(
1, 'Drwina'
);
INSERT into Skills Values(
2, 'Magiczny Pocisk'
);
INSERT into Skills Values(
3, 'Zew Natury'
);
INSERT into Skills Values(
4, 'Infrawizja'
);
INSERT into Skills Values(
5, 'Kucie Run'
);
INSERT into Skills Values(
6, 'Wszechstronnosc'
);
INSERT into Skills Values(
7, 'Przekonywanie'
);
INSERT into Skills Values(
8, 'Dyscyplina'
);
INSERT into Skills Values(
9, 'Kowalstwo'
);



INSERT into Rasy Values(
0, 'Czlowiek', 6
);
INSERT into Rasy Values(
1, 'Elf', 4
);
INSERT into Rasy Values(
2, 'Krasnolud', 5
);



INSERT into Klasy Values(
0, 'Wojownik', 1
);
INSERT into Klasy Values(
1, 'Lowca', 3
);
INSERT into Klasy Values(
2, 'Mag', 2
);



INSERT into typybroni Values(
0, 'Kostury', 8
);
INSERT into typybroni Values(
1, 'Strzeleckie', 8
);
INSERT into typybroni Values(
2, 'Miecze', 10
);
INSERT into typybroni Values(
3,'Sztylety',6
);




INSERT into bronieklasowe Values(
0, 0, 3
);
INSERT into bronieklasowe Values(
0, 1, 2
);
INSERT into bronieklasowe Values(
0, 2, 3
);
INSERT into bronieklasowe Values(
0, 3, 3
);
INSERT into bronieklasowe Values(
1, 1, 3
);
INSERT into bronieklasowe Values(
1, 2, 1
);
INSERT into bronieklasowe Values(
1, 3, 2
);
INSERT into bronieklasowe Values(
2, 0, 2
);



INSERT into Postaci Values(
0,'Manno',0,0,     0, 100
);
INSERT into Postaci Values(
1,   'Mercer' ,1,2  ,   0,85
);
INSERT into Postaci Values(
2,'Caitha' ,0 ,0  , 1,60
);
INSERT into Postaci Values(
3,'Amas',0 ,2,2,55
);
INSERT into Postaci Values(
4, 'Gamera',2 ,1 ,4,75
);
INSERT into Postaci Values(
5,'Furion' ,1 ,1  ,   5,45
);
INSERT into Skille_Postaci Values(
0, 1, 10
);
INSERT into Skille_Postaci Values(
0, 6, 10
);
INSERT into Skille_Postaci Values(
0, 9, 8
);
INSERT into Skille_Postaci Values(
1, 2, 10
);
INSERT into Skille_Postaci Values(
1, 4, 8
);
INSERT into Skille_Postaci Values(
2, 1, 10
);
INSERT into Skille_Postaci Values(
2, 6, 2
);
INSERT into Skille_Postaci Values(
3, 6, 10
);
INSERT into Skille_Postaci Values(
3, 2, 8
);
INSERT into Skille_Postaci Values(
4,3,9
);
INSERT into Skille_Postaci Values(
4,5,10
);
INSERT into Skille_Postaci Values(
5,3,10
);
INSERT into Skille_Postaci Values(
5,4, 10
);
-- End of file.
 