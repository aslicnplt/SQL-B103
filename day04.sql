--ALIASES
drop table if exists calisanlar
CREATE TABLE calisanlar  (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar
--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar
CREATE TABLE insanlar1
(
ssn char(9),
name varchar(50), 
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO insanlar1 VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO insanlar1 VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar1 (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar1 (ssn, adres) VALUES(567890123, 'Denizli');
--is null condition
select*from insanlar1
--Name sutununda null olan degerleri listeleyelim
select name from insanlar1 WHERE name is null
--ınsanlar tablosunda sadece null olmayan degerleri listeleyiniz
select name from insanlar1 Where name is not NULL
--insanlar tablosunda null deger almis verileri no name olarak degistiriniz
update insanlar1
set name ='No Name'
Where name is null
--ORDER BY: Tablolardaki verileri sıralamak icin order by kullanırız
--Buyukten kucuge ya da buyukten kucuge sıralama yapabiliriz. Default olarak kucukten buyuge sıralama yapar
--Eger buyukten kucuge sıralamak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
CREATE TABLE insanlar3
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar3 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar3 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar3 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar3 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar3 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar3 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
select*from insanlar3
--Insanlar tablosundaki datalari adres’e gore siralayin
select*from insanlar3 ORDER BY adres;
select*from insanlar3 order by soyisim;
--insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select*from insanlar3 Where isim ='Mine' ORDER BY ssn
--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
SELECT*FROM insanlar3 where soyisim='Bulut' order by 2
select*from insanlar3 ORDER BY ssn DESC
--Insanlar tablosundaki tum kayitlari isimler Natural sırali,soyisimler ters sırali olarak listeleyin
select*from insanlar3 ORDER BY isim ASC,soyisim DESC
-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select isim,soyisim FROM insanlar3 ORDER BY LENGTH(soyisim);
-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre tersten sıralayınız
select isim,soyisim FROM insanlar3 ORDER BY LENGTH(soyisim) DESC;
-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

SELECT isim||' '||soyisim as isim_soyisim from insanlar3 order by length(isim||soyisim)
SELECT isim||' '||soyisim as isim_soyisim from insanlar3 order by length(isim)+LENGTH(soyisim)
SELECT CONCAT (isim,' ',soyisim)AS isim_soyisim FROM insanlar3 ORDER BY LENGTH(isim)+LENGTH(soyisim)
SELECT CONCAT (isim,' ',soyisim)AS isim_soyisim FROM insanlar3 ORDER BY LENGTH(concat(isim,soyisim))

-- 									GROUP BY CLAUSE
-- Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
-- komutuyla birlikte kullanılır
CREATE TABLE manav
(
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
select*from manav
--Isme gore alinan toplam urunleri bulun ve bu urunleri buyukten kucuge listeleyiniz
SELECT isim, sum (urun_miktar) as aldigi_toplam_urun from manav
group by isim;

--bu urunleri buyukten kucuge listeleyiniz
SELECT isim, sum (urun_miktar) as aldigi_toplam_urun from manav
group by isim
ORDER BY isim DESC;
--Urun ismine gore urunu alan toplam kisi sayisi
Select urun_adi,count(isim) from manav
GROUP BY urun_adi;



