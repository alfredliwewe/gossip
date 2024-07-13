<?php
header('Content-Type: application/json; charset=utf-8');
require 'db.php';
require 'functions.php';
$files = json_decode(file_get_contents("objects/lock.json"), true);
$time = time();

foreach ($files as $file) {
	require "objects/".$file['name'].'.php';
}

if (isset($_POST['getPosts'])) {
	$user = (int)$_POST['getPosts'];
	$already = [];
	$read = $db->query("SELECT post FROM viewed WHERE type = 'post' AND viewer = '$user' ");
	while ($row = $read->fetch_assoc()) {
		array_push($already, $row['post']);
	}
	$where = "";
	if (count($already) > 0) {
		$where = " WHERE id NOT IN (".implode(",", $already).")";
	}
	$read = $db->query("SELECT * FROM updates $where LIMIT 10");
	$data = [];
	$viewed = [];
	while ($row = $read->fetch_assoc()) {
		array_push($viewed, $row['id']);
		$row['ago'] = date('d-M-Y', $row['date']);
		$row['user_data'] = $db->query("SELECT * FROM users WHERE id = '{$row['user']}' ")->fetch_assoc();
		$attachments = [];
		$sql = $db->query("SELECT * FROM attachements WHERE post = '{$row['id']}' ");
		while ($r = $sql->fetch_assoc()) {
			$r['file'] = $r['filename'];
			array_push($attachments, $r);
		}
		$row['likes'] = $db->query("SELECT * FROM likes WHERE post = '{$row['id']}' AND type = 'post' ")->num_rows;
		$row['hasLiked'] = $db->query("SELECT * FROM likes WHERE post = '{$row['id']}' AND type = 'post' AND user = '$user' ")->num_rows > 0;
		$row['attachments'] = $attachments;
		if ($row['user_data']) {
			array_push($data, $row);
		}
		
	}

	$values = [];
	$sql = "INSERT INTO `viewed`(`id`, `viewer`, `post`, `type`, `time`) VALUES ";
	foreach ($viewed as $post) {
		array_push($values, "(NULL, '$user', '$post', 'post', '$time')");
	}
	$db->query($sql.implode(",", $values));

	echo json_encode($data);
}
elseif (isset($_POST['getComments'], $_POST['user'])) {
	$story = (int)trim($_POST['getComments']);
	$user_id = (int)trim($_POST['user']);

	$story = new Story($story);
	$comments = $story->getComments();

	$data = [];

	foreach($comments as $comm){
		$row = $comm->data;
		$row['user'] = $comm->user;
		$row['hasLiked'] = $comm->hasLiked($user_id);

		array_push($data, $row);
	}

	//header('Content-Type: application/json; charset=utf-8');
	echo json_encode($data);
}
elseif (isset($_POST['sendComment'], $_POST['user'], $_POST['story'])) {
	$comment = $db->real_escape_string($_POST['sendComment']);
	$user_id = (int)trim($_POST['user']);
	$story = (int)trim($_POST['story']);

	$ins = $db->query("INSERT INTO `comments`(`id`, `user`, `story`, `content`, `parent`, `time`, `status`) VALUES (NULL, '$user_id', '$story', '$comment', '0', '$time', 'sent')");
	if ($ins) {
		echo json_encode(['status' => true, 'message' => "Success"]);
	}
	else{
		echo json_encode(['status' => false, 'message' => $db->error]);
	}
}
elseif (isset($_POST['replyContent'], $_POST['story'], $_POST['parent'], $_POST['user'])) {
	$content = $db->real_escape_string($_POST['replyContent']);
	$story = (int)trim($_POST['story']);
	$parent = (int)trim($_POST['parent']);
	$user = (int)trim($_POST['user']);

	header('Content-Type: application/json; charset=utf-8');
	$ins = $db->query("INSERT INTO `comments`(`id`, `user`, `story`, `content`, `parent`, `time`, `status`) VALUES (NULL, '$user', '$story', '$content', '$parent', '$time', 'sent')");
	if ($ins) {
		echo json_encode(['status' => true, 'message' => "Success"]);
	}
	else{
		echo json_encode(['status' => false, 'message' => $db->error]);
	}
}
elseif (isset($_POST['getReplies'], $_POST['user'])) {
	$parent = (int)trim($_POST['getReplies']);
	$user = (int)trim($_POST['user']);

	$replies = [];
	$s = $db->query("SELECT * FROM comments WHERE parent = '$parent' ORDER BY id DESC");
	while ($rrow = $s->fetch_assoc()) {
		$u = new User($rrow['user']);
		$rrow['user'] = $u->data;
		$rrow['ago'] = time_ago($rrow['time']);
		array_push($replies, $rrow);
	}

	header('Content-Type: application/json; charset=utf-8');
	echo json_encode($replies);
}
elseif (isset($_POST['getGossipData'])) {
	$id = (int)$_POST['getGossipData'];

	$check = $db->query("SELECT * FROM users WHERE refer = '$id' ");
	if ($check->num_rows > 0) {
		$data = $check->fetch_assoc();
		if (!file_exists("profiles/".$data['photo'])) {
			file_put_contents("profiles/".$data['photo'], file_get_contents("http://localhost/songs/profiles/".$data['photo']));
		}
		echo json_encode($data);
	}
	else{
		$res = curl_post($config['songs_url'], ['getUserData' => $id], []);
		$data = json_decode($res, true);

		if ($data != null) {
			$ref = Crypto::uid(11);
			$ins = $db->query("INSERT INTO `users`(`id`, `name`, `photo`, `status`, `refer`, `country`, `type`, `date`, `ref`) VALUES (NULL, '{$data['name']}', '{$data['photo']}', 'active', '$id', '{$data['country']}', 'user', '$time', '$ref')");
			$gid = $db->insert_id;
			$check = $db->query("SELECT * FROM users WHERE id = '$gid' ")->fetch_assoc();
			echo json_encode($data);
		}
		else{
			echo json_encode(['status' => false, 'message' => $res]);
		}
	}
}
elseif (isset($_POST['toggleLike'], $_POST['user'])) {
	$post = (int)$_POST['toggleLike'];
	$user = (int)$_POST['user'];

	$check = $db->query("SELECT * FROM likes WHERE user = '$user' AND type = 'post' AND post = '$post'");
	if ($check->num_rows > 0) {
		$d = $check->fetch_assoc();
		$db->query("DELETE FROM likes WHERE id = '{$d['id']}' ");
		echo json_encode(['status' => true, 'message' => "Unliked", 'hasLiked' => false]);
	}
	else{
		//echo json_encode(['status' => false, 'message' =>])
		$ins = $db->query("INSERT INTO `likes`(`id`, `user`, `post`, `type`, `date`) VALUES (NULL, '$user', '$post', 'post', '$time')");
		echo json_encode(['status' => true, 'message' => "Liked", 'hasLiked' => true]);
	}
}
elseif (isset($_POST['likeComment'], $_POST['user'])) {
	$post = (int)$_POST['likeComment'];
	$user = (int)$_POST['user'];

	$check = $db->query("SELECT * FROM likes WHERE user = '$user' AND type = 'comment' AND post = '$post'");
	if ($check->num_rows > 0) {
		$d = $check->fetch_assoc();
		$db->query("DELETE FROM likes WHERE id = '{$d['id']}' ");
		$likes = $db->query("SELECT * FROM likes WHERE post = '$post' AND type = 'comment' ")->num_rows;
		echo json_encode([
			'status' => true, 
			'message' => "Unliked", 
			'hasLiked' => false,
			'likes' => $likes
		]);
	}
	else{
		//echo json_encode(['status' => false, 'message' =>])
		$ins = $db->query("INSERT INTO `likes`(`id`, `user`, `post`, `type`, `date`) VALUES (NULL, '$user', '$post', 'comment', '$time')");
		$likes = $db->query("SELECT * FROM likes WHERE post = '$post' AND type = 'comment' ")->num_rows;
		echo json_encode([
			'status' => true, 
			'message' => "Liked", 
			'hasLiked' => true,
			'likes' => $likes
		]);
	}
}

elseif (isset($_POST['createPost'], $_POST['user'])) {
	$text = $db->real_escape_string($_POST['createPost']);
	$user = (int)$_POST['user'];

	$ins = $db->query("INSERT INTO `updates`(`id`, `user`, `text`, `date`, `status`) VALUES (NULL, '$user', '$text', '$time', 'active')");
	echo json_encode([
		'status' => true, 
		'message' => "Posted", 
		'post_id' => $db->insert_id
	]);
}

elseif (isset($_POST['attachment'], $_POST['post_id'], $_POST['filename'])) {
	file_put_contents("uploads/".$_POST['filename'], base64_decode($_POST['attachment']));
	$post = (int)$_POST['post_id'];
	$user = (int)$_POST['user'];

	//save to db
	$ins = $db->query("INSERT INTO `attachements`(`id`, `filename`, `thumbnail`, `post`, `date`, `user`) VALUES (NULL, '{$_POST['filename']}', '{$_POST['filename']}', '$post', '$time', '$user') ");
	echo json_encode(['status' => true, 'message' => "Success"]);
}

elseif (isset($_POST['channel_name'], $_POST['photo'], $_POST['country'])) {
	$chars = explode(".", $_POST['photo']);
	$ext = strtolower($chars[count($chars)-1]);

	$name = $db->real_escape_string($_POST['channel_name']);
	$country = $db->real_escape_string($_POST['country']);

	$check = $db->query("SELECT * FROM users WHERE name = '$name' AND type = 'channel' ");
	if ($check->num_rows > 0) {
		echo json_encode(['status' => false, 'message' => "$name is already registered"]);
	}
	else{
		$allowed = ["jpeg","png","gif","svg","bmp","webp","ico","tiff","heif","heic","jpeg 2000","jpg"];
		if (in_array($ext, $allowed)) {
			$filename = Crypto::letters(32).".".$ext;
			$ref = Crypto::uid(11);

			file_put_contents("profiles/$filename", file_get_contents($_POST['photo']));

			$ins = $db->query("INSERT INTO `users`(`id`, `name`, `photo`, `status`, `refer`, `country`, `type`, `date`, `ref`) VALUES (NULL,'$name', '$filename', 'active', '0', '$country', 'channel', '$time', '$ref')");

			echo json_encode(['status' => true, 'message' => "Success", 'ref' => $ref, 'insert_id' => $db->insert_id]);
		}
		else{
			echo json_encode(['status' => false, 'message' => "Unsupported image type"]);
		}
	}
}

elseif (isset($_POST['user_ref'], $_POST['title'], $_POST['intro'], $_POST['link'], $_POST['image'])) {
	$user_ref = $db->real_escape_string($_POST['user_ref']);
	$title = $db->real_escape_string($_POST['title']);
	$intro = $db->real_escape_string($_POST['intro']);
	$image = $db->real_escape_string($_POST['image']);
	$link = $db->real_escape_string($_POST['link']);

	//check user
	$check = $db->query("SELECT * FROM users WHERE ref = '$user_ref' ");
	if ($check->num_rows > 0) {
		$user_data = $check->fetch_assoc();
		$user_id = $user_data['id'];

		$ext = fileExtension($image);

		$allowed = ["jpeg","png","gif","svg","bmp","webp","ico","tiff","heif","heic","jpeg 2000","jpg"];
		if (in_array($ext, $allowed)) {
			$filename = Crypto::letters(32).".".$ext;

			$ins = $db->query("INSERT INTO `articles`(`id`, `user`, `user_ref`, `link`, `title`, `intro`, `image`, `date`, `status`) VALUES (NULL, '$user_id', '$user_ref', '$link', '$title', '$intro', '$filename', '$time', 'active')");

			file_put_contents("uploads/$filename", file_get_contents($_POST['image']));

			echo json_encode(['status' => true, 'message' => "Success"]);
		}
		else{
			echo json_encode(['status' => false, 'message' => "Unsupported image type"]);
		}
	}
	else{
		echo json_encode(['status' => false, 'message' => "Incorrect user ref:"]);
	}
}
?>