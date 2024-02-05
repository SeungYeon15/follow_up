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
		<c:choose>
            <c:when test="${not empty sessionScope.userId}">
                <!-- 로그인 되었을 때 -->
                <div class="user-info">
                    <a href="/member/logout" class="logout-link">LOGOUT</a><br>
                    Hello! ${sessionScope.userName}
                </div>
           </c:when>
            <c:otherwise> 
                <!-- 로그인 되지 않았을 때 -->
                <a href="/member/login" class="login-link">LOGIN</a>
             </c:otherwise>
        </c:choose> 
		<nav class="overlay-menu">
			<ul>
				<li><a href="/music">ALBUM/VIDEO</a></li>
				<li><a href="/schedule">SCHEDULE</a></li>
				<li><a href="#">CONCERT</a></li>
				<li><a href="#">GALLERY</a></li>
				<li><a href="/company">AGENCY</a></li>
				<li><a href="/notice/list">BOARD</a></li>
				<li><a href="/board/list">COMMUNITY</a></li>
				<li><a href="/member/mypage">MYPAGE</a></li>
				

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
</body>
</html>