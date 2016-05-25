<html>
<body>
		<?php
		$no_ktp=$_POST['no_ktp'];
		$nip=$_POST['nip'];
		$checkin=$_POST['tanggal_check_in'];
		$checkout=$_POST['tanggal_check_out'];
		$lama=$_POST['lama_peminjaman'];
		$denda=$_POST['denda'];
		$total=$_POST['total'];

			$query = "INSERT INTO RESERVASI (ID_RESERVASI,NO_KTP,NIP,TANGGAL_CHECK_IN,TANGGAL_CHECK_OUT,LAMA_PEMINJAMAN,DENDA,TOTAL)
				values ('".$id_res."','".$no_ktp."','".$nip."','".$checkin."','".$checkout."','".$lama."','".$denda."','".$total."')";
			$result = dispatchQuery (connectToDatabase ('MBD2016', 'MBD2016'), $query);
		?>		$id_res=$_POST['id_reservasi'];
		
ID Reservasi : <?php echo $_POST["id_res"];?> <br>
No KTP : <?php echo $_POST["no_ktp"];?> <br>
NIP : <?php echo $_POST["nip"];?> <br>
Tanggal Checkin : <?php echo $_POST["checkin"];?> <br>
Tanggal Checkout : <?php echo $_POST["checkout"];?> <br>
Lama Peminjaman : <?php echo $_POST["lama"];?> <br>
Denda : <?php echo $_POST["denda"];?> <br>
Total : <?php echo $_POST["total"];?> <br>
</body>
</html>