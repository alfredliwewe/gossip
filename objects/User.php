<?php

/**
 * User class
 */
class User
{
	
	function __construct($id, $owner=null)
	{
		global $db;
		$this->db = $db;
		if (is_numeric($id)) {
			$this->id = $id;
			$this->data = $db->query("SELECT * FROM users WHERE id = '$id' ")->fetch_assoc();
			//$this->data['data'] = json_decode($this->data['data'], true);

			/*$in = $db->query("SELECT * FROM photos WHERE user = '$id' AND type = 'profile' ORDER BY id DESC LIMIT 0,1 ");
			if ($in->num_rows > 0) {
				$inn = $in->fetch_assoc();
				$this->data['photo'] = $inn['file'];
				$this->data['resampled'] = $inn['resampled'];
			}
			else{
				$this->data['photo'] = "default_avatar.png";
				$this->data['resampled'] = "default_avatar.png";
			}
			$this->data['photo'] = isset($this->data['data']['photo']) ? $this->data['data']['photo']: "default_avatar.png";
			$this->data['resampled'] = isset($this->data['data']['resampled']) ? $this->data['data']['resampled'] : "default_avatar.png";

			$cache = [];
			if ($owner != null) {
				$read = $db->query("SELECT * FROM distance_cache WHERE user = '$id' ");
				while ($row = $read->fetch_assoc()) {
					$cache[$row['friend']] = $row['distance'];
				}
			}
			$this->data['distance_cache'] = $cache;*/
		}
		else{
			$this->id = $id['id'];
			$this->data = $id;
			$id_user = $id['id'];

			$this->data['data'] = json_decode($this->data['data'], true);
			//$this->data['photo'] = "default_avatar.png";
			//$this->data['resampled'] = "default_avatar.png";
			$this->data['photo'] = isset($this->data['data']['photo']) ? $this->data['data']['photo']: "default_avatar.png";
			$this->data['resampled'] = isset($this->data['data']['resampled']) ? $this->data['data']['resampled'] : "default_avatar.png";
		}
	}

	public function getLocation()
	{
		$read = $this->db->query("SELECT * FROM locations WHERE user = '".$this->id."' AND district != '' ORDER BY id DESC LIMIT 1");
		if ($read->num_rows > 0) {
			$data = $read->fetch_assoc();
			return [$data['latitude'], $data['longitude'], $data['district'], $data['easting'], $data['northing']];
		}
		else{
			return [-13.976854339499186, 33.757109083811606];
		}
	}

	public function getFollowers()
	{
		$data = [];
		$read = $this->db->query("SELECT * FROM following WHERE friend = '".$this->id."' ");
		while ($row = $read->fetch_assoc()) {
			array_push($data, $row['user']);
		}
		return $data;
	}

	public function getFollowing()
	{
		$data = [];
		$read = $this->db->query("SELECT * FROM following WHERE user = '".$this->id."' ");
		while ($row = $read->fetch_assoc()) {
			array_push($data, $row['friend']);
		}
		return $data;
	}

	public function getDistrict()
	{
		$district = "Lilongwe";
		$id = $this->id;

		$read = $this->db->query("SELECT * FROM locations WHERE user = '$id' AND district != '' ORDER BY id DESC LIMIT 1 ");
		if ($read->num_rows == 1) {
			$data = $read->fetch_assoc();
			$district = $data['district'];
		}

		return $district;
	}

	public function updateDistanceCache($data){
		//do nothing
	}

	public static function getAll($ids){
		global $db;
		if (count($ids) > 0) {
			$all = [];

			$read = $db->query("SELECT id,name,email,gender,dob,date_reg,status,age,last_seen,about,data FROM users WHERE id IN (".implode(",", $ids).")");
			while ($row = $read->fetch_assoc()) {
				$all[$row['id']] = new User($row);
			}

			return $all;
		}
		else{
			return [];
		}
	}

	public function setData($array){
		$id = $this->id;

		foreach ($array as $key => $value) {
			$this->data['data'][$key] = $value;
		}
		$str = json_encode($this->data['data']);
		$this->db->query("UPDATE users SET data = '$str' WHERE id = '$id' ");
	}
}
?>