--Database olusturma
Create database evren;
create database asli;
--DDL - DATA DEFİNİTİON LANG.
--CERATE TABLO OLUSTURMA
CREATE TABLE ogrenciler1
(
ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real,--ondalıklı sayılar icin kullanilir(double gibi)
	kayit_tarih date
);
--VAR OLAN TABLODAN YENİ BİR TABLO OLUSTURMA
create table ogrenci_notlari
AS
--benzer tablodaki baslıklarla ve data tipleriyle yeni bir
--tablo olusturmak icin normal tablo olustururkenki parantezler yerine
--AS kullanıp select komutuyla almak istedigimiz verileri alırız

SELECT isim,soyisim,not_ort FROM ogrenciler1;
--DML- DATA MANİPULATİON LANGUAGE
--İNSERT(DATABASEE VERİ EKLEME
INSERT INTO ogrenciler1 VALUES('123457','Asli','CANPOLAT',95.5,now());
INSERT INTO ogrenciler1 VALUES('123457','Asli','CANPOLAT',95.5,now());
--BIR TABLOYA PARCALI VERİ EKLEMEK İSTERSEK
INSERT INTO ogrenciler1(isim,soyisim) VALUES ('Asli','Canpolat');
--DQL- DATA QUERY LANGUAGE
--SELECT
select * from ogrenciler1;--*burdaki* sembolü her seyi anlamındadir



