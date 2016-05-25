<?php
	require_once 'common.php';

	$query = "SELECT * FROM FASILITAS";
	$result = dispatchQuery (connectToDatabase ('FP_MBD', 'FP_MBD'), $query);
?>

<html>
<head>
	<title>Fasilitas</title>
</head>
<body>
	<h1>Fasilitas</h1>
	<table border="1" padding="2">
		<tr>
			<th>ID Fasilitas</th>
			<th>ID Kategori</th>
			<th>Nama Fasilitas</th>
		</tr>
		<?php while ($row = oci_fetch_object($result)) { ?>
		<tr>
			<td><?php echo $row->ID_FASILITAS; ?></td>
			<td><?php echo $row->ID_KATEGORI; ?></td>
			<td><?php echo $row->NAMA_FASILITAS; ?></td>
		</tr>
		<?php } ?>
	</table>
</body>