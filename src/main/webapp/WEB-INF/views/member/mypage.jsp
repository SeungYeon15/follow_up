<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="/webjars/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="${root}/css/mypage.css">

<script type="text/javascript">
	function updateFile() {
		let url = "/member/updateFile";
		url += "?fname=${dto.userFile}";
		location.href = url;
	}
</script>


</head>
<body>

	<div class="Topbar">
		<nav class="navbar input-box">
			<div class="container-fluid">
				<form class="d-flex">
					<input class="form-control me-2 size" type="search"
						placeholder="검색" aria-label="Search">
					<button class="btn btn-outline-success" type="submit " style="margin-left:20px">Search</button>
				</form>
			</div>
		</nav>


		<div class="col-sm-3" style="margin-top:300px; margin-right:1000px;">
  <h4><i class="bi bi-people-fill"></i> 나의 정보</h4>
  <img class="img-rounded" src="/member/storage/${dto.userFile}" style="width:280px">
  <p><a href = "javascript:updateFile()">사진수정</a></p>
  <p>ID:${dto.userEmail}, 성명:${dto.userName}</p>
  </div>
	</div>

	<div class="Midbar">


		<div class="third-section">
			<p class="third-1">여기는 볼게 없다.</p>

			<p class="third-2">
				<svg width="193" height="89" fill="none"
					xmlns="http://www.w3.org/2000/svg">
					<g filter="url(#media_discs_svg__filter0_d_7226_59487)"
						transform="rotate(15 152.192 46)">
					<circle cx="152.192" cy="46" r="32" fill="#fff"></circle>
					<circle cx="152.192" cy="46" r="31.5" stroke="#EBECF0"></circle></g>
					<path
						d="M163.46 37.998l-12.449-1.453a1.583 1.583 0 00-1.732 1.163l-2.953 11.02a4.767 4.767 0 00-2.219-.734c-2.232-.156-4.134 1.194-4.251 3.046-.117 1.852 1.581 3.47 3.813 3.626 1.999.14 3.731-.93 4.144-2.47l2.953-11.02 11.004 1.274-2.011 7.506a4.766 4.766 0 00-2.22-.734c-2.232-.157-4.133 1.194-4.25 3.046-.117 1.852 1.581 3.47 3.813 3.626 1.999.14 3.731-.93 4.144-2.47l3.598-13.428a1.599 1.599 0 00-1.384-1.998z"
						fill="#67A871"></path>
					<g filter="url(#media_discs_svg__filter1_d_7226_59487)">
					<circle cx="96.191" cy="38" r="32" fill="#fff"></circle>
					<circle cx="96.191" cy="38" r="31.5" stroke="#EBECF0"></circle></g>
					<path fill-rule="evenodd" clip-rule="evenodd"
						d="M89.73 28.308h12.923a3.231 3.231 0 013.231 3.23v12.924a3.231 3.231 0 01-3.231 3.23H89.73a3.23 3.23 0 01-3.231-3.23V31.538a3.23 3.23 0 013.23-3.23zm13.384 9.771v-6.54a.461.461 0 00-.461-.462H89.73a.462.462 0 00-.462.461v12.924c0 .254.207.461.462.461h.079l9.422-9.422a.923.923 0 011.305 0l2.578 2.578zm-12.461-3.31a2.308 2.308 0 104.615 0 2.308 2.308 0 00-4.615 0z"
						fill="#E3AB6C"></path>
					<g filter="url(#media_discs_svg__filter2_d_7226_59487)"
						transform="rotate(-15 40.192 46)">
					<circle cx="40.192" cy="46" r="32" fill="#fff"></circle>
					<circle cx="40.192" cy="46" r="31.5" stroke="#EBECF0"></circle></g>
					<path
						d="M44.186 43.073l3.907-4.746a.923.923 0 011.604.348l2.389 8.916a.923.923 0 01-1.216 1.103l-5.756-2.156.73 2.726a2.77 2.77 0 01-1.958 3.391l-9.808 2.628a2.77 2.77 0 01-3.391-1.958l-2.39-8.916a2.77 2.77 0 011.959-3.392l9.808-2.628a2.77 2.77 0 013.391 1.958l.73 2.726z"
						fill="#909CF2"></path>
					<defs>
					<filter id="media_discs_svg__filter0_d_7226_59487" x="112.184"
						y="7.992" width="80.017" height="80.016"
						filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
					<feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
					<feColorMatrix in="SourceAlpha"
						values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
						result="hardAlpha"></feColorMatrix>
					<feOffset dy="2"></feOffset>
					<feGaussianBlur stdDeviation="4"></feGaussianBlur>
					<feColorMatrix
						values="0 0 0 0 0.0980392 0 0 0 0 0.105882 0 0 0 0 0.14902 0 0 0 0.06 0"></feColorMatrix>
					<feBlend in2="BackgroundImageFix"
						result="effect1_dropShadow_7226_59487"></feBlend>
					<feBlend in="SourceGraphic" in2="effect1_dropShadow_7226_59487"
						result="shape"></feBlend></filter>
					<filter id="media_discs_svg__filter1_d_7226_59487" x="56.191" y="0"
						width="80" height="80" filterUnits="userSpaceOnUse"
						color-interpolation-filters="sRGB">
					<feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
					<feColorMatrix in="SourceAlpha"
						values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
						result="hardAlpha"></feColorMatrix>
					<feOffset dy="2"></feOffset>
					<feGaussianBlur stdDeviation="4"></feGaussianBlur>
					<feColorMatrix
						values="0 0 0 0 0.0980392 0 0 0 0 0.105882 0 0 0 0 0.14902 0 0 0 0.06 0"></feColorMatrix>
					<feBlend in2="BackgroundImageFix"
						result="effect1_dropShadow_7226_59487"></feBlend>
					<feBlend in="SourceGraphic" in2="effect1_dropShadow_7226_59487"
						result="shape"></feBlend></filter>
					<filter id="media_discs_svg__filter2_d_7226_59487" x="0.184"
						y="7.992" width="80.017" height="80.016"
						filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
					<feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
					<feColorMatrix in="SourceAlpha"
						values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
						result="hardAlpha"></feColorMatrix>
					<feOffset dy="2"></feOffset>
					<feGaussianBlur stdDeviation="4"></feGaussianBlur>
					<feColorMatrix
						values="0 0 0 0 0.0980392 0 0 0 0 0.105882 0 0 0 0 0.14902 0 0 0 0.06 0"></feColorMatrix>
					<feBlend in2="BackgroundImageFix"
						result="effect1_dropShadow_7226_59487"></feBlend>
					<feBlend in="SourceGraphic" in2="effect1_dropShadow_7226_59487"
						result="shape"></feBlend></filter></defs></svg>
			</p>

			<p class="third-3">미디어를 업로드 하고 시작해보세요!</p>

			<p class="third-4">
				<InputFileUpload />
			</p>
		</div>
	</div>

	<div class="Footbar">
		<div class="h-line"></div>

		<span class="Toplogo Footbar-first">Follow up</span>
		<div class="Footbar-second">
			<span class="Footbar-second-text">우리의 관대한 커뮤니티를 통해 공유되는 4.6
				백만개의 이미지와 비디오를 살펴보세요.</span>
		</div>
		<div class="Footbar-third">
			<i class="fa-brands fa-instagram margin-x"></i> <i
				class="fa-brands fa-facebook margin-x"></i> <i
				class="fa-brands fa-twitter margin-x"></i> <i
				class="fa-brands fa-youtube margin-x"></i>
		</div>


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
				<div class="word-3">Pixabay 소개</div>
				<div class="word-3">자주묻는질문</div>
				<div class="word-3">라이선스 요약</div>
				<div class="word-3">서비스 약관</div>
				<div class="word-3">개인정보 보호 정책</div>
				<div class="word-3">쿠키정책</div>
				<div class="word-3">API</div>
			</div>
		</div>

		<div class="Footbar-five">
			<span class="last-bar">This site is protected by reCAPTCHA and
				the Google Privacy Policy and Terms of Service apply.</span>
		</div>

	</div>







</body>
</html>