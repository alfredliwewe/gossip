<?php

/**
 * User class
 */
class Comment
{
	
	function __construct($id)
	{
		global $db;
		$this->db = $db;
		$this->id = $id;
		$this->data = $db->query("SELECT * FROM comments WHERE id = '$id' ")->fetch_assoc();
		$user = new User($this->data['user']);
		$this->user = $user->data;
		$this->data['ago'] = time_ago($this->data['time']);
		$this->data['likes']  = (int)$db->query("SELECT COUNT(id) AS count_all FROM likes WHERE post = '$id' AND type = 'comment' ")->fetch_assoc()['count_all'];
	}

	public function hasLiked($user){
		$read = $this->db->query("SELECT * FROM likes WHERE user = '$user' AND type = 'comment' AND post = '".$this->id."' ");
		return $read->num_rows > 0;
	}
}
?>