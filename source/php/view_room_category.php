<?php
	
	require_once 'common.php';

	$query = "SELECT * FROM ROOM_CATEGORY";
	$result = dispatchQuery (connectToDatabase('FP_MBD', 'FP_MBD'), $query);

?>

<html>
<head>
	<title>View Kamar beserta kategori, harga dan kapasitas</title>
</head>
<body>
	<h1>View Kamar beserta kategori, harga dan kapasitas
	<table border='2'>
		<tr>
			<th>No Kamar</th>
			<th>Status Kamar</th>
			<th>ID Kategori</th>
			<th>Harga</th>
			<th>Kapasitas</th>
		</tr>
		<?php while ($row = oci_fetch_object ($result)) { ?>
		<tr>
			<td><?php echo $row->NO_KAMAR?></td>
			<td><?php echo $row->STATUS_KAMAR?></td>
			<td><?php echo $row->ID_KATEGORI?></td>
			<td><?php echo $row->HARGA?></td>
			<td><?php echo $row->KAPASITAS?></td>

		</tr>
		<?php } ?>

	</table>
</body>