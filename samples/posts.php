<?php

require '../db.php';

$stmts = json_decode(file_get_contents("../samples.json"), true)['statements'];

$dir = "../pexels/";
$files = [];
$i = 0;
if (is_dir($dir)) {
    if ($dh = opendir($dir)) {
        while (($file = readdir($dh)) !== false) {
        	if (filetype($dir.$file) == "dir") {
        		//array_push($folders, $file);
        	}
        	else{
        		array_push($files, $file);
        	}
        }
    }
}

$pindex = 0;

for ($i=0; $i < 200; $i++) { 
	$user = rand(1,67);

	$hasPic = rand(0,1) == 1;
	$ps = rand(1,4);
	$text = "";
	for ($j=0; $j < $ps; $j++) { 
		$text .= " ".$stmts[rand(0,count($stmts)-1)];
	}

	$text = trim($text);

	$time = time() - rand(0, 14 * 24 * 3600);

	$ins = $db->query("INSERT INTO `updates`(`id`, `user`, `text`, `date`, `status`) VALUES (NULL, '$user', '$text', '$time', 'active')");
	if ($ins) {
		$post_id = $db->insert_id;
		if ($pindex < count($files)-1) {
			$filename = $files[$pindex];
			$pindex += 1;
			$db->query("INSERT INTO `attachements`(`id`, `filename`, `thumbnail`, `post`, `date`, `user`) VALUES (NULL, '$filename', '$filename', '$post_id', '$time', '$user')");
		}
	}
}

echo "done";