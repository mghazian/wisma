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