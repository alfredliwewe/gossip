<?php 
function time_ago($time){
	$labels = [
		['s', 60],
		['min', 3600],
		['h', 3600 * 24],
		['d', 3600 * 24 * 7],
		['w', 3600 * 24 * 7 * 4],
		['mon', 3600 * 24 * 7 * 30],
		['y', 3600 * 24 * 7 * 30 * 12]
	];

	$dif = time() - $time;

	$can = true;
	$label = null;
	$div = 1;

	if ($dif == 0) {
		return "now";
	}

	for ($i=0; $i < count($labels); $i++) { 
		if ($dif < $labels[$i][1]) {
			if($can){
				$can = false;
				$label = $labels[$i][0];

				if($i != 0){
					$div = $labels[$i-1][1];
				}
			}
		}
	}

	if ($label == null) {
		return "Unknown";
	}
	else{
		return floor($dif/$div).$label;
	}
}

function curl_post($url, array $post = NULL, array $options = array()) { 
	$defaults = array( 
		CURLOPT_POST => 1, 
		CURLOPT_HEADER => 0, 
		CURLOPT_URL => $url, 
		CURLOPT_FRESH_CONNECT => 1, 
		CURLOPT_RETURNTRANSFER => 1, 
		CURLOPT_FORBID_REUSE => 1, 
		CURLOPT_TIMEOUT => 4, 
		CURLOPT_POSTFIELDS => http_build_query($post) 
	); 

	$ch = curl_init(); 
	curl_setopt_array($ch, ($options + $defaults)); 
	if( ! $result = curl_exec($ch)) { 
		//trigger_error(curl_error($ch)); 
		return curl_error($ch);
	} 
	else{
		return $result;
	}
	curl_close($ch);
}

function sendEmail($to, $subject, $message){
	global $db;
	$to = $db->real_escape_string($to);
	$subject = $db->real_escape_string($subject);
	$message = $db->real_escape_string($message);

	$from = "liwewerobati@gmail.com";
	
	$ins = $db->query("INSERT INTO `emails`(`id`, `receiver`, `subject`, `message`) VALUES (NULL, '$to', '$subject', '$message')");
	if (!$ins) {
		file_put_contents('email_log.txt', file_get_contents('email_log.txt')."||".$db->error);
	}
	return curl_post("https://adimo-shopping.com/saved/mail.php", ['from' => $from, 'email' => $to, 'subject' => $subject, 'message' => $message], []);
}

function sendMessage($to, $message){
	global $db;
	$to = $db->real_escape_string($to);
	//$subject = $db->real_escape_string($subject);
	$message = $db->real_escape_string($message);
	$time = time();

	//$from = "ellentaniaphiri@gmail.com";
	
	$ins = $db->query("INSERT INTO `messages`(`id`, `receiver`, `message`, `date`) VALUES (NULL, '$to', '$message', '$time')");
	if (!$ins) {
		file_put_contents('email_log.txt', file_get_contents('email_log.txt')."||".$db->error);
	}
	return curl_post("http://localhost/sms/", ['phone' => $to, 'message' => $message], []);
}

function distance($point1, $point2){
	$distance = sqrt(pow(($point2[0] - $point1[0]), 2) + pow(($point2[1] - $point1[1]), 2)) * 111139;
	$distance = $distance / 1000;
	return round($distance,1);
}

function guidv4($data = null) {
    // Generate 16 bytes (128 bits) of random data or use the data passed into the function.
    $data = $data ?? random_bytes(16);
    assert(strlen($data) == 16);

    // Set version to 0100
    $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
    // Set bits 6-7 to 10
    $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

    // Output the 36 character UUID.
    return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
}

class SQLiteResult {
	function __construct($result)
	{
		$count = 0;
		$store = [];

		while ($row = $result->fetchArray(SQLITE3_ASSOC)) {
			$count += 1;
			array_push($store, $row);
		}
		$this->store = $store;
		$this->num_rows = $count;
		$this->index = 0;
	}

	public function fetch_assoc()
	{
		if ($this->index < $this->num_rows) {
			$this->index += 1;
			return $this->store[$this->index - 1];
		}
		else{
			return false;
		}
	}

	public function fetchArray()
	{
		if ($this->index < $this->num_rows) {
			$this->index += 1;
			return $this->store[$this->index - 1];
		}
		else{
			return false;
		}
	}
}

class mysql_like extends sqlite3
{
	public $error = "";
	public $insert_id = 0;

	function __construct($file)
	{
		parent::__construct($file);
	}
	
	public function query($sql)
	{
		$result = parent::query($sql);
		$this->error = $this->lastErrorMsg();
		$chars = explode(" ", trim($sql));

		if (strtolower($chars[0]) == "select") {
			return new SQLiteResult($result);
		}
		elseif (strtolower($chars[0]) == "insert") {
			return $result;
		}
		else{
			return $result;
		}
	}

	public function real_escape_string($str)
	{
		return $this->escapeString($str);
	}
}

function getDistrictPeople($district, $gender, $age_range){
	global $db;

	$data = [];
	$read = $db->query("SELECT DISTINCT locations.user, locations.id FROM locations JOIN users ON locations.user = users.id WHERE district = '$district' AND users.gender = '$gender' AND age BETWEEN {$age_range[0]} AND {$age_range[1]} ORDER BY locations.id DESC");
	while ($row = $read->fetch_assoc()) {
		array_push($data, $row['user']);
	}

	return $data;
}
?>