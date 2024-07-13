<?php

require '../db.php';

$read = $db->query("SELECT * FROM users WHERE ref = '' ");
while ($row = $read->fetch_assoc()) {
	$ref = Crypto::uid(11);

	$db->query("UPDATE users SET ref = '$ref' WHERE id = '{$row['id']}' ");
}

echo "Done";
?>