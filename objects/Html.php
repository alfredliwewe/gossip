<?php

/**
 * Html class
 */
class Html
{
	
	public static function addCSS($html)
	{
		return Html::curl_post("https://dating-mw.com/api/", [
			'convertToHtml'=>$html
		], []);
	}

	public static function curl_post($url, array $post = NULL, array $options = array()) { 
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

	public static function saveNotification($title, $content, $image, $channel){
		return Html::curl_post("https://dating-mw.com/notifications/", [
			'title'=> $title,
			'content' => $content,
			'image' => $image,
			'channel' => $channel
		], []);
	}
}

?>