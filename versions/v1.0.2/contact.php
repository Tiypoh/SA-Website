<?php
// if (isset($_POST['submit'])) {
	$name = $_POST["name"];
	$email = $_POST['email'];
	$vehicle = $_POST['vehicle'];
	$message = $_POST['message'];
	
	$to = "kylesebring@sebringautomotive.shop";
	$from = "kylesebring@sebringautomotive.shop";
	
	if(empty($email)) {
		header('Location: contact.html');
		exit;
	}

	$subject = "Contact Form entry from $name";
	$body = "Hello, my name is $name,\n".
		"my email address is $email,\n".
		"my car is a $vehicle,\n".
		"and it needs:\n".
		"$message";

	mail($to, $subject, $body, "From: $from");
	// $sent = mail($to, $subject, $body, "From: $from");
	// if ($sent) {
		// echo "Your message has been sent successfully!";
	// } else {
		// echo "There was an error sending your message. Please try again.";
	// }
// }
?>
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
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="thumbnail" content="pics/frontlogobg.webp">
	<meta name="geo.position" content="32.2735; -110.98621">
	<meta name="geo.placename" content="Tucson, AZ">
	<meta name="geo.region" content="US-AZ">
	<meta name="description" content="Schedule an appointment today! Find all our contact info here, shoot us an email about that vibration youve got on the highway, or just give us a call to chat!">
	<meta name=keywords content="Tucson, Mechanic, Shop, Garage, Repair, Auto, Automotive, Performance">
	<meta name=author content="DESAD Tech Group - Kyle Sebring">
	<title>Sebring Automotive - Contact</title>
	<link type="image/png" href="pics/minilogo.webp" rel="icon">
	<link rel="canonical" href="https://www.sebringautomotive.shop/contact">
	<link rel="stylesheet" href="css/fonts.css">
	<link rel="stylesheet" href="css/website.css">
	<link rel="stylesheet" href="css/contact.css">
	<script src="js/map.js"></script>
</head>
<body>
	<div class="spanbg">
		<img src="pics/shop.webp" alt="Inside of Sebring Automotive">
	</div>
	<header>
		<img src="pics/frontlogo.webp" alt="Logo AW11 Front">
		<h1>Sebring Automotive</h1>
		<nav>
			<a href="home">Home</a>
			<a href="services">Services</a>
			<a href="projects">Our Projects</a>
			<a href="contact">Find Us</a>
		</nav>
	</header>
	<main>
		<section class="span">
			<span>Contact</span>
		</section>
		<section class="autoformat">
			<div id="map">
				<div id="map">
				</div>
				<script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_ULIRZXBSjVjZ6HUTrhNG0qaL59DqYrw&loading=async&callback=initMap"></script>
			</div>
			<div style="background-color: #ea3232b0;">
				<h2>Reach Out</h2>
				<br>
				<p>CALL US at (520) 222-8002<br><br>EMAIL US at kylesebring@sebringautomotive.shop<br><br>VISIT US at 861 W. Thurber St., Tucson AZ</p>
			</div>
			<div style="background-color: #ea3232;">
				<h2>Get in touch</h2>
				<br><br>
				<p>Success! Your message has been sent!</p>
			</div>
		</section>
	</main>
</body>
</html>
