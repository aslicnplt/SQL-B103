CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler3
-- Ä°smi Mustafa Bak ve Nesibe YÄ±lmaz olan kayÄ±tlarÄ± silelim

DELETE FROM ogrenciler3 WHERE isim='Mustafa Bak' or isim = 'Nesibe Yilmaz';

-- Veli ismi Hasan datayi silelim

DELETE FROM ogrenciler3 WHERE veli_isim='Hasan';

-- TRUNCATE -- 
-- Bir tablodaki tÃ¼m verileri geri alamayacaÄŸÄ±mÄ±z ÅŸekilde siler. ÅartlÄ± silme yapmaz

TRUNCATE ogrenciler3

-- ON DELETE CASCADE 
DROP TABLE if exists adresler -- EÄŸer tablo varsa tabloyu siler


INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe YÄ±lmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from talebeler2;
select * from notlar2;

-- Notlar tablosundan talebe_id'si 123 olan datayÄ± silelim

DELETE FROM notlar WHERE talebe_id='123';

-- Talebeler tablosundan id'si 126 olan datayÄ± silelim

DELETE FROM talebeler2 WHERE id='126';

CREATE TABLE talebe
(
id CHAR(3) primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE not1( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe YÄ±lmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from talebe
select * from not1

-- Talebeler tablosundan id'si 126 olan datayÄ± silelim

DELETE FROM talebe WHERE id='126'

/*
    Her defasÄ±nda Ã¶nce child tablodaki verileri silmek yerine ON DELETE CASCADE silme Ã¶zelliÄŸi ile
parent tablo dan da veri silebiliriz. YanlÄ±z ON DELETE CASCADE komutu kullanÄ±mÄ±nda parent tablodan sildiÄŸimiz
data child tablo dan da silinir
*/

-- IN CONDITION

DROP TABLE if exists musteriler
 
CREATE TABLE musteriler  (
urun_id int,  
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple');  
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');  
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');  
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');  
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');  
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
 
SELECT * FROM musteriler

-- Musteriler tablosundan urun ismi orange, apple veya apricot olan tÃ¼m verileri listeleyiniz

SELECT * FROM musteriler WHERE urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot';

-- IN CONDITION

SELECT * FROM musteriler WHERE urun_isim IN ('Orange','Apple','Apricot');

-- NOT IN --> YazdÄ±ÄŸÄ±mÄ±z verilerin dÄ±ÅŸÄ±ndakileri getirir
SELECT * FROM musteriler WHERE urun_isim NOT IN ('Orange','Apple','Apricot');


SELECT * FROM musteriler WHERE urun_isim='Orange' and urun_id=10

--BETWEEN CONDITION

-- Musteriler tablosundan urun_id'si 20 ile 40 arasÄ±nda olan tÃ¼m verileri listeleyiniz
SELECT * FROM musteriler WHERE urun_id>=20 and urun_id<=40;

SELECT * FROM musteriler WHERE urun_id BETWEEN 20 and 40;

SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 and 40;

-- SUBQUERIES --> Sorgu iÃ§inde sorgu
CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);

select * from calisanlar2
select * from markalar

-- Ã‡alisan sayisi 15.000â€™den cok olan markalarin isimlerini 
--ve bu markada calisanlarin isimlerini ve maaÅŸlarini listeleyin.
SELECT isim,maas,isyeri FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

-- marka_idâ€™si 101â€™den bÃ¼yÃ¼k olan marka Ã§aliÅŸanlarinin 
-- isim, maaÅŸ ve ÅŸehirlerini listeleyiniz

SELECT isim,maas,sehir FROM calisanlar2 
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);

- Ã‡alisan sayisi 15.000â€™den cok olan markalarin isimlerini ve bu markada calisanlarin
-- isimlerini ve maaÅŸlarini listeleyin.
SELECT isim,maas,isyeri FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);
-- marka_idâ€™si 101â€™den bÃ¼yÃ¼k olan marka Ã§aliÅŸanlarinin
-- isim, maaÅŸ ve ÅŸehirlerini listeleyiniz.
SELECT isim,maas,sehir FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);
/*
--Ã–DEV- Ankaraâ€™da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
*/
-- AGGREGATE METHOD
--Calisanlar tablosunda maksimum maasÄ± listeleyiniz
SELECT max(maas) AS maksimum_maas FROM calisanlar2;
/*
	EÄŸer bir sÃ¼tuna geÃ§ici olarak bir isim vermek istersek AS komutunu yazdÄ±ktan sonra vermek
istediÄŸimiz ismi yazarÄ±z
*/
--Calisanlar tablosunda minimum maasÄ± listeleyiniz
SELECT min(maas) AS minimum_maas FROM calisanlar2;
--Calisanlar tablosundaki maaslarÄ±n toplamÄ±nÄ± listeleyiniz
SELECT sum(maas) AS maas_toplamÄ± FROM calisanlar2;
--Calisanlar tablosundaki maaslarÄ±n ortalamasÄ±nÄ± listeleyiniz
SELECT avg(maas) AS maas_ortalamasÄ± FROM calisanlar2;
SELECT round(avg(maas),2) AS maas_ortalamasÄ± FROM calisanlar2;
--Calisanlar tablosundaki maaslarÄ±n sayÄ±sÄ±
SELECT count(maas) AS maas_sayÄ±sÄ± FROM calisanlar2;
SELECT count(*) AS maas_sayÄ±sÄ± FROM calisanlar2;
/*
EÄŸer count(*) kullanÄ±rsak tablodaki tÃ¼m satÄ±rlarÄ±n sayÄ±sÄ±nÄ± verir
Sutun adÄ± kullanÄ±rsak o sutundaki sayÄ±larÄ± verir
*/
select * from calisanlar2
select * from markalar
--AGGREGATE METHODLARDA SUBQUERY
-- Her markanin idâ€™sini, ismini ve toplam kaÃ§ ÅŸehirde 
-- bulunduÄŸunu listeleyen bir SORGU yaziniz

SELECT marka_id,marka_isim,
(SELECT count(sehir) as sehir_sayisi FROM calisanlar2 WHERE marka_isim=isyeri) 
FROM markalar;

--  Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
--  toplam maaÅŸini listeleyiniz
CREATE view summaas
as
SELECT marka_isim,calisan_sayisi,
(SELECT sum(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as toplam_maas
FROM markalar

select * from summaas

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaÅŸini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar

-- VIEW KullanÄ±mÄ±
/*
YaptÄ±ÄŸÄ±mÄ±z sorgularÄ± hafÄ±zaya alÄ±r ve tekrar bizden isten sorgulama yenine
view'e atadÄ±ÄŸÄ±mÄ±z ismi SELECT komutuyla Ã§aÄŸÄ±rÄ±rÄ±z
*/
CREATE VIEW maxminmaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar;

SELECT * FROM maxminmaas;
SELECT * FROM summaas;

-- EXÄ°STS CONDITION

CREATE TABLE mart
(	
urun_id int,	
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(	
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart
select * from nisan

/*
--MART VE NÄ°SAN aylarÄ±nda aynÄ± URUN_ID ile satÄ±lan Ã¼rÃ¼nlerin
  URUN_IDâ€™lerini listeleyen ve aynÄ± zamanda bu Ã¼rÃ¼nleri MART ayÄ±nda alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazÄ±nÄ±z. 
*/
SELECT urun_id,musteri_isim FROM mart
WHERE exists (SELECT urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id)

/*
--Her iki ayda birden satÄ±lan Ã¼rÃ¼nlerin URUN_ISIM'lerini ve bu Ã¼rÃ¼nleri
NÄ°SAN ayÄ±nda satÄ±n alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazÄ±nÄ±z.
*/
SELECT urun_isim,musteri_isim FROM nisan
WHERE exists (SELECT urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim)

--DML--> UPDATE

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Ã‡in Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'AyÅŸe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Ã–z');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan YÄ±lmaz');

select * from tedarikciler
select * from urunler

-- vergi_noâ€™su 102 olan tedarikcinin firma ismini 'Vestel' olarak gÃ¼ncelleyeniz.
/*
UPDATE tablo_adi
SET sutun_ismi = 'istenen veri' WHERE sutun_ismi='istenen veri'
*/
UPDATE tedarikciler
SET firma_ismi = 'Vestel' WHERE vergi_no=102;

-- vergi_noâ€™su 101 olan tedarikÃ§inin firma ismini 'casper' ve irtibat_ismiâ€™ni 'Ali Veli' olarak gÃ¼ncelleyiniz.
UPDATE tedarikciler
SET firma_ismi = 'Casper',irtibat_ismi='Ali Veli' WHERE vergi_no=101

--  urunler tablosundaki 'Phone' deÄŸerlerini 'Telefon' olarak gÃ¼ncelleyiniz.
UPDATE urunler
SET urun_isim = 'Telefon' WHERE urun_isim='Phone';

-- urunler tablosundaki urun_id deÄŸeri 1004'ten bÃ¼yÃ¼k olanlarÄ±n urun_idâ€™sini 1 arttÄ±rÄ±n.
UPDATE urunler
SET urun_id = urun_id + 1 WHERE urun_id>1004;

-- urunler tablosundaki tÃ¼m Ã¼rÃ¼nlerin urun_id deÄŸerini ted_vergino sutun deÄŸerleri ile toplayarak gÃ¼ncelleyiniz.
UPDATE urunler
SET urun_id = urun_id + ted_vergino

DELETE FROM urunler

--* urunler tablosundan Ali Bakâ€™in aldigi urunun ismini, tedarikci  tablosunda irtibat_ismi 
--'Adam Eve' olan firmanÄ±n ismi (firma_ismi) ile degistiriniz.

UPDATE urunler 						
SET urun_isim = (SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi = 'Adam Eve')						
WHERE musteri_isim='Ali Bak';						

--* Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Appleâ€™in irtibat_isim'i ile degistirin.

UPDATE urunler						
SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi='Apple')						
WHERE urun_isim='Laptop'						

