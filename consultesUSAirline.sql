/*1. Quantitat de registres de la taula de vols:*/

SELECT COUNT(FlightID) 
AS NumberOfFligths 
FROM Flights;

/*2. Retard promig de sortida i arribada segons l’aeroport origen.*/

SELECT Origin, AVG(ArrDelay) 
FROM Flights 
GROUP BY Origin 
order by Origin;


/*3. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen. A més,
volen que els resultat es mostrin de la següent forma:
LAX, 2000, 01, retard
LAX, 2000, 02, retard
…
LAX, 2000, 12, retard
LAX, 2001, 01, retard
…
ONT, 2000, 01, retard
ONT, 2000, 02, retard
etc.*/

SELECT Origin, colYear, colMonth, ArrDelay  
FROM Flights 
order by Origin 
AND colMonth;

/*4. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa
consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes
del codi de l’aeroport es mostri el nom de la ciutat.
Los Angeles, 2000, 01, retard
Los Angeles, 2000, 02, retard*/

SELECT USAirports.City, Flights.Origin, Flights.colYear, Flights.colMonth, Flights.ArrDelay  
FROM Flights 
inner join USAirports 
on USAirports.IATA = Flights.Origin 
order by Origin AND colMonth;

/*5. Les companyies amb més vols cancelats. A més, han d’estar ordenades de forma
que les companyies amb més cancelacions apareguin les primeres.*/

SELECT Description, CarrierCode, COUNT(*) 
from Carriers 
inner join Flights 
ON Carriers.CarrierCode = Flights.UniqueCarrier and Flights.Cancelled=1 
GROUP BY Description, CarrierCode 
ORDER By Description ASC;

/*6. L’identificador dels 10 avions que més kilòmetres han recorregut fent vols
comercials:*/

SELECT TailNum, sum(Distance) 
as suma 
FROM Flights 
group by TailNum 
ORDER BY suma 
DESC LIMIT 10;

/*7. Companyies amb el seu retard promig només d’aquelles les quals els seus vols
arriben al seu destí amb un retràs promig major de 10 minuts.*/

SELECT UniqueCarrier, AVG(ArrDelay) 
AS retras 
from Flights 
GROUP BY UniqueCarrier 
HAVING retras > 10;














