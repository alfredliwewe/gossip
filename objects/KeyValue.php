<?php

/**
 * 
 */
class KeyValue
{
	const STORY_INDEX = "story_index";

	function __construct($user_id)
	{
		global $db;
		$this->db = $db;
		$this->user_id = $user_id;
	}

	public function get($type)
	{
		$check = $this->db->query("SELECT * FROM progress WHERE type = '$type' AND user = '".$this->user_id."' ");
		if ($check->num_rows > 0) {
			return $check->fetch_assoc()['position'];
		}
		else{
			return false;
		}
	}

	public function set($type, $postion)
	{
		$check = $this->db->query("SELECT * FROM progress WHERE type = '$type' AND user = '".$this->user_id."' ");
		if ($check->num_rows > 0) {
			$id = $check->fetch_assoc()['id'];
			$this->db->query("UPDATE progress SET position = '$position' WHERE id = '$id' ");
		}
		else{
			$this->db->query("INSERT INTO `progress`(`id`, `user`, `type`, `position`) VALUES (NULL, '".$this->user_id."', '$type', '$position')");
		}
	}
}
?>