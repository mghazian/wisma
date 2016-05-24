/*****************************************
    VIEW ROOM_CATEGORY_FACILITY_CAPACITY_PRICE - Muhammad Hanif
    Menampilkan kamar beserta kategori, kapasitas dan harga
 *****************************************/

CREATE VIEW ROOM_CATEGORY_FACILITY_CAPACITY AS
SELECT K.NO_KAMAR ,K.STATUS_KAMAR, I.ID_KATEGORI, I.HARGA, I.KAPASITAS
FROM KAMAR K, KATEGORI I
WHERE K.ID_KATEGORI=I.ID_KATEGORI;

SELECT * FROM ROOM_CATEGORY_FACILITY_CAPACITY;


/********************************************
    FUNCTION ROOM_CHECKING - Muhammad Hanif
    Mengecek apakah kamar bisa diisi atau tidak
********************************************/
CREATE OR REPLACE FUNCTION ROOM_CHECKING (STATUS_KAMAR in VARCHAR)
RETURN VARCHAR AS
STATUS VARCHAR (40);
BEGIN
IF STATUS_KAMAR = 'Penuh' THEN
STATUS:= 'Kamar tidak bisa diisi';
RETURN status;
END IF;
IF STATUS_KAMAR = 'Kosong' THEN
STATUS:= 'Kamar bisa diisi';
RETURN STATUS;
END IF;
END;

/*******************************************************
    INDEX ROOM_INDEX - Muhammad Hanif
    Menambahkan index pada atribut no_kamar pada
    tabel 'Kamar'
 *******************************************************/
CREATE INDEX ROOM_INDEX
ON KAMAR (NO_KAMAR, STATUS_KAMAR);

/**********************************************
    TRIGGER CHANGE_ROOM_STATUS - Muhammad Hanif
    Mengubah status kamar menjadi kosong
    saat peminjam melakukan checkout. 
    Artinya tanggal checkout pada tabel reservasi diubah menjadi tanggal dilakukannya checkout. 
    Pada saat itu kamar yang dipinjam akan berubah statusnya menjadi kosong
**********************************************/
CREATE OR REPLACE
TRIGGER CHANGE_ROOM_STATUS
AFTER UPDATE OF TANGGAL_CHECK_OUT 
ON RESERVASI 
FOR EACH ROW
DECLARE room INTEGER;
BEGIN
    select no_kamar into room
    from detail_reservasi
    where id_reservasi = :old.id_reservasi;
    update kamar
    set status_kamar='Kosong'
    where no_kamar=room;
END;

/**************************************************
    PROCEDURE ADD_RESERVATION - Muhammad Hanif
    Menambahkan tupel pada data reservasi 
 **************************************************/
CREATE OR REPLACE PROCEDURE ADD_RESERVATION(
	   p_idreservasi IN RESERVASI.ID_RESERVASI%TYPE,
	   p_noktp IN RESERVASI.NO_KTP%TYPE,
	   p_nip IN RESERVASI.NIP%TYPE,
	   p_tanggalcheckin IN RESERVASI.TANGGAL_CHECK_IN%TYPE,
     p_tanggalcheckout IN RESERVASI.TANGGAL_CHECK_OUT%TYPE,
     p_lamapeminjaman IN RESERVASI.LAMA_PEMINJAMAN%TYPE,
     p_denda IN RESERVASI.DENDA%TYPE,
     p_total IN RESERVASI.TOTAL%TYPE
     ) 
IS
BEGIN
  INSERT INTO RESERVASI ("ID_RESERVASI", "NO_KTP", "NIP", "TANGGAL_CHECK_IN", "TANGGAL_CHECK_OUT", "LAMA_PEMINJAMAN", "DENDA", "TOTAL") 
  VALUES (p_idreservasi, p_noktp, p_nip, p_tanggalcheckin, p_tanggalcheckout,
  p_lamapeminjaman, p_denda, p_total);
  COMMIT;
END;