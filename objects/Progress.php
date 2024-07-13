<?php

/**
 * Progress
 */
class Progress
{
	
	function __construct($user)
	{
		global $db;
		$this->db = $db;
		$this->user = $user;
	}

	public function get($type)
	{
		$read = $this->db->query("SELECT * FROM progress WHERE type = '$type' AND user = '".$this->user."' ");
		if ($read->num_rows == 1) {
			return (int)$read->fetch_assoc()['position'];
		}
		else{
			return 0;
		}
	}

	public function set($type,$postion)
	{
		$read = $this->db->query("SELECT * FROM progress WHERE type = '$type' AND user = '".$this->user."' ");
		if ($read->num_rows == 1) {
			$id = $read->fetch_assoc()['id'];
			$this->db->query("UPDATE progress SET position = '$position' WHERE id = '$id' ");
		}
		else{
			$this->db->query("INSERT INTO `progress`(`id`, `user`, `type`, `position`) VALUES (NULL, '".$this->user."', '$type', '$position')");
		}
	}
}