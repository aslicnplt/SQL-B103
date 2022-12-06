CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
delete from personel
--1)Isme gore toplam maaslari bulun
SELECT isim,sum(maas) from personel
GROUP BY isim
--personel talosundaki isimleri gruplayiniz
Select isim from personel
group by isim
--sehire gore personel sayisini bulunuz
select sehir,count(sehir) from personel
group by isim
-- 									HAVING CLAUSE
-- HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.
--Having komutu yalnızca group by komuty ile kullanılır
--eger gruplamadan sonra  bir sart varsa having komutu kullanılır
--where kullanımı ile aynı mantıkta calisir
-- Her sirketin MIN maaslarini eger 4000’den buyukse goster
select* from personel
select sirket, min(maas) as en_dusuk_maas from personel
group by sirket
having min(maas)>4000
-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz
select isim,sum(maas) from personel
group by isim
having sum(maas)>10000
-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select sehir,count(isim) as toplam_personel_sayisi from personel
group by sehir
having count (isim)>1
--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir .max(maas) as en_yuksek_maas from personel
group by sehir
Having max(maas)<5000
--UNİON KULLANİMİ
-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz
select isim,maas from personel where maas>4000
union
SELECT sehir as isci_veya_sehir_ismi,maas from personel
where maas>5000
-- 2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
-- bir tabloda gosteren sorgu yaziniz
select isim,maas from personel where isim='Mehmet Ozturk'
union
select sehir,maas from personel where sehir='Istanbul'
-- 								UNION OPERATOR
-- 						2 Tablodan Data Birlestirme
CREATE TABLE personel2
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20));


INSERT INTO personel2 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel2 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel2 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel2 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel2 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel2 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel2 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
CREATE TABLE personel_bilgi2  (
id int,
tel char(10),  
cocuk_sayisi int
);


INSERT INTO personel_bilgi2 VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi2 VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi2 VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi2 VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi2 VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi2 VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi2 VALUES(123456710, '5537488585', 1);
select * from personel2
select * from personel_bilgi2
-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
SELECT sehir as sehir_ve_tel ,maas as maas_ve_cocuksayisi FROM personel2 WHERE id=123456789
union
SELECT tel,cocuk_sayisi FROM personel_bilgi2 WHERE id=123456789;

--UNİON ALL
--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
--UNİON CİFT TEKRARLILARI varsa onu teke dondurur
select isim,maas from personel2 where maas<5000
union 
select isim,maas from personel2 where maas<5000
--union all la yaparsak tekrarlı olanları da yazdirir

select isim,maas from personel2 where maas<5000
union all
select isim,maas from personel2 where maas<5000
--SQL INTERSECT operatörü, 2 veya daha fazla SELECT ifadesinin sonuçlarını döndürmek için kullanılır.
--Ancak, yalnızca tüm sorgular veya veri kümeleri tarafından seçilen satırları döndürür.
--Bir sorguda bir kayıt varsa ve diğerinde yoksa, INTERSECT sonuçlarından çıkarılacaktır.
--INTERSECT KESİŞİM KUMESİ

--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--Iki sorguyu INTERSECT ile birlestirin
select id from personel2 where sehir in ('Istanbul','Ankara')
intersect
select id from personel_bilgi2 where cocuk_sayisi in (2,3)
-- Maası 4800den az veya 5000den cok olanlarin idlerini listele
select id from personel2 where maas not between 4800 and 5500;
-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
select isim from personel2 where sirket='Honda'
intersect
select isim from personel2 where sirket='Ford'
intersect
select isim from personel2 where sirket='Tofas'
--EXCEPT(Mınus) KULLANIMI (Iki kume farkı)- mınus mysql ve oracle da kullanılıyor
/*
İki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanılır */
--5000den az maas alıp Honda da calısmayanları yazdirin
SELECT isim,sirket from personel where maas<5000
EXCEPT 
SELECT isim,sirket FROM personel WHERE sirket='Honda';



