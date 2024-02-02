<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Warner Music Group Homepage</title>
<link rel="stylesheet" href="/css/company.css">

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBy_ipaPQCc5JbV1j1f5xIgOBEZ-r02tZw&callback=initMap"
	async defer></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet">

</head>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var scrollArrow = document.querySelector('.scroll-arrow');

		scrollArrow.addEventListener('click',
				function(e) {
					e.preventDefault();
					var nextSection = document.querySelector(this
							.getAttribute('href'));
					nextSection.scrollIntoView({
						behavior : 'smooth'
					});
				});
	});
</script>

<body>

	<div class="wmg-section">
		<img src="../images/logo.png" alt="Concert crowd"> <a
			href="#next-section" class="scroll-arrow">↓</a>
	</div>

	<div id="next-section" class="info-section">
		<div class="info-content">
			<h2 mt-3>
				About <a href="https://www.wmg.com" class="company_link">Warner
					Music Group</a>
			</h2>
			<p>WMG(Warner Music Group) is one of the world's leading major
				music companies. It is a comprehensive entertainment corporation
				that provides a wide range of services including record labels,
				music publishing, and various associated services. The company
				operates in the following key areas.</p>
		</div>
	</div>

	<div class="location-section" mb-3>
		<h2>Location</h2>
		<p>1633 Broadway, New York, NY 10019 United States</p>
		<div id="map"></div>
	</div>
	<footer class="footer">
		<ul class="social-icons">
			<li><a href="https://www.facebook.com/warnermusicgroup"
				class="fab fa-facebook-f" target="_blank"></a></li>
			<li><a href="https://twitter.com/warnermusic" target="_blank"
				class="fab fa-twitter"></a></li>
			<li><a href="https://www.instagram.com/warnermusic/"
				target="_blank" class="fab fa-instagram"></a></li>
			<li><a
				href="https://www.linkedin.com/company/warner-music-group"
				target="_blank" class="fab fa-linkedin-in"></a></li>
			<li><a href="https://www.tiktok.com/@warnermusic"
				target="_blank" class="fab fa-tiktok"></a></li>
		</ul>
	</footer>
</body>
<script>
	function initMap() {
		var broadwayNY = {
			lat : 40.7612,
			lng : -73.9822
		}; // New York 주소의 위도와 경도
		var mapOptions = {
			center : broadwayNY, // 지도의 중심을 New York 주소로 설정
			zoom : 15, // 줌 레벨 설정
		};
		var map = new google.maps.Map(document.getElementById('map'),
				mapOptions);

		// 지도에 마커 추가
		var marker = new google.maps.Marker({
			position : broadwayNY,
			map : map,
			title : '1633 Broadway, New York, NY'
		});
	}
</script>
</html>