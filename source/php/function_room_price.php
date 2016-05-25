<?php
	require_once 'common.php';

	$query = "SELECT 	KAMAR.NO_KAMAR AS NO_KAMAR,
						NAMA_WISMA,
						GET_ROOM_PRICE(KAMAR.NO_KAMAR) AS HARGA_KAMAR
			  FROM KAMAR, WISMA
			  WHERE KAMAR.ID_WISMA = WISMA.ID_WISMA";
	$result = dispatchQuery (connectToDatabase ('FP_MBD', 'FP_MBD'), $query);
?>

<html>
<head>
	<title>Daftar Kamar</title>
</head>
<body>
	<h1>Daftar Kamar</h1>
	<table border="1" padding="2">
		<tr>
			<th>Nomor Kamar</th>
			<th>Wisma</th>
			<th>Harga Kamar</th>
		</tr>
		<?php while ($row = oci_fetch_object($result)) { ?>
		<tr>
			<td><?php echo $row->NO_KAMAR; ?></td>
			<td><?php echo $row->NAMA_WISMA; ?></td>
			<td><?php echo $row->HARGA_KAMAR; ?></td>
		</tr>
		<?php } ?>
	</table>
</body>