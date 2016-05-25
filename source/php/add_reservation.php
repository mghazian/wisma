<?php
	require_once 'common.php';
		PROCEDURE ADD_RESERVATION(
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
?>

<html>
<head>
	<title>Add Reservation</title>
</head>
	<h1>Add Reservation</h1>

<body>
	
	<form method='POST' action='add_reservation.php'>
		
		ID Reservasi: <input type="text" name="id_reservasi"><br>
		No KTP: <input type="text" name="no_ktp"><br>
		NIP: <input type="text" name="nip"><br>
		Tanggal Checkin: <input type="text" name="checkin"><br>
		Tanggal Checkout: <input type="text" name="checkout"><br>
		Lama Peminjaman: <input type="text" name="lama"><br>
		Denda: <input type="text" name="denda"><br>
		Total: <input type="text" name="total"><br>
<input type='submit' value='Add'></td>
</form>



	</form>
</body>