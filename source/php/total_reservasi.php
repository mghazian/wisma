<?php
	
	require_once 'common.php';

	$query = "SELECT id_reservasi,harga_total(id_reservasi) as apa_kek FROM reservasi";
	$result = dispatchQuery (connectToDatabase('mbd2016', 'mbd2016'), $query);

?>

<html>
<head>
	<title>Total Biaya Reservasi</title>
</head>
<body>
	<h1>Total Biaya Reservasi
	<table border='2'>
		<tr>
			<th>ID Reservasi</th>
			<th>Harga Total</th>

		</tr>
		<?php while ($row = oci_fetch_object ($result)) { ?>
		<tr>
			<td><?php echo $row->ID_RESERVASI?></td>
			<td><?php echo $row->APA_KEK?></td>
		</tr>
		<?php } ?>

	</table>
</body>
