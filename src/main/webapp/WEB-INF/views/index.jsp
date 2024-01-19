<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>main</title>
<script src="https://unpkg.com/ionicons@7.0.0/dist/ionicons.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/css/mainStyles.css" >
<link href='https://fonts.googleapis.com/css?family=Cinzel'
	rel='stylesheet'>
<link rel="stylesheet" href="/css/menu.css">
</head>

<body>
	<input type="radio" name="item" checked="checked" id="section1" />
	<input type="radio" name="item" id="section2" />
	<input type="radio" name="item" id="section3" />
	<input type="radio" name="item" id="section4" />


	<div class="button_container" id="toggle">
		<span class="top"></span><span class="middle"></span><span
			class="bottom"></span>
	</div>
	<div class="overlay" id="overlay">
		<nav class="overlay-menu">
			<ul>
				<li><a href="/">ABOUT DUA LIPA</a></li>
				<li><a href="/board/list">NOTICE</a></li>
				<li><a href="#">ALBUM/VIDEO</a></li>
				<li><a href="#">SCHEDULE</a></li>
				<li><a href="#">GALLERY</a></li>
			</ul>
		</nav>
	</div>


	<section>
		<div class="logo">follow up</div>
		<h2>
			<div class="container-left">
				<div class="social-media">
					<ul>
						<li><a href="https://www.youtube.com/@dualipa"
							target="_blank"><ion-icon icon="logo-youtube"></ion-icon></a></li>
						<li><a href="https://www.instagram.com/dualipa/"
							target="_blank"><ion-icon name="logo-instagram"></ion-icon></a></li>
						<li><a href="https://twitter.com/DUALIPA" target="_blank"><ion-icon
									name="logo-twitter"></ion-icon></a></li>
						<li><a href="https://www.facebook.com/DuaLipa/?locale=ko_KR"
							target="_blank"><ion-icon name="logo-facebook"></ion-icon></a></li>
						<li><a href="https://www.tiktok.com/@dualipaofficial"
							target="_blank"><ion-icon icon="logo-tiktok"></ion-icon></a></li>
					</ul>
				</div>
			</div>
		</h2>
	</section>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script>
		$('#toggle').click(function() {
			$(this).toggleClass('active');
			$('#overlay').toggleClass('open');
		});
	</script>
	<script>
	
		$('.logo').click(function() {
			location.href = "/";
		});
	</script>
	<script src="script.js"></script>
</body>

</html>