--1 Wybierz Gracza, który zostal zrekrutowany przez innego gracza.
SELECT NICK_GRACZA
FROM GRACZE
WHERE ID_REKRUTERA is not null;



--2 Wybierz nazwy broni i obrazenia,jesli sa wieksze lub rowne 8.
SELECT NAZWABRONI, OBRAZENIA
FROM TYPYBRONI
WHERE OBRAZENIA>=8;



--3 Wybierz Postaci o poziomie mniejszym ni¿ 70 posortowane od najni¿szego poziomu do najwy¿szego
SELECT IMIEPOSTACI
FROM POSTACI
WHERE POZIOM<70
ORDER BY POZIOM ASC;



--4 Wybierz postaci, których klasa to "Mag"
SELECT imiepostaci
from POSTACI INNER JOIN KLASY
on POSTACI.ID_klasa =klasy.id_klasa
WHERE NAZWA_KLASY='Mag';



--5 Wybierz Nicki graczy, którzy nie nale¿a do klanu SUNBROS
SELECT GRACZE.NICK_GRACZA
FROM KLANY right outer JOIN GRACZE
ON KLANY.ID_KLANU=GRACZE.ID_KLANU
WHERE GRACZE.ID_KLANU is null OR NAZWA_KLANU != 'SUNBROS' ;
 


--6 Wypisz graczy, którzy siê zarejestrowali, ale nie zrobili postaci
SELECT GRACZE.NICK_GRACZA
from GRACZE left OUTER JOIN  POSTACI 
on GRACZE.ID_GRACZA=POSTACI.ID_GRACZA
WHERE IMIEPOSTACI is null;



--7 Wylicz Œrednia wartoœæ wszystkich umiejêtnoœci graczy
SELECT  AVG(wartosc_umiejetnosci)
from SKILLE_POSTACI;


--8 Policz sumê Wartoœci umiejêtnoœci postaci o imieniu Manno
SELECT SUM (wartosc_umiejetnosci)
from  SKILLE_POSTACI INNER JOIN POSTACI
ON SKILLE_POSTACI.ID_POSTACI=postaci.id_postaci
WHERE IMIEPOSTACI='Manno';


--9 Podaj Nicki wszystkich graczy wraz z liczba utworzonych przez niego postaci
SELECT NICK_GRACZA, COUNT(ALL POSTACI.ID_GRACZA)
from GRACZE Left outer JOIN POSTACI
on GRACZE.ID_GRACZA=POSTACI.ID_GRACZA 
group by NICK_GRACZA;


--10 Wybierz Postaci z ka¿dej klasy o najni¿szym poziomie. Podaj ich klasê i poziom
SELECT IMIEPOSTACI, NAZWA_KLASY, POZIOM
from POSTACI inner join klasy on 
POSTACI.ID_KLASA=KLASY.ID_KLASA
WHERE POZIOM IN (SELECT MIN(POZIOM)
                    FROM POSTACI
                    GROUP BY ID_KLasa );
                    
--11 Wybierz Postaci, które sa wojownikami z klanu SUNBROS
SELECT POSTACI.IMIEPOSTACI
FROM POSTACI
inner join klasy
on POSTACI.ID_KLASA=klasy.id_klasa
where NAZWA_KLASY = 'Wojownik' AND ID_GRACZA in 
(Select ID_GRACZA 
FROM GRACZE inner join klany on gracze.id_klanu=klany.id_klanu
where NAZWA_KLANU = 'SUNBROS'
);



--12 Wybierz Postaæ, która ma najwiêcej ró¿nych umiejêtnoœci
SELECT POSTACI.IMIEPOSTACI
FROM POSTACI inner join Skille_postaci
on Postaci.ID_POstaci = Skille_postaci.ID_POstaci
group by Skille_postaci.ID_Postaci, POSTACI.IMIEPOSTACI
having (COUNT(Skille_postaci.ID_SKILLS)) = (SELECT MAX(COUNT(ID_SKILLS))
from SKILLE_POSTACI
GROUP BY ID_POSTACI);


