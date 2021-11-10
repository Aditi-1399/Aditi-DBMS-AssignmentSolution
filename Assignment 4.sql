create database TravelOnTheGO ;
use TravelOnTheGO ;

create table Passenger (Passenger_name varchar (50) , Category varchar (50) , Gender varchar (50) , Boarding_City varchar (50) , Destination_City varchar (50) , Distance int , Bus_Type varchar (50) );

create table Price ( Bus_Type varchar (50) , Distance int , Price int );

insert into Passenger values ("Sejal" , "AC" , "F" , "Bengaluru" , "Chennai" , 350 , "Sleeper");
insert into Passenger values ("Anmol" , "Non-AC" , "M" , "Mumbai" , "Hyderabad" , 700 , "Sitting");
insert into Passenger values ("Pallavi" , "AC" , "F" , "Panaji" , "Bengaluru" , 600 , "Sleeper");
insert into Passenger values ("Khushboo" , "AC" , "F" , "Chennai" , "Mumbai" , 1500 , "Sleeper");
insert into Passenger values ("Udit" , "Non-AC" , "M" , "Trivandrum" , "Panaji" , 1000 , "Sleeper");
insert into Passenger values ("Ankur" , "AC" , "M" , "Nagpur" , "Hyderabad" , 500 , "Sitting");
insert into Passenger values ("Hemant" , "Non-AC" , "M" , "Panaji" , "Mumbai" , 700 , "Sleeper");
insert into Passenger values ("Manish" , "Non-AC" , "M" , "Hyderabad" , "Bengaluru" , 500 , "Sitting");
insert into Passenger values ("Piyush" , "AC" , "M" , "Pune" , "Nagpur" , 700 , "Sitting");

insert into Price values ("Sleeper" , 350 , 770);
insert into Price values ("Sleeper" , 500 , 1100);
insert into Price values ("Sleeper" , 600 , 1320);
insert into Price values ("Sleeper" , 700 , 1540);
insert into Price values ("Sleeper" , 1000 , 2200);
insert into Price values ("Sleeper" , 1200 , 2640);
insert into Price values ("Sleeper" , 350 , 434);
insert into Price values ("Sitting" , 500 , 620);
insert into Price values ("Sitting" , 500 , 620);
insert into Price values ("Sitting" , 600 , 744);
insert into Price values ("Sitting" , 700 , 868);
insert into Price values ("Sitting" , 1000 , 1240);
insert into Price values ("Sitting" , 1200 , 1488);
insert into Price values ("Sitting" , 1500 , 1860);




select Gender , count(Gender) from Passenger where Distance >= 600 group by (Gender);

select min(Price) from Price where Bus_Type = "Sleeper";

select Passenger_name from Passenger where Passenger_name like "S%";

select Passenger_name , Boarding_City , Destination_City , p1.Bus_Type , Price from Passenger p1 left join Price p2 on p1.Bus_Type = p2.Bus_Type and p1.Distance = p2.Distance ;

select Passenger_name , Price from Passenger p1 inner join Price p2 on p1.Bus_Type = "Sitting" and p1.Distance = 1000;
 
select Bus_Type , Price from Price where Distance = (select Distance from Passenger where Passenger_name = "Pallavi");

select Distance from Passenger group by Distance having count(Distance) = 1 order by Distance desc ;

select Passenger_name , Distance , Distance * 100 / (select sum(Distance) from Passenger) as Percentage from Passenger;

delimiter &&
create procedure displayCost()
begin
select Distance , Price , 
case
when Price > 1000 then 'Expensive'
when Price > 500 then 'Average Cost'
else 'Cheap'
end as Category
from Price ;
end &&
call displayCost();
