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
		<picture>
			<source media="(min-height: 721px)" type="image/webp" srcset="pics/shop.webp">
			<source media="(min-height: 481px) and (max-height: 720px)" type="image/webp" srcset="pics/shop720.webp">
			<source media="(max-height: 480px)" type="image/webp" srcset="pics/shop480.webp">
			<source media="(min-height: 721px)" type="image/jpeg" srcset="pics/shop.jpg">
			<source media="(min-height: 481px) and (max-height: 720px)" type="image/jpeg" srcset="pics/shop720.jpg">
			<source media="(max-height: 480px)" type="image/jpeg" srcset="pics/shop480.jpg">
			<img src="pics/shop.jpg" alt="Inside of Sebring Automotive">
		</picture>
	</div>
	<header>
		<a href="home"><picture>
			<source type="image/webp" srcset="pics/frontlogo.webp">
			<source type="image/jpeg" srcset="pics/frontlogo.jpg">
			<img src="pics/frontlogo.jpg" alt="Logo AW11 Front">
		</picture></a>
		<a href="home"><h1>Sebring Automotive</h1></a>
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
				<?php
				// if (isset($_POST['submit'])) {
					if (isset($_COOKIE['FormSubmitted'])) {
						echo "<p>This form has already been submitted. Please wait for a response.</p>";
					} else {
						$name = $_POST["name"];
						$email = $_POST['email'];
						$vehicle = $_POST['vehicle'];
						$message = $_POST['message'];
 
						$to = "kylesebring@sebringautomotive.shop";
						$from = "website@sebringautomotive.shop";

						$subject = "Contact Form entry from $name";
						$body = "Hello, my name is $name,\n".
							"my email address is $email,\n".
							"my car is a $vehicle,\n".
							"and it needs:\n".
							"$message";
						
						setcookie('FormSubmitted', '1');

						if (mail($to, $subject, $body, "From: $from")) {
							echo "<p>Success! Your message has been sent successfully!</p>";
						} else {
							echo "<p>There was an error sending your message. Please try again.</p>";
						}
					}
				// }
				?>
			</div>
		</section>
	</main>
</body>
</html>
