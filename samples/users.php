<?php

require '../db.php';
require '../imageClass.php';

$names = [];

foreach (json_decode(file_get_contents("../users.json"), true) as $row) {
	array_push($names, $row['name']);
}

$dir = "../pexels/";

$i = 0;
if (is_dir($dir)) {
    if ($dh = opendir($dir)) {
        while (($file = readdir($dh)) !== false) {
        	if (filetype($dir.$file) == "dir") {
        		//array_push($folders, $file);
        	}
        	else{
        		$filename = rand(10001,90009)."_".rand(10001,90009).".png";
        		$img = new rodzImage("../pexels/".$file);
        		$img->cropImage("../profiles/".$filename);

        		//echo "$file and {$names[$i]} br";
        		$db->query("INSERT INTO `users`(`id`, `name`, `photo`, `status`, `refer`) VALUES (NULL, '{$names[$i]}', '$filename', 'active', '0')");
        		$i += 1;
        	}
        }
    }
}


echo "Almost done";