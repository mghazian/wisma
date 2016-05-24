/*****************************************
    VIEW ROOM_FACILITY - Muhammad Ghazian 
 *****************************************/
CREATE VIEW ROOM_FACILITY as
SELECT NO_KAMAR, ID_WISMA, NAMA_FASILITAS
FROM FASILITAS, KAMAR
WHERE FASILITAS.ID_KATEGORI = KAMAR.ID_KATEGORI;


/********************************************
    FUNCTION CAN_OCCUPY
    Mengembalikan nilai 1 jika kamar
    PARAM_NO_KAMAR sedang kosong. 0 jika
    sebaliknya
 ********************************************/
CREATE OR REPLACE
FUNCTION CAN_OCCUPY (PARAM_NO_KAMAR NUMBER)
RETURN INTEGER
AS
  occupied INTEGER;
BEGIN
  SELECT COUNT (NO_KAMAR) INTO occupied
  FROM KAMAR
  WHERE no_kamar = PARAM_NO_KAMAR AND status_kamar = 'Kosong';
  dbms_output.put_line (occupied);
  RETURN occupied;
END;

/**********************************************
    FUNCTION GET_ROOM_PRICE - Muhammad Ghazian
    Mengambil harga kamar berdasarkan
    nomor kamar
 **********************************************/
CREATE OR REPLACE
FUNCTION GET_ROOM_PRICE (PARAM_NO_KAMAR NUMBER)
RETURN INTEGER
AS
  price INTEGER;
BEGIN
  SELECT HARGA INTO price
  FROM KATEGORI, kamar
  WHERE KATEGORI.ID_KATEGORI = KAMAR.id_kategori AND NO_KAMAR = PARAM_NO_KAMAR;
  RETURN price;
END;

/*******************************************************
    INDEX ID_KATEGORI_FASILITAS_IX - Muhammad Ghazian
    Menambahkan index pada atribut id_kategori pada
    tabel 'Fasilitas'
 *******************************************************/
CREATE INDEX ID_KATEGORI_FASILITAS_IX
ON FASILITAS (ID_KATEGORI);

/**********************************************
    TRIGGER CHECKOUT_FINE - Muhammad Ghazian
    Menambah denda pada tuple reservasi tertentu
    jika terjadi keterlambatan checkout
 **********************************************/
CREATE OR REPLACE
TRIGGER CHECKOUT_FINE
BEFORE UPDATE ON RESERVASI
FOR EACH ROW
DECLARE
    fineCost INTEGER;
    dayDue INTEGER;
BEGIN
    fineCost := 50000;  --Ubah denda disini
    dayDue := :new.TANGGAL_CHECK_OUT - :old.TANGGAL_CHECK_OUT;
    
    IF (dayDue > 0) THEN
      :new.DENDA := :new.DENDA + dayDue * fineCost;
    END IF;
END;

/**************************************************
    PROCEDURE DELETE_FACILITY - Muhammad Ghazian
    Menghapus fasilitas dengan id_fasilitas
    PARAM_ID_FASILITAS
 **************************************************/
CREATE OR REPLACE
PROCEDURE DELETE_FACILITY (PARAM_ID_FASILITAS VARCHAR2)
AS
BEGIN
  DELETE FASILITAS WHERE id_fasilitas = PARAM_ID_FASILITAS;
END;