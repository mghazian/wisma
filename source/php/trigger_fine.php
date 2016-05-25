<?php
	require_once 'common.php';

	$connection = connectToDatabase ('FP_MBD', 'FP_MBD');
	$isConfirming = (!empty ($_POST['no_kamar']));

	//	Do the checkout
	if (!empty($_POST['id_reservasi']))
	{
		$query = "UPDATE RESERVASI SET TANGGAL_CHECK_OUT = SYSDATE WHERE ID_RESERVASI = " . $_POST['id_reservasi'];
		dispatchQuery ($connection, $query);

		$isConfirming = false;
	}

	if ($isConfirming == true)
	{
		$confirmation_information = " SELECT ID_RESERVASI, NAMA, NO_KAMAR, NAMA_WISMA
									  FROM TAMU,
									  (
										SELECT G.*, NO_KTP
										FROM RESERVASI,
										(
										SELECT DETAIL_RESERVASI.*, NAMA_WISMA
										FROM DETAIL_RESERVASI,
										  (
										    SELECT NAMA_WISMA, NO_KAMAR
										    FROM WISMA, KAMAR
										    WHERE WISMA.id_wisma = KAMAR.ID_WISMA AND status_kamar = 'Penuh'
										  ) X
										  WHERE DETAIL_RESERVASI.no_kamar = X.NO_KAMAR
										) G
										WHERE G.ID_RESERVASI = RESERVASI.ID_RESERVASI
									  ) J
									  WHERE TAMU.NO_KTP = J.NO_KTP AND NO_KAMAR = " . $_POST['no_kamar'];
	}

	$query = "SELECT KAMAR.NO_KAMAR AS NO_KAMAR, ID_WISMA
			  FROM DETAIL_RESERVASI, KAMAR
			  WHERE STATUS_KAMAR = 'Penuh' AND KAMAR.NO_KAMAR = DETAIL_RESERVASI.NO_KAMAR";
	$result = dispatchQuery ($connection, $query);
?>

<html>
<head>
	<title>Checkout</title>
</head>
<body>
	<h1>Checkout</h1>

	<form method='POST' action='trigger_fine.php'>
	<table cellpadding='5'>
		<tr>
			<td><label>No Kamar</label></td>
			<td><select name='no_kamar'>
				<?php while ($row = oci_fetch_object($result)) { ?>
				<option value=<?php echo $row->NO_KAMAR; ?> ><?php echo $row->NO_KAMAR . ' (' . $row->ID_WISMA . ')'; ?></option>
				<?php } ?>
			</select></td>
			<td><input type='submit' value='Checkout'></td>
		</tr>
	</table>
	</form>
	<br/>
	<?php if ( isset($confirmation_information) )
	{
		$result = dispatchQuery($connection, $confirmation_information);
		$data = oci_fetch_object($result); ?>
	<table cellpadding="8">
		<tr>
			<td>Nama Peminjam</td>
			<td><?php echo $data->NAMA; ?></td>
		</tr>
		<tr>
			<td>Kamar</td>
			<td><?php echo $data->NO_KAMAR; ?></td>
		</tr>
		<tr>
			<td>Wisma</td>
			<td><?php echo $data->NAMA_WISMA; ?></td>
		</tr>
	</table>
	<form method='POST' action='trigger_fine.php'>
		<input type='hidden' name='id_reservasi' value=<?php echo $data->ID_RESERVASI; ?> />
		<input type='submit' value='Confirm' />
	</form>
	<?php } ?>
	<?php if (!empty ($_POST['id_reservasi'])) {
		$query = "SELECT * FROM RESERVASI WHERE ID_RESERVASI = " . $_POST['id_reservasi'];
		$result = dispatchQuery ($connection, $query);
		$data = oci_fetch_object($result);
	?>
	<table>
		<tr>
			<td>ID Reservasi</td>
			<td><?php echo $data->ID_RESERVASI; ?></td>
		</tr>
		<tr>
			<td>NO KTP Peminjam</td>
			<td><?php echo $data->NO_KTP; ?></td>
		</tr>
		<tr>
			<td>Jangka Waktu Peminjaman Terdaftar</td>
			<td><?php echo $data->LAMA_PEMINJAMAN; ?></td>
		</tr>
		<tr>
			<td>Tanggal Check In</td>
			<td><?php echo $data->TANGGAL_CHECK_IN; ?></td>
		</tr>
		<tr>
			<td>Tanggal Check Out</td>
			<td><?php echo $data->TANGGAL_CHECK_OUT; ?></td>
		</tr>
		<tr>
			<td>Denda</td>
			<td><?php echo $data->DENDA; ?></td>
		</tr>
	</table>
	<?php } ?>
</body>