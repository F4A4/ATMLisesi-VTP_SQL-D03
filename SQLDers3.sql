/* VER� TABANI  DERS� SORGULAR MOD�L� �RNEK �ALI�MALARI */
--VER� TABANI OLU�TURMA
create database Pazarlama
--Veritaban�n� Silme
--drop database Pazarlama

--Kullan�lacak Veritaban� Belirleme
use Pazarlama

--Tablo Olu�turma
create table tblMusteri(
ID int primary key identity(1,1),
AdSoyad nvarchar(50),
DogumTarihi date,
Tel varchar(20),
Adres nvarchar(150),
) 
--Tablo Silme
--drop table tblMusteri

--Tablo Kay�t Ekleme
insert into tblMusteri(AdSoyad,DogumTarihi,Tel,Adres)
values('Fatma Altay','1996-04-29','322 678 89 99','Ahmet �zcan Cad.'),
('Aynur Ulu�an','1996-04-29','322 678 89 99','Nal�ac� Cad.'),
('Hafize G�ng�r','1996-04-29','322 678 89 99','Alaadin  Cad.'),
('K�bra D. Kahya','1996-04-29','322 678 89 99','LaleBah�e Cad.'),
('Emine Kamac�','1996-04-29','322 678 89 99','Muhacir Cad.')

------�L��K�SEL TABLO YAPMA-----

create table tblBirim(
ID int primary key identity(1,1),
BirimAd nvarchar (20)

)
insert into tblBirim values('Sat��')
,('Depo')
,('Muhasebe')
,('Bilgi ��lem')
,('�dare')

create table tblPersonel(
ID int primary key identity(1,1),
Ad nvarchar(30),
Soyad nvarchar(20),
Maas money,
BirimID int references tblBirim(ID) 
)

insert into tblPersonel
values('Adem','Yerebakan',2200,1)
,('Ece','G�n',1500,3)
,('Murat','Apak',3000,5)
,('Deniz','Gece',2400,4)
,('Melek','Kader',1800,2)
,('Emre','�alan',2100,1)


--Se�me Sorgusu
select * from tblMusteri
select * from tblBirim
select * from tblPersonel
-------------------------------------
--Tek Bir Alan Se�me
select AdSoyad from tblMusteri
--Birden Alan� Se�me
select AdSoyad,DogumTarihi from tblMusteri
--Birden Alan� Yer De�i�tirerek Se�me 
select DogumTarihi,AdSoyad from tblMusteri

--�stenilen Kayd� veya Kay�tlar� Getirme

--Id'si 1 olan kayd� getirir
select * from tblMusteri
where ID=18

--Id'si 3 ve 2 olan kay�tlar� getirir
select * from tblMusteri
where ID=18 or ID=17

--AdSoyad� 'Fatma Altay' olan� getirir
select *from tblMusteri
where AdSoyad='Fatma Altay'

--Id'si 1 olan kayd� siler
delete from tblMusteri
where ID=19

--Kay�t G�ncelleme
update tblMusteri
set AdSoyad='Arif UYSAL'
where ID=16

select * from tblMusteri
update tblMusteri
set AdSoyad='Arif UYSAL',DogumTarihi='1976-10-01',Adres='Mut Mersin'
where ID=16
select * from tblMusteri


--tblPersonel de bulunan maa�� 2000 den d���k kay�tlar� getirir
select * from tblPersonel
where Maas<=2000

--tblPersonel de bulunan maa�� 2000 den y�ksek ve 2500 den d���k kay�tlar� getirir
select * from tblPersonel
where Maas>2000 and Maas<2500

--tblPersonel de bulunan maa�� 2000 den y�ksek ve 2500 den d���k kay�tlar� getirir
select * from tblPersonel
where Maas between 2000 and 2500