<?php
	require_once 'common.php';
?>

<html>
<head>
	<title>Delete Fasilitas</title>
</head>
<body>
	<h1>Delete Fasilitas</h1>
	<?php

	if (!empty($_POST['id_fasilitas']))
	{
		$id = $_POST['id_fasilitas'];
		$del = "BEGIN DELETE_FACILITY ('" . $id . "'); END;";
		$result = dispatchQuery (connectToDatabase ('FP_MBD', 'FP_MBD'), $del);
		echo "<h4>Data berhasil dihapus!</h4>";
	}

	?>
	<form method='POST' action='delete_facility.php'>
		<?php
			$query = "SELECT ID_FASILITAS, NAMA_FASILITAS FROM FASILITAS";
			$result = dispatchQuery (connectToDatabase ('FP_MBD', 'FP_MBD'), $query);
		?>

		<table>
			<tr>
				<td><label>Fasilitas</label></td>
				<td>
					<select name='id_fasilitas'>
						<?php while ($row = oci_fetch_object ($result)) { ?>
							<option value=<?php echo $row->ID_FASILITAS; ?> ><?php echo $row->NAMA_FASILITAS; ?></option>
						<?php } ?>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type='submit' value='Delete'></td>
			</tr>
		</table>
	</form>
</body>