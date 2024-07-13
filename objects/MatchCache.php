<?php

/**
 * 
 */
class MatchCache
{
	
	function __construct($user_id)
	{
		global $db;
		$this->db = $db;
		$this->user_id = $user_id;
	}

	public function save($friend)
	{
		$check = $this->db->query("SELECT * FROM can_match WHERE friend = '$friend' AND user = '".$this->user_id."' ");
		if ($check->num_rows == 0) {
			$this->db->query("INSERT INTO `can_match`(`id`, `user`, `friend`) VALUES (NULL, '".$this->user_id."', '$friend')");
		}
	}

	public function getMatches()
	{
		$friends = [];
		$read = $this->db->query("SELECT * FROM can_match WHERE user = '".$this->user_id."' ");
		while ($row = $read->fetch_assoc()) {
			array_push($friends, $row['friend']);
		}

		return $friends;
	}
}
?>