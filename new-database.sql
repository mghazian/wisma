CREATE TABLE TAMU
(No_KTP CHAR (16),
Nama CHAR (50),
Alamat VARCHAR (50),
No_HP VARCHAR (20),
Agama VARCHAR (20),
Tanggal_Lahir DATE,
constraint TAMU_pk primary key (No_KTP)
);

CREATE TABLE PETUGAS
(NIP CHAR (16),
Nama VARCHAR (20),
No_HP VARCHAR (20),
Alamat VARCHAR (50),
Agama VARCHAR (20),
constraint petugas_pk primary key (NIP)
);

CREATE TABLE FASILITAS
(ID_Fasilitas VARCHAR (6),
ID_Kategori CHAR (10),
Nama_Fasilitas VARCHAR (15),
constraint fasilitas_pk primary key (ID_Fasilitas),
constraint fasilitas_fk foreign key (ID_Kategori) references kategori (ID_Kategori)
);

CREATE TABLE KATEGORI
(ID_Kategori CHAR (10),
Harga INTEGER,
Kapasitas VARCHAR (20),
constraint kategori_pk primary key (ID_Kategori)
);

CREATE TABLE WISMA
(ID_Wisma CHAR (10),
Nama_Wisma VARCHAR (12),
Alamat VARCHAR (100),
Phone VARCHAR (20),
Fax VARCHAR (20),
constraint wisma_pk primary key (ID_Wisma)
);

CREATE TABLE KAMAR
(No_Kamar INTEGER, 
ID_Wisma CHAR (10),
ID_Kategori CHAR (10),
Status_Kamar VARCHAR (10),
constraint kamar_pk primary key (No_Kamar),
constraint kamar_fk1 foreign key (ID_wisma) references wisma (ID_Wisma),
constraint kamar_fk2 foreign key (ID_Kategori) references kategori (ID_Kategori)
);


CREATE TABLE RESERVASI
(ID_reservasi CHAR (6),
No_KTP CHAR (16),
NIP CHAR (16),
Tanggal_Check_In DATE,
Tanggal_Check_Out DATE,
Lama_Peminjaman INTEGER,
Denda INTEGER,
Total INTEGER,
constraint reservasi_pk primary key (ID_Reservasi),
constraint reservasi_fk1 foreign key (No_KTP) references tamu (No_KTP),
constraint reservasi_fk2 foreign key (NIP) references petugas (NIP)
);

CREATE TABLE DETAIL_RESERVASI
(No_Kamar INTEGER,
ID_RESERVASI CHAR(6),
constraint detail_reservasi_fk1 foreign key (No_Kamar) references kamar (No_Kamar),
constraint detail_reservasi_fk2 foreign key (ID_Reservasi) references reservasi (ID_Reservasi)
);

INSERT INTO TAMU VALUES ('3275091712960007','Muhammad Hanif','Marina Emas Selatan Blok E/23, Keputih, Surabaya','082114564652','Islam','17-DEC-96');
INSERT INTO TAMU VALUES ('3258935729405244','Muhammad Nezar Mahardika','Perumahan Dosen Blok U 193, ITS','0821123456789','Islam','01-JAN-96');
INSERT INTO TAMU VALUES ('3274828529529543','William Suhud','Jalan Kertajaya No 123, Surabaya','089764352712','Kristen','03-FEB-96');
INSERT INTO TAMU VALUES ('3273573594248534','Adetiya Bagus','Keputih Gang 1E No.55, Keputih, Surabaya','097865567432','Islam','10-JUN-96');
INSERT INTO TAMU VALUES ('3275248724295943','Dewangga Okta','Keputih Gang 1D No.61, Keputih, Surabaya','087787656473','Islam','11-AUG-96');
INSERT INTO TAMU VALUES ('3275029482948212','Sultan Bonar','Marina Emas Utara Blok C/20, Keputih, Surabaya','089794832121','Islam','19-MAR-96');
INSERT INTO TAMU VALUES ('3273438472948024','Magista Bella','Jalan Gubeng Kertajaya No. 96, Surabaya','098764890876','Islam','20-JAN-96');
INSERT INTO TAMU VALUES ('3275044294249424','Kadek Winda','Perumahan Dosen Blok T 121, ITS','098712345678','Hindu','22-SEP-1997');
INSERT INTO TAMU VALUES ('3275334729482044','Andi Ersaldy','Jalan Wisma Permai No.69, Mulyosari, Surabaya','099877665544','Islam','31-DEC-1995');
INSERT INTO TAMU VALUES ('3242934972499248','Rivaldo Alif','Jalan Kayoon No. 169, Surabaya','098112233445','Islam','24-APR-96');
INSERT INTO TAMU VALUES ('3024754864802942','Pratiwi Fitriana','Apartemen Puncak Kertajaya No.88, Surabaya','098123457812','Islam','28-MAY-96');
INSERT INTO TAMU VALUES ('3098765433213243','Zahrah Citra','Apartemen Dian Regency No.69, Surabaya','098123098123','Islam','07-JUL-97');
INSERT INTO TAMU VALUES ('3938954952452234','Aldi Febriansyah','Jl.Klampis No.67, Surabaya','099773322678','Islam','23-OCT-95');
INSERT INTO TAMU VALUES ('3208139495046242','Trastian Satrio','Jl.Merdeka Bersatu No.70, Gubeng, Surabaya','099112233445','Islam','19-NOV-96');
INSERT INTO TAMU VALUES ('3275096549308463','Nafia Rizky','Jl.Ngagel Jaya No.25, Surabaya','089767845642','Islam','21-JUN-97');

INSERT INTO PETUGAS VALUES('19001','Supendi','089141313128','Keputih Makam No 21, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19002','Mastur','082134123421','Wisma Bhaskara No.31, Mulyosari, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19003','Dudu Sudrajat','089078978909','Jl.Gebang No. 55, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19004','Watini','083456754345','Jl. Kertajaya No.121, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19005','Gumilar Ratna','089123098712','Perumahan Dosen Blok J No.1, ITS','Islam');
INSERT INTO PETUGAS VALUES('19006','Dedin Burhanudin','098312742145','Pakuwon City Blok Z No.27, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19007','Derita Hermawan','088844443333','Jl. Dharmawangsa No.11, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19008','Sukahar','0821314412454','Jl.Ngagel Selatan No 2, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19009','Entin Wartini','089432145632','Jl.Walikota No.1, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19010','Peru Derisburman','089542954325','Apartemen Dharmahusada No.89, Surabaya','Kristen');
INSERT INTO PETUGAS VALUES('19011','Beni Sopandi','085942594214','Hotel Coklat No.767, Surabaya','Kristen');
INSERT INTO PETUGAS VALUES('19012','Mulyadi','089599443242','Jl.Gubeng No.44, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19013','Ahmad Sukandi','087654321904','Marina Emas Selatan Blok R/21, Keputih, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19014','Agus Krisnanto','0897658493253','Jl.Keputih Barat No.212, Surabaya','Islam');
INSERT INTO PETUGAS VALUES('19015','Mamah Halimah','089537594930','Jl. Kejawan Gebang No.200, Surabaya','Islam');

INSERT INTO KATEGORI VALUES ('VIP','200000','4 Orang');
INSERT INTO KATEGORI VALUES ('EKSEKUTIF','100000','2 Orang');
INSERT INTO KATEGORI VALUES ('STANDAR','50000','1 Orang');

INSERT INTO FASILITAS VALUES ('F01','VIP','Kulkas');
INSERT INTO FASILITAS VALUES ('F02','VIP','AC');
INSERT INTO FASILITAS VALUES ('F03','VIP','PEMANAS AIR');
INSERT INTO FASILITAS VALUES ('F04','VIP','TV');

INSERT INTO WISMA VALUES ('F','Flamboyan','Jl. Teknik Sipil Blok I-19, Perumdos Kampus ITS, Keputih-Sukolilo, Surabaya','031- 5938815','031-5961215');
INSERT INTO WISMA VALUES ('B','Bougenville','Jl. Teknik Arsitektur Blok H 8 – 12, Perumdos Kampus ITS, Keputih- Sukolilo, Surabaya','031-5915974','031-5961215');
INSERT INTO WISMA VALUES ('J','Jasmine','Jl. Teknik Sipil Blok J-7, Perumdos Kampus ITS, Keputih-Sukolilo, Surabaya','031- 5938815','031-5961215');

INSERT INTO RESERVASI VALUES('001','3275091712960007','19001','25-DEC-2015','26-DEC-2015','1','0','200000');
INSERT INTO RESERVASI VALUES('002','3208139495046242','19007','26-DEC-2015','30-DEC-2015','4','0','800000');
INSERT INTO RESERVASI VALUES('003','3275096549308463','19007','27-DEC-2015','30-DEC-2015','3','0','600000');
INSERT INTO RESERVASI VALUES('004','3938954952452234','19005','28-DEC-2015','30-DEC-2015','2','0','400000');
INSERT INTO RESERVASI VALUES('005','3024754864802942','19004','29-DEC-2015','30-DEC-2015','1','0','200000');
INSERT INTO RESERVASI VALUES('006','3208139495046242','19004','01-NOV-2015','04-NOV-2015','3','0','600000');


INSERT INTO KAMAR VALUES ('101','F','VIP','Penuh');
INSERT INTO KAMAR VALUES ('102','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('103','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('104','F','VIP','Penuh');
INSERT INTO KAMAR VALUES ('105','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('106','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('107','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('108','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('109','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('110','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('111','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('112','F','VIP','Penuh');
INSERT INTO KAMAR VALUES ('113','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('114','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('115','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('116','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('117','F','VIP','Penuh');
INSERT INTO KAMAR VALUES ('118','F','VIP','Penuh');
INSERT INTO KAMAR VALUES ('119','F','VIP','Penuh');
INSERT INTO KAMAR VALUES ('120','F','VIP','Kosong');
INSERT INTO KAMAR VALUES ('201','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('202','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('203','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('204','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('205','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('206','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('207','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('208','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('209','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('210','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('211','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('212','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('213','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('214','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('215','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('216','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('217','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('218','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('219','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('220','F','EKSEKUTIF','Kosong');
INSERT INTO KAMAR VALUES ('301','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('302','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('303','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('304','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('305','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('306','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('307','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('308','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('309','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('310','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('311','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('312','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('313','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('314','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('315','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('316','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('317','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('318','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('319','F','STANDAR','Kosong');
INSERT INTO KAMAR VALUES ('320','F','STANDAR','Kosong');


INSERT INTO DETAIL_RESERVASI VALUES ('101','001');
INSERT INTO DETAIL_RESERVASI VALUES ('104','002');
INSERT INTO DETAIL_RESERVASI VALUES ('112','003');
INSERT INTO DETAIL_RESERVASI VALUES ('117','004');
INSERT INTO DETAIL_RESERVASI VALUES ('118','005');
INSERT INTO DETAIL_RESERVASI VALUES ('119','006');
