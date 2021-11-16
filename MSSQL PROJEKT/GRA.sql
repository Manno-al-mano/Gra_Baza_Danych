
-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-06-23 16:42:06.103

/* Rozważamy pewną bazę danych informacji o grze komputerowej on-line. Musi ona zawierać informacje o klanach, graczach,
   postaciach, rasach, klasach i ich umiejętnościach oraz różnych typach broni.
* Każdy gracz ma swój Nick. Może też należeć do klanu oraz może pochodzić z programu werbowania nowych graczy do gry. Wtedy ma gracza, który wysłał mu zaproszenie.
* Każdy klan ma nazwę.
* Każda Postać ma Imię, rasę, klasę, zestaw umiejętności z ich wartościami, a także gracza, do którego należy oraz poziom. Jeden gracz może mieć jedną, kilka lub żadną postać.
* Każda rasa i klasa ma swoją specyficzną umiejętność unikatową dla siebie.
* Każda klasa może używać jeden lub kilka rodzajów broni
* Różne bronie mają różne bazowe obrażenia
* Różne klasy mają różne stopnie biegłości w różnych broniach
   */


-- tables
-- Table: BronieKlasowe

CREATE TABLE BronieKlasowe (
    ID_klasa integer  NOT NULL,
    ID_Broni integer  NOT NULL,
    Punkty_bieglosci integer  NOT NULL,
    CONSTRAINT BronieKlasowe_pk PRIMARY KEY (ID_klasa,ID_Broni)
) ;

-- Table: Gracze
go
CREATE TABLE Gracze (
    ID_Gracza integer  NOT NULL,
    Nick_Gracza varchar(30)  NOT NULL,
    ID_Klanu integer  NULL,
    ID_Rekrutera integer  NULL,
    CONSTRAINT Gracze_pk PRIMARY KEY (ID_Gracza)
) ;

-- Table: Klany
go
CREATE TABLE Klany (
    ID_Klanu integer  NOT NULL,
    Nazwa_Klanu varchar(30)  NOT NULL,
    CONSTRAINT Klany_pk PRIMARY KEY (ID_Klanu)
) ;

-- Table: Klasy
go
CREATE TABLE Klasy (
    ID_klasa integer  NOT NULL,
    Nazwa_Klasy varchar(30)  NOT NULL,
    ID_Skills integer  NOT NULL,
    CONSTRAINT Klasy_pk PRIMARY KEY (ID_klasa)
) ;

-- Table: Postaci
go
CREATE TABLE Postaci (
    ID_Postaci integer  NOT NULL,
    ImiePostaci varchar(30)  NOT NULL,
    ID_Rasa integer  NOT NULL,
    ID_klasa integer  NOT NULL,
    ID_Gracza integer NOT NULL,
    Poziom integer NOT NULL,
    CONSTRAINT Postaci_pk PRIMARY KEY (ID_Postaci)
) ;

-- Table: Rasy
go
CREATE TABLE Rasy (
    ID_Rasa integer  NOT NULL,
    Nazwa varchar(30)  NOT NULL,
    ID_Skills integer  NOT NULL,
    CONSTRAINT Rasy_pk PRIMARY KEY (ID_Rasa)
) ;

-- Table: Skille_Postaci
go
CREATE TABLE Skille_Postaci (
    ID_Postaci integer  NOT NULL,
    ID_Skills integer  NOT NULL,
    Wartosc_Umiejetnosci integer  NOT NULL,
    CONSTRAINT Skille_Postaci_pk PRIMARY KEY (ID_Postaci,ID_Skills)
) ;

-- Table: Skills
go
CREATE TABLE Skills (
    ID_Skills integer  NOT NULL,
    Nazwa varchar(30)  NOT NULL,
    CONSTRAINT Skills_pk PRIMARY KEY (ID_Skills)
) ;

-- Table: TypyBroni
go
CREATE TABLE TypyBroni (
    ID_Broni integer  NOT NULL,
    NazwaBroni varchar(30)  NOT NULL,
    Obrazenia integer  NOT NULL,
    CONSTRAINT TypyBroni_pk PRIMARY KEY (ID_Broni)
) ;

-- foreign keys
-- Reference: BronieKlasowe_Bronie (table: BronieKlasowe)
go
ALTER TABLE BronieKlasowe ADD CONSTRAINT BronieKlasowe_Bronie
    FOREIGN KEY (ID_Broni)
    REFERENCES TypyBroni (ID_Broni);
go
-- Reference: BronieKlasowe_Klasy (table: BronieKlasowe)
ALTER TABLE BronieKlasowe ADD CONSTRAINT BronieKlasowe_Klasy
    FOREIGN KEY (ID_klasa)
    REFERENCES Klasy (ID_klasa);
go
-- Reference: Gracze_Klany (table: Gracze)
ALTER TABLE Gracze ADD CONSTRAINT Gracze_Klany
    FOREIGN KEY (ID_Klanu)
    REFERENCES Klany (ID_Klanu);
go
-- Reference: ID_Trenera (table: Gracze)
ALTER TABLE Gracze ADD CONSTRAINT ID_Trenera
    FOREIGN KEY (ID_Rekrutera)
    REFERENCES Gracze (ID_Gracza);
go
-- Reference: Klasy_Skills (table: Klasy)
ALTER TABLE Klasy ADD CONSTRAINT Klasy_Skills
    FOREIGN KEY (ID_Skills)
    REFERENCES Skills (ID_Skills);
go
-- Reference: Postaci_Gracze (table: Postaci)
ALTER TABLE Postaci ADD CONSTRAINT Postaci_Gracze
    FOREIGN KEY (ID_Gracza)
    REFERENCES Gracze (ID_Gracza);
go
-- Reference: Postaci_Klasy (table: Postaci)
ALTER TABLE Postaci ADD CONSTRAINT Postaci_Klasy
    FOREIGN KEY (ID_klasa)
    REFERENCES Klasy (ID_klasa);
go
-- Reference: Postaci_Rasy (table: Postaci)
ALTER TABLE Postaci ADD CONSTRAINT Postaci_Rasy
    FOREIGN KEY (ID_Rasa)
    REFERENCES Rasy (ID_Rasa);
go
-- Reference: Rasy_Skills (table: Rasy)
ALTER TABLE Rasy ADD CONSTRAINT Rasy_Skills
    FOREIGN KEY (ID_Skills)
    REFERENCES Skills (ID_Skills);
go
-- Reference: Table_2_Postaci (table: Skille_Postaci)
ALTER TABLE Skille_Postaci ADD CONSTRAINT Table_2_Postaci
    FOREIGN KEY (ID_Postaci)
    REFERENCES Postaci (ID_Postaci);
go
-- Reference: Table_2_Skills (table: Skille_Postaci)
ALTER TABLE Skille_Postaci ADD CONSTRAINT Table_2_Skills
    FOREIGN KEY (ID_Skills)
    REFERENCES Skills (ID_Skills);
go
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
4, 'ShinGodzilla23', 1, NULL
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


--Procedura pozwalająca podnieść poziom wszystkich postaci podanej klasy o podany poziom. Nie może opuszczać poziomu
create proc [s22222].CLASS_LEVEL_EVENT
     @levels integer, @eventgroup VARCHAR(30)
as
    set nocount on
begin

    if not exists(
    select * from Klasy
    where Nazwa_Klasy=@eventgroup
    )
    begin
        raiserror ('Podana nazwa klasy nie istnieje',15,1)
    end

    if @levels<0
        begin
            raiserror ('Podana wartość wzrostu poziomu jest ujemna',15,1)
        end

 declare findMembers cursor
     for
    select ImiePostaci, Postaci.ID_klasa
    from Postaci join Klasy K on K.ID_klasa = Postaci.ID_klasa
    where Nazwa_Klasy = @eventgroup
  declare @klasa VARCHAR(30), @postac varchar(30), @level int

    open findMembers

    fetch next from findMembers into @postac,@klasa

   while @@fetch_status = 0
    begin
       print @postac
        update Postaci
        set Poziom=poziom+@levels
        where ImiePostaci=@postac
        print 'poziom postaci '+ @postac +' został podniesony'
         fetch next from findMembers into @postac,@klasa
    end

    PRINT 'wartość @@FETCH_STATUS wszystkich obrotach obrotach wynosi ' +
    CAST(@@FETCH_STATUS AS VARCHAR);
    close findMembers
 deallocate findMembers
end
go
    -- robię procedurę dla nieistniejącej klasy.
exec CLASS_LEVEL_EVENT 10, 'kaplan'

--wyświetlam postaci z klasą i poziomem
select ImiePostaci, Nazwa_Klasy, Poziom
from Postaci join s22222.Klasy K2 on K2.ID_klasa = Postaci.ID_klasa

--wywołuję procedurę, żeby zwiększyć poziomy postaci o klasie mag o 10
exec CLAss_LEVEL_EVENT 10, 'Mag'

    --wyświetlam postaci z klasą i poziomem ponownie
select ImiePostaci, Nazwa_Klasy, Poziom
from Postaci join s22222.Klasy K2 on K2.ID_klasa = Postaci.ID_klasa

    --próbuję podnieść poziom wojowników o ujemną wartość
exec CLASS_LEVEL_EVENT -10, 'Wojownik'

--tworzę trigger który pilnuje, żeby nie dało się podnieść poziomu postaci  powyżej 100
go
create trigger lvl_control on Postaci
    for update
    as
    if exists (select 1 from Postaci where Poziom>100)
    begin
        update Postaci
        set Poziom=100
        where Poziom>100
    end
        if exists (select 1 from Postaci where Poziom<1)
    begin
        update Postaci
        set Poziom=1
        where Poziom<1
    end

go

--podnoszę poziom postaci klasy łowca o 150
exec CLASS_LEVEL_EVENT 150, 'Lowca'


--Wybieram Postaci o klasie łowca
select ImiePostaci, Nazwa_Klasy, Poziom
from Postaci join s22222.Klasy K2 on K2.ID_klasa = Postaci.ID_klasa
where Nazwa_Klasy='Lowca'

--próbuję ustawić poziom postaci o imieniu Amas na ujemną wartość
update Postaci
set Poziom =-50
where ImiePostaci='Amas'
--Wybieram dane postaci o imieniu Amas
select ImiePostaci, Nazwa_Klasy, Poziom
from Postaci join s22222.Klasy K2 on K2.ID_klasa = Postaci.ID_klasa
where ImiePostaci='Amas'