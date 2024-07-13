<?php

$db = new mysqli("localhost", "root", "", "gossip");

$config = [
	'songs_url' => "http://localhost/songs/web-handler.php"
];

function getData($table, $array){
	global $db;

	$wheres = [];

	foreach ($array as $key => $value) {
		array_push($wheres, "`$key` = '$value' ");
	}

	return $db->query("SELECT * FROM `$table` WHERE ".implode(" AND ", $wheres))->fetch_assoc();
}

function getAll($table, $ref=null){
	global $db;

	if ($ref == null) {
		$read = $db->query("SELECT * FROM `$table` ");
		$rows = [];
		while ($row = $read->fetch_assoc()) {
			array_push($rows, $row);
		}

		return $rows;
	}
	else{
		$read = $db->query("SELECT * FROM `$table` ");
		$rows = [];
		while ($row = $read->fetch_assoc()) {
			$rows[$row[$ref]] = $row;
		}

		return $rows;
	}
}

class Crypto{
	public static function uid($length)
	{
		$characters = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-', '_', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
		$str = "";
		for ($i=0; $i < $length; $i++) { 
			$str .= $characters[rand(0,count($characters)-1)];
		}
		return $str;
	}

	public static function letters($length)
	{
		$characters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
		$str = "";
		for ($i=0; $i < $length; $i++) { 
			$str .= $characters[rand(0,count($characters)-1)];
		}
		return $str;
	}
}

function fileExtension($filename){
	$filename = explode("?", $filename)[0];

	$chars = explode(".", $filename);

	return strtolower($chars[count($chars)-1]);
}
?>