<?php
	require_once 'common.php';

	$query = "SELECT * FROM WISMA";
	$result = dispatchQuery (connectToDatabase ('mbd2016', 'mbd2016'), $query);
?>

<html>
<head>
	<title>Wisma</title>
</head>
<body>
	<h1>Wisma</h1>
	<table border="1" padding="2">
		<tr>
			<th>ID Wisma</th>
			<th>Nama Wisma</th>
		</tr>
		<?php while ($row = oci_fetch_object($result)) { ?>
		<tr>
			<td><?php echo $row->ID_WISMA; ?></td>
			<td><?php echo $row->NAMA_WISMA; ?></td>
		</tr>
		<?php } ?>
	</table>
</body>