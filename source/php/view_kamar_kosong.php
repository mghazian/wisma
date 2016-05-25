<?php
	
	require_once 'common.php';

	$query = "SELECT * FROM VIEW_UNOCCUPIED";
	$result = dispatchQuery (connectToDatabase('FP_MBD', 'FP_MBD'), $query);

?>

<html>
<head>
	<title>View Kamar yang Masih Kosong</title>
</head>
<body>
	<h1>View Kamar yang Masih Kosong
	<table border='2'>
		<tr>
			<th>Nama Wisma</th>
			<th>ID Kategori</th>
			<th>Nomor Kamar</th>
			<th>Status Kamar</th>
		</tr>
		<?php while ($row = oci_fetch_object ($result)) { ?>
		<tr>
			<td><?php echo $row->NAMA_WISMA?></td>
			<td><?php echo $row->ID_KATEGORI?></td>
			<td><?php echo $row->NO_KAMAR?></td>
			<td><?php echo $row->STATUS_KAMAR?></td>
		</tr>
		<?php } ?>

	</table>
</body>
