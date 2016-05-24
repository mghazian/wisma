<?php
	
	/**
	 *	connectToDatabase
	 *	Connects to 10g SQL (Oracle) database
	 *	Set the $username, %password, and $host accordingly to begin with
	 *	@param $username defines the username one uses when connecting to Oracle
	 *	@param $password defines the password which corresponds to $username
	 *	@param $host defines idk lol fuck me
	 *	$host normally doesn't need adjustment, only %username and $password
	 */
	function connectToDatabase($username = 'FP', $password = 'FP', $host = 'localhost/XE')
	{
		$connection = oci_connect($username, $password, $host) or die ('Connection Failed!');
		if($connection)
			return $connection;
		else exit(1);
	}

	/**
	 *	dispatchQuery
	 *	Executes the query, and returns the result of the execution
	 *	@param $connection defines the database connection that is going to be
	 *		accessed for the $query. You might want to interload the $connection
	 *		with function connectToDatabase() instead
	 */
	function dispatchQuery($connection, $query)
	{
		$execute = oci_parse($connection, $query) or die ('Connection Error');
		oci_execute($execute);
		return $execute;
	}

?>