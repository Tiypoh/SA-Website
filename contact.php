<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Google tag (gtag.js) -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-73R4GP4KRB"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'G-73R4GP4KRB');
	</script>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="thumbnail" content="pics/frontlogobg.webp">
	<meta name="geo.position" content="32.2735; -110.98621">
	<meta name="geo.placename" content="Tucson, AZ">
	<meta name="geo.region" content="US-AZ">
	<meta name="description" content="Schedule an appointment today! Find all our contact info here, shoot us an email about that vibration youve got on the highway, or just give us a call to chat!">
	<meta name=keywords content="Tucson, Mechanic, Shop, Garage, Repair, Auto, Automotive, Performance">
	<meta name=author content="DESAD Tech Group - Kyle Sebring">
	<title>Sebring Automotive - Contact</title>
	<link rel="canonical" href="https://sebringautomotive.shop/contact">
	<link href="pics/icon.webp" rel="icon" type="image/webp">
	<link rel="preload" href="css/fonts/LuloClean.ttf" as="font" type="font/ttf" crossorigin>
	<link rel="preload" href="css/fonts/Avenir/Avenir.ttf" as="font" type="font/ttf" crossorigin>
	<link rel="preload" href="css/fonts/Avenir/AvenirLight.ttf" as="font" type="font/ttf" crossorigin>
	<link rel="dns-prefetch" href="//www.googletagmanager.com">
	<link rel="dns-prefetch" href="//maps.googleapis.com">
	<link rel="stylesheet" href="css/website.css">
	<link rel="stylesheet" href="css/var.css">
	<link rel="stylesheet" href="css/fonts.css">
	<link rel="stylesheet" href="css/contact.css">
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_ULIRZXBSjVjZ6HUTrhNG0qaL59DqYrw&loading=async&libraries=places&callback=initMap"></script>
	<script src="js/map.js"></script>
</head>
<body>
<!--#include virtual="/resources/header.html"-->
	<main>
		<div id="span-img">
			<picture>
				<source media="(min-height: 1441px)" type="image/webp" srcset="pics/shop.webp">
				<source media="(min-height: 1081px) and (max-height: 1440px)" type="image/webp" srcset="pics/shop1440.webp">
				<source media="(min-height: 481px) and (max-height: 1080px) and (min-width: 540px)" type="image/webp" srcset="pics/shop1080.webp">
				<source media="(min-height: 481px) and (max-height: 1080px) and (max-width: 540px)" type="image/webp" srcset="pics/shop1080mobile.webp">
				<!-- <source media="(min-height: 481px) and (max-height: 720px)" type="image/webp" srcset="pics/shop720.webp"> -->
				<source media="(max-height: 480px)" type="image/webp" srcset="pics/shop480.webp">
				<source media="(min-height: 1081px)" type="image/jpeg" srcset="pics/shop.jpg">
				<source media="(min-height: 481px) and (max-height: 1080px)" type="image/jpeg" srcset="pics/shop1080.jpg">
				<!-- <source media="(min-height: 481px) and (max-height: 720px)" type="image/jpeg" srcset="pics/shop720.jpg"> -->
				<source media="(max-height: 480px)" type="image/jpeg" srcset="pics/shop480.jpg">
				<img src="pics/shop.jpg" alt="Inside of Sebring Automotive">
			</picture>
		</div>
		<div id="span">
			<h2>Contact</h2>
		</div>
		<div class="autoformat">
			<div id="map">
			</div>
			<div id="info">
				<h3>Reach Out</h3>
				<p>CALL US at <a href="tel:520-222-8002">(520) 222-8002</a></p>
				<p>EMAIL US at <a href="mailto:kylesebring@sebringautomotive.shop">kylesebring@sebringautomotive.shop</a></p>
				<p>VISIT US at <a href="https://www.google.com/maps/dir//861+W+Thurber+Rd,+Tucson,+AZ+85705/@32.2732841,-111.0686211,12z/data=!4m8!4m7!1m0!1m5!1m1!1s0x86d673e461999505:0xb296b3c19ccf337b!2m2!1d-110.9862198!2d32.2733109?hl=en-US&entry=ttu" target="_blank">861 W. Thurber St., Tucson AZ</a></p>
			</div>
			<div id="form">
				<h3>Get in touch</h3>
<?php
require 'vendor/autoload.php';

use Google\Cloud\RecaptchaEnterprise\V1\RecaptchaEnterpriseServiceClient;
use Google\Cloud\RecaptchaEnterprise\V1\Event;
use Google\Cloud\RecaptchaEnterprise\V1\Assessment;
use Google\Cloud\RecaptchaEnterprise\V1\TokenProperties\InvalidReason;

function send_form(): void {
	if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
		header("Location: https://sebringautomotive.shop/contact");
		exit;
	} if (isset($_COOKIE['FormSubmitted'])) {
		echo "<p>This form has already been submitted. Wait 1 minute to submit again.</p>";
	} else {
		$name = $_POST['name'];
		$email = $_POST['email'];
		$vehicle = $_POST['vehicle'];
		$message = $_POST['message'];
		$remoteIp = $_SERVER['REMOTE_ADDR'];

		$headers = 'From: Website Contact Form <website@sebringautomotive.shop>' . "\r\n";
		$headers .= 'Reply-To: <$email>' . "\r\n";
		$headers .= 'Content-Type: text/html; charset=UTF-8' . "\r\n";
		$subject = "Contact Form entry from $name";
		$body = "
<!DOCTYPE html>
<html lang='en'>
<body style='margin: 0; text-align: center; color: #ffffff; background-color: #000000; font-family: avenirlight, sans-serif; overflow-x: hidden;'>
<header style='padding: 20px; background-color: #353738; margin-bottom: 40px;'>
	<a style='text-decoration: none; color: white;' href='https://sebringautomotive.shop'><img style='height: 150px; margin-top: 20px;' src='https://sebringautomotive.shop/pics/frontlogo.png'></a>
	<a style='text-decoration: none; color: white;' href='https://sebringautomotive.shop'><h2 style='margin: 0; font-size: 25pt;'>Sebring Automotive</h2></a>
</header>
<main style='align-items: center; justify-content: center; display: grid; background-color: #000000;'>
	<span style='width: 100%; font-size: 20pt; color: #ffffff; margin: auto; width: auto;'>Hello, my name is $name, </h2>
	<span style='width: 100%; font-size: 20pt; color: #ffffff; margin: auto; width: auto;'>my email address is $email, </h2>
	<span style='width: 100%; font-size: 20pt; color: #ffffff; margin: auto; width: auto;'>my IP address is <a href='https://www.iplocation.net/ip-lookup/$remoteIp'>$remoteIp</a>, </h2>
	<span style='width: 100%; font-size: 20pt; color: #ffffff; margin: auto; width: auto;'>my car is a $vehicle, </h2>
	<span style='width: 100%; font-size: 20pt; color: #ffffff; margin: auto; width: auto;'>and it needs: </h2>
	<span style='width: 100%; font-size: 20pt; color: #ffffff; margin: auto; width: auto;'>$message</h2>
</main>
<footer style='height: 100px; background-color: #252728; color: #ffffff; padding: 20px; margin-top: 40px; position: relative; display: flex; justify-content: center; align-items: center;'>
	<h3 style='font-size: 12pt; color: #999999; margin: 20px auto; display: inline-block;'>Copyright 2024 by Kyle Sebring</h3>
	<h3 style='font-size: 12pt; color: #999999; margin: 20px auto; display: inline-block;'>Sebring Automotive LLC</h3>
	<h3 style='font-size: 12pt; color: #999999; margin: 20px auto; display: inline-block;'>861 W. Thurber Rd. Tucson, AZ 85705</h3>
</footer>
</body>
</html>";
		
		// $filter = array("click here","CLICK HERE","unsubscribe","ranking","visitor"," seo ","SEO");
		// foreach ($filter as $word) {
			// if (str_contains($message, $word)) {
				// echo "<p>Your message has been detected as spam, if this was a mistake, please rewrite your message without words that may be tripping the filter, or email kylesebring@sebringautomotive.shop directly.</p>";
				// exit;
		if (empty($name) || empty($email) || empty($message)) {
			echo '<p>Please fill in all required fields.</p>';
			exit;
		} if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			echo "<p>Invalid email format</p>";
			exit;
		} elseif (mail("kylesebring@sebringautomotive.shop", $subject, $body, $headers)) {
			setcookie('FormSubmitted', 'True', time() + 60);
			echo "<p>Success! Your message has been sent successfully!</p>";
		} else {
			echo "<p>There was an error sending your message. Please try again.</p>";
		}
	}
}

$remoteIp = $_SERVER['REMOTE_ADDR'];
$secret = '6LcnYn4qAAAAAJmYAq8To3i8QxcI0-RmjFXRc7pA';
$gRecaptchaResponse = $_POST['g-recaptcha-response'];
$recaptcha = new \ReCaptcha\ReCaptcha($secret);
$resp = $recaptcha->setScoreThreshold(0.5)
                  ->verify($gRecaptchaResponse, $remoteIp);

if ($resp->isSuccess()) {
    send_form();
} else {
    $errors = $resp->getErrorCodes();
	echo "<p>Your message has been detected as spam by reCAPTCHA, if this was a mistake, please try again later, or email kylesebring@sebringautomotive.shop directly.</p>";
}
?>
			</div>
		</div>
	</main>
<!--#include virtual="/resources/footer.html"-->
</body>
</html>
