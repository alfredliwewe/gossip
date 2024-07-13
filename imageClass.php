<?php
/**
* This file contains all necessary methods of image manipulation
*/
class rodzImage
{
	public function __construct($file)
	{
		$this->file = $file;
		$chars = explode(".", $file);
		$this->ext = strtolower($chars[count($chars)-1]);
		$this->mime = mime_content_type($file);
	}

	public function getSize()
	{
		if (file_exists($this->file)) {
			switch ($this->mime) {
				case 'image/jpeg':
					$im = imagecreatefromjpeg($this->file);
					break;
				
				case 'image/png':
					$im = imagecreatefrompng($this->file);
					break;

				case 'image/webp':
					$im = imagecreatefromwebp($this->file);
					break;

				case 'image/webp':
					$im = imagecreatefromgif($this->file);
					break;			
				default:
					# code...
					break;
			}
			$size_x = imagesx($im);
			$size_y = imagesy($im);

			//
			return [$size_x, $size_y];
		}
		else{
			return [0,0];
		}
	}

	function cropImage($output)
	{
		//switching img create function
		switch ($this->mime) {
			case 'image/jpeg':
				$im = imagecreatefromjpeg($this->file);
				break;
			
			case 'image/png':
				$im = imagecreatefrompng($this->file);
				break;

			case 'image/webp':
				$im = imagecreatefromwebp($this->file);
				break;

			case 'image/webp':
				$im = imagecreatefromgif($this->file);
				break;			
			default:
				# code...
				break;
		}
		$size_x = imagesx($im);
		$size_y = imagesy($im);
		$size = min($size_x, $size_y);
		//make cropping to take the center of the image

		if ($size_x > $size) {
			$dif = $size_x - $size;
			$ini_x = ceil(($dif/2));
		}
		else{
			$ini_x = 0;
		}

		if ($size_y > $size) {
			$dif = $size_y - $size;
			$ini_y = ceil(($dif/2));
		}
		else{
			$ini_y = 0;
		}
		$im2 = imagecrop($im, ['x' => $ini_x, 'y' => $ini_y, 'width' => $size, 'height' => $size]);
		if ($im2 !== FALSE) {
		    //$myImage = imagepng($im2, $filename);

		    //trying resampling the image
		    $percent = 0.1;

			// Get new dimensions
			$new_width = 200;
			$new_height = 200;

			// Resample
			$image_p = imagecreatetruecolor($new_width, $new_height);
			$image = $im2;
			imagecopyresampled($image_p, $image, 0, 0, 0, 0, $new_width, $new_height, $size, $size);
			
			imagepng($image_p, $output, 8);
			
		    imagedestroy($im2);
		}
		imagedestroy($im);
		//else deny the process
	}

	function resample($filename)
	{
		# reduces quality...
		$percent = 0.1;

		switch ($this->mime) {
			case 'image/jpeg':
				$im = imagecreatefromjpeg($this->file);
				break;
			
			case 'image/png':
				$im = imagecreatefrompng($this->file);
				break;

			case 'image/webp':
				$im = imagecreatefromwebp($this->file);
				break;

			case 'image/webp':
				$im = imagecreatefromgif($this->file);
				break;			
			default:
				# code...
				break;
		}


		// Get new dimensions
		list($width, $height) = getimagesize($this->file);
		$new_width = $width * $percent;
		$new_height = $height * $percent;

		// Resample
		$image_p = imagecreatetruecolor($new_width, $new_height);
		//$image = imagecreatefromjpeg($filename);
		imagecopyresampled($image_p, $im, 0, 0, 0, 0, $new_width, $new_height, $width, $height);

		// Output
		imagepng($image_p, $filename, 8);
	}


	function resampleProfile($filename, $id, $timeStamp, $mysqli)
	{
		# reduces quality...
		$percent = 0.3;

		header('Content-Type: image/jpeg');

		if (file_exists($filename)) {
			// Get new dimensions
			list($width, $height) = getimagesize($filename);
			$new_width = $width * $percent;
			$new_height = $height * $percent;

			// Resample
			$image_p = imagecreatetruecolor($new_width, $new_height);
			$image = imagecreatefromjpeg($filename);
			imagecopyresampled($image_p, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);

			// Output
			$uni = time();
			$var = rand(1000000, 19961013);
			$first = substr($filename, 0, 6);
			$second = substr($filename, 6);
			$final_name = $first.$uni."_".$var."_".$second;
			$sql = $mysqli->query("UPDATE photo SET resampled = '$final_name' WHERE time_me = '$timeStamp' ");
			imagejpeg($image_p, $final_name, 100);
		}
		else{
			return;
		}
	}

	function rgb($img, $x, $y)
	{
		$rgb = imagecolorat($img, $x, $y);
		$r = ($rgb >> 16) & 0xFF;
		$g = ($rgb >> 8) & 0xFF;
		$b = $rgb & 0xFF;
		return [$r, $g, $b];
	}

	public function getAvgColor()
	{
		$img = imagecreatefromjpeg("art.jpg");
		$x = imagesx($img);
		$y = imagesy($img);

		$r = [];
		$g = [];
		$b = [];


		for ($i=0; $i < $x; $i++) { 
			for ($j=0; $j < $y; $j++) { 
				$point = $this->rgb($img, $i, $j);

				array_push($r, $point[0]);
				array_push($g, $point[1]);
				array_push($b, $point[2]);
			}
		}

		return [(int)(array_sum($r)/count($r)), (int)(array_sum($g)/count($g)), (int)(array_sum($b)/count($b))];
	}

	public function minimizeImage()
	{
		if ( ($size = filesize($this->file)) !== FALSE){
			$size_kb = $size / 1024;

			if ($size_kb > 500) {
				$percent = 500 / $size_kb;

				list($width, $height) = getimagesize($this->file);
				$new_width = $width * $percent;
				$new_height = $height * $percent;

				// Resample
				$image_p = imagecreatetruecolor($new_width, $new_height);
				$image = getMeImage($this->file);
				imagecopyresampled($image_p, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);

				switch ($this->mime) {
					case 'image/jpeg':
						//$im = imagecreatefromjpeg($this->file);
						imagejpeg($image_p,$this->file, 100);
						break;
					
					case 'image/png':
						imagepng($image_p,$this->file, 100);
						break;

					case 'image/webp':
						//$im = imagecreatefromwebp($this->file);
						imagewebp($image_p,$this->file, 100);
						break;

					case 'image/gif':
						//$im = imagecreatefromgif($this->file);
						imagegif($image_p,$this->file, 100);
						break;			
					default:
						# code...
						break;
				}
				imagedestroy($image);
				imagedestroy($image_p);
			}
		}
	}
}


function getMeImage($filename){
	$chars = explode(".", $filename);
	$ext = strtolower($chars[count($chars)-1]);
	$mime = mime_content_type($filename);


	$im = null;

		//switching img create function
		switch ($mime) {
			case 'image/jpeg':
				$im = imagecreatefromjpeg($filename);
				break;

			case 'image/png':
				$im = imagecreatefrompng($filename);
				break;

			case 'image/webp':
				$im = imagecreatefromwebp($filename);
				break;

			case 'image/gif':
				$im = imagecreatefromgif($filename);
				break;			
			default:
				# code...
				break;
		}
	return $im;
}


function resizeImageByPercentage($sourceImage, $destImage, $percentage) {
    list($sourceWidth, $sourceHeight, $sourceType) = getimagesize($sourceImage);

    switch ($sourceType) {
        case IMAGETYPE_JPEG:
            $sourceResource = imagecreatefromjpeg($sourceImage);
            break;
        case IMAGETYPE_PNG:
            $sourceResource = imagecreatefrompng($sourceImage);
            break;
        case IMAGETYPE_GIF:
            $sourceResource = imagecreatefromgif($sourceImage);
            break;
        default:
            return false; // Unsupported image type
    }

    $targetWidth = $sourceWidth * $percentage;
    $targetHeight = $sourceHeight * $percentage;

    $destResource = imagecreatetruecolor($targetWidth, $targetHeight);

    imagecopyresampled(
        $destResource,
        $sourceResource,
        0,
        0,
        0,
        0,
        $targetWidth,
        $targetHeight,
        $sourceWidth,
        $sourceHeight
    );

    switch ($sourceType) {
        case IMAGETYPE_JPEG:
            imagejpeg($destResource, $destImage);
            break;
        case IMAGETYPE_PNG:
            imagepng($destResource, $destImage);
            break;
        case IMAGETYPE_GIF:
            imagegif($destResource, $destImage);
            break;
    }

    imagedestroy($sourceResource);
    imagedestroy($destResource);

    return true;
}

?>