<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:set var="root" value="${pageContext.request.contextPath }"/> --%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>shop</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href='https://fonts.googleapis.com/css?family=Cinzel'
	rel='stylesheet'>
<link rel="stylesheet" href="/css/menu.css">
</head>
<body>
	<div class="button_container" id="toggle">
		<span class="top"></span><span class="middle"></span><span
			class="bottom"></span>
	</div>
	<div class="overlay" id="overlay">
		<nav class="overlay-menu">
			<ul>
				<li><a href="/">ABOUT DUA LIPA</a></li>
				<li><a href="/music">ALBUM/VIDEO</a></li>
				<li><a href="/schedule">SCHEDULE</a></li>
				<li><a href="#">CONCERT</a></li>
				<li><a href="#">GALLERY</a></li>
				<li><a href="#">AGENCY</a></li>
				<li><a href="#">COMMUNITY</a></li>
				<li><a href="/board/list">NOTICE</a></li>
			</ul>
		</nav>
	</div>

	<div class="logo">follow up</div>
	<script>
		$('#toggle').click(function() {
			$(this).toggleClass('active');
			$('#overlay').toggleClass('open');
		});

		$('.logo').click(function() {
			location.href = "/";
		});
	</script>