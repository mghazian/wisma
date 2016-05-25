<?php
	
	require_once 'common.php';

	$query = "SELECT * FROM ROOM_FACILITY";
	$result = dispatchQuery (connectToDatabase('FP_MBD', 'FP_MBD'), $query);

?>

<html>
<head>
	<title>View Ruangan dan Fasilitas</title>
</head>
<body>
	<h1>View Ruangan dan Fasilitas
	<table border='2'>
		<tr>
			<th>HEADER 1</th>
			<th>HEADER 2</th>
			<th>HEADER 3</th>
		</tr>
		<?php while ($row = oci_fetch_object ($result)) { ?>
		<tr>
			<td><?php echo $row->NO_KAMAR?></td>
			<td><?php echo $row->ID_WISMA?></td>
			<td><?php echo $row->NAMA_FASILITAS?></td>
		</tr>
		<?php } ?>

	</table>
</body>