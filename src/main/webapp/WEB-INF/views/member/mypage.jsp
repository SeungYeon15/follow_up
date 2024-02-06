<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>

<title>Bootstrap Example</title>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<link rel="stylesheet" href="${root}/css/mypage.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/all.min.css">


<script type="text/javascript">
	function updateFile() {
		let url = "/member/updateFile";
		url += "?fname=${dto.userFile}";
		location.href = url;
	}
</script>
<style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
            margin: 0;
        }


      

      
        .img-rounded {
            border-radius: 50%;
            object-fit: cover;
            width: 280px;
            height: 280px;
            margin-top: 20px;
        }

        .font1 {
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            margin: 5px 0;
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .user-info {
            font-family: 'Roboto', sans-serif;
            font-size: 18px;
            margin-bottom: 15px;
        }

        .Midbar {
            /* 추가적인 디자인이 필요한 부분은 여기에 추가 */
        }

        .Footbar {
            /* 추가적인 디자인이 필요한 부분은 여기에 추가 */
        }
        a {
        text-decoration: none; /* 밑줄 제거 */
        color: #007bff; /* 링크 색상 변경 */
    }
    </style>

</head>
<body>

	<div class="Topbar">
		<nav class="navbar input-box">
			<div class="container-fluid">
				<form class="d-flex" style="margin-top:30px;">
					<input class="form-control me-2 size" type="search"
						placeholder="검색" aria-label="Search">
					<button class="btn btn-outline-success" type="submit "
						style="margin-left: 20px">Search</button>
				</form>
			</div>
		</nav>


	<div style="text-align: center; padding: 30px; margin-top:900px;background-color: #f8f9fa; margin-right;px;">
    <h4 style="font-size: 28px; margin-bottom: 20px; color: #007bff;">
        <i class="bi bi-people-fill"></i> 나의 정보
    </h4>
    <img class="img-rounded" src="/member/storage/${dto.userFile}" alt="프로필 이미지" style="width: 280px; border-radius: 50%; margin-bottom: 20px;">

    <p style="margin-top: 20px; font-size: 18px;">
        <a href="javascript:updateFile()" style="color: #007bff; text-decoration: none; font-weight: bold;">프로필 사진 수정</a>
    </p>
    <p style="font-size: 18px; color: #495057; margin-bottom: 5px;">ID: ${dto.userEmail}</p>
    <p style="font-size: 18px; color: #495057;">성명: ${dto.userName}</p>
    <li><a href="/member/update/${userId}">회원정보수정</a></li>
    
   
    
</div>
			
	
	
	</div>

	<div class="Midbar">


		<div class="Footbar">
			<div class="h-line"></div>
			<span class="Toplogo Footbar-first">Follow up</span>
			 <div style="font-size: 24px; color: #c4302b; margin-top: 20px;">
    </div>
			<div class="Footbar-second"style="margin-right:100px;">
				<span class="Footbar-second-text">우리의 관대한 커뮤니티를 통해 공유되는 4.6
					백만개의 이미지와 비디오를 살펴보세요.</span>
			</div>
		<!-- 	<div class="Footbar-third">
				<i class="fa-brands fa-instagram" style="margin-top:100px;"></i> <i
					class="fa-brands fa-facebook"></i> <i
					class="fa-brands fa-twitter"></i> <i
					class="fa-brands fa-youtube"></i>
			</div> -->


			<div class="Footbar-four">
				<div class="container-1">
					<div class="word-4">발견하다</div>
					<div class="word-1">편집자 선정</div>
					<div class="word-1">선별된 컬렉션</div>
					<div class="word-1">라디오</div>
					<div class="word-1">인기 이미지</div>
					<div class="word-1">인기 동영상</div>
					<div class="word-1">인기 음악</div>
					<div class="word-1">인기 검색어</div>
				</div>

				<div class="container-2">
					<div class="word-4">커뮤니티</div>
					<div class="word-2">블로그</div>
					<div class="word-2">포럼</div>
					<div class="word-2">크리에이터</div>
					<div class="word-2">카메라</div>

				</div>



				<div class="container-3">
					<div class="word-4">소개</div>
					<div class="word-3"> 질문</div>
					<div class="word-3">자주묻는질문</div>
					<div class="word-3">라이선스 요약</div>
					<div class="word-3">서비스 약관</div>
					<div class="word-3">개인정보 보호 정책</div>
					<div class="word-3">쿠키정책</div>
					<div class="word-3">API</div>
				</div>
			</div>

			<div class="Footbar-five">
				<span class="last-bar">This site is protected by reCAPTCHA
					and the Google Privacy Policy and Terms of Service apply.</span>
			</div>

		</div>
</body>
</html>