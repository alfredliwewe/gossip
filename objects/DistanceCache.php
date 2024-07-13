<?php

/**
 * 
 */
class DistanceCache
{
	
	function __construct($user_id)
	{
		global $db;
		$this->db = $db;
		$this->user_id = $user_id;
	}

	public function save($friend, $distance)
	{
		$check = $this->db->query("SELECT * FROM distance_cache WHERE friend = '$friend' AND user = '".$this->user_id."' ");
		if ($check->num_rows == 0) {
			$this->db->query("INSERT INTO `distance_cache`(`id`, `user`, `friend`, `distance`) VALUES (NULL, '".$this->user_id."', '$friend', '$distance')");
		}
	}

	public function getAll()
	{
		$friends = [];
		$read = $this->db->query("SELECT * FROM distance_cache WHERE user = '".$this->user_id."' ");
		while ($row = $read->fetch_assoc()) {
			array_push($friend, [$row['friend']=>$row['distance']]);
		}

		return $friends;
	}

	public function get($friend)
	{
		$check = $this->db->query("SELECT * FROM distance_cache WHERE friend = '$friend' AND user = '".$this->user_id."' OR user = '$friend' AND friend = '".$this->user_id."'");
		if ($check->num_rows > 0) {
			return $check->fetch_assoc()['distance'];
		}
		else{
			return false;
		}
	}
}
?>