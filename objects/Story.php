<?php

/**
 * Story class
 */
class Story
{
	
	function __construct($id)
	{
		global $db;
		$this->db = $db;
		$this->id = $id;
		$this->data = $db->query("SELECT * FROM updates WHERE id = '$id' ")->fetch_assoc();
		$user = new User($this->data['user']);
		$this->user = $user->data;
	}

	public function getComments(){
		$data = [];
		$read = $this->db->query("SELECT * FROM comments WHERE story = '{$this->id}' AND parent = '0' ORDER BY id DESC ");
		while ($row = $read->fetch_assoc()) {
			$comment = new Comment($row['id']);
			

			//replies
			$replies = [];
			$s = $this->db->query("SELECT * FROM comments WHERE story = '{$this->id}' AND parent = '{$row['id']}' ORDER BY id DESC");
			while ($rrow = $s->fetch_assoc()) {
				$u = new User($rrow['user']);
				$rrow['user'] = $u->data;
				$rrow['ago'] = time_ago($rrow['time']);
				array_push($replies, $rrow);
			}
			$comment->data['replies'] = $replies;

			array_push($data, $comment);
		}

		return $data;
	}

	public function hasLiked($user){
		$read = $this->db->query("SELECT * FROM likes WHERE user = '$user' AND type = 'story' AND post = '".$this->id."' ");
		return $read->num_rows > 0;
	}

	public function getLikes(){
		$read = $this->db->query("SELECT * FROM likes WHERE type = 'story' AND post = '".$this->id."' ");
		return $read->num_rows;
	}
}
?>