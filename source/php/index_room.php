<?php
	require_once 'common.php';

	$query = "SELECT * FROM KAMAR";
	$result = dispatchQuery (connectToDatabase ('FP_MBD', 'FP_MBD'), $query);
?>

<html>
<head>
	<title>Kamar</title>
</head>
<body>
	<h1>Kamar</h1>
	<table border="1" padding="2">
		<tr>
			<th>No Kamar</th>
			<th>ID Wisma</th>
			<th>ID Kategori</th>
			<th>Status Kamar</th>
		</tr>
		<?php while ($row = oci_fetch_object($result)) { ?>
		<tr>
			<td><?php echo $row->NO_KAMAR; ?></td>
			<td><?php echo $row->ID_WISMA; ?></td>
			<td><?php echo $row->ID_KATEGORI; ?></td>
			<td><?php echo $row->STATUS_KAMAR; ?></td>
		</tr>
		<?php } ?>
	</table>
</body>