<?php
require 'vendor/autoload.php';
use Mailgun\Mailgun;

$mg = Mailgun::create("604ac188364b3de9e03c77bc2485aff9-31eedc68-382da9cc", "https://api.mailgun.net/v3/sandbox97af4605f34b411ea896d2e294058566.mailgun.org");
$domain = "sandbox97af4605f34b411ea896d2e294058566.mailgun.org";

error_reporting(-1);
ini_set('display_errors', 'On');
set_error_handler("var_dump");

$name = $_POST["name"];
$visitor_email = $_POST['email'];
$message = $_POST['message'];

if(empty($visitor_email)) {
	header('Location: contact.html');
	exit;
}

$email_subject = "$name has submitted a contact form!";
$email_body = "Name: $name\n".
	"Email Address: $visitor_email\n\n".
	"Message:\n".
	"$message";

$mg->messages()->send($domain, array(
	'from'	=> '<mailgun@sandbox97af4605f34b411ea896d2e294058566.mailgun.org>',
	'to'	=> '<elizabeth@bellasgelato.com>',
	'subject' => $email_subject,
	'text'	=> $email_body
));

?>
<html lang="en">
<head>
	<link type="image/png" href="pics/bellas mini logo.png" rel="icon">
	<link rel="stylesheet" href="website.css">
	<meta name=keywords content="Tucson Gelato">
	<meta name=author content="DESAD Tech Group">
	<title>Bella's Gelato Shoppe</title>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
	<script>
		function initMap() {
			var map = new google.maps.Map(document.getElementById("map"), {
				zoom: 16,
				center: {lat: 32.2358, lng: -110.9326},
				disableDefaultUI: true,
				mapId: '2b52c5948056ea8f'
			});
			const marker = new google.maps.Marker({
				position: {lat: 32.2358, lng: -110.9326},
				map: map,
				text: "Bellas Gelato 2648 E. Speedway",
			});
		}
		window.initMap = initMap;
	</script>
</head>
<body>
	<header>
		<img src="pics/bellas logo.png" height=100px alt="Bella's Logo" style="margin-bottom:-20px;">
		<div>
			<h1>Bella's Gelato Shoppe</h1>
			<div style="margin:10px;">
				<a href="index.html">Home</a>
				<a href="menu.html">Menu</a>
				<a href="bella.html">Bella and Friends</a>
				<a href="foodtruck.html">Food Truck</a>
				<a href="contact.html">Contact Us</a>
			</div>
		</div>
	</header>
	<main class="contact">
		<div style="grid-column: 1 / span 3;">
			<span style="background-color:#ffffff00;color:white;">Get in touch with us</span>
		</div>
		<div>
			<div id="map">
			</div>
			<script async
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKgqqzYtXftqFfT_g4XereEWnhYg8Dup8&callback=initMap">
			</script>
		</div>
		<div style="background-color: #994bc9b0;">
			<h4>Meet us</h4>
			<p>CALL US at (520) 954-2843<br><br>EMAIL US at elizabeth@bellasgelato.com<br><br>VISIT US at 2648 E. Speedway Blvd., Tucson AZ</p>
		</div>
		<div style="background-color: #994bc9;">
			<h4>Contact us</h4>
			<form action="contact.php" method="post" enctype="multipart/form-data" name="contactform">
				<label for="name">Hello, my name is</label>
				<input type="text" id="name" name="name" placeholder="your name" required>
				<label for="email">and my email address is</label>
				<input type="email" id="email" name="email" placeholder="your email" required>
				<label for="message">and I would like to ask about</label>
				<input type="text" id="message" name="message" placeholder="your question" required><br>
				<input type="submit" id="submit" value="Submit">
			</form>
		</div>
	</main>
</body>
</html>