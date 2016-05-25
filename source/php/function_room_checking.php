<?php
	require_once 'common.php';

	$query = "SELECT 	KAMAR.NO_KAMAR AS NO_KAMAR,
						STATUS_KAMAR,
						ROOM_CHECKING(KAMAR.STATUS_KAMAR) AS DESK
			  FROM KAMAR";
	$result = dispatchQuery (connectToDatabase ('FP_MBD', 'FP_MBD'), $query);
?>

<html>
<head>
	<title>Pengecekkan Kamar</title>
</head>
<body>
	<h1>Pengecekkan Kamar</h1>
	<table border="1" padding="2">
		<tr>
			<th>Nomor Kamar</th>
			<th>Status Kamar</th>
			<th>Cek</th>
		</tr>
		<?php while ($row = oci_fetch_object($result)) { ?>
		<tr>
			<td><?php echo $row->NO_KAMAR; ?></td>
			<td><?php echo $row->STATUS_KAMAR; ?></td>
			<td><?php echo $row->DESK; ?></td>
		</tr>
		<?php } ?>
	</table>
</body>