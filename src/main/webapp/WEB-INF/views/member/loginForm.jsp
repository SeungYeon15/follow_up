<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<title>로그인 처리</title>
<meta charset="utf-8">
<script type="text/javascript">
	function change(no) {
		console.log(no);
		if (no == 1) {
			let ein = document.querySelector('#second');
			ein.type = 'name';
			ein.placeholder = 'Enter name';
		} else {
			let ein = document.querySelector('#second');
			ein.type = 'text';
			ein.placeholder = 'Enter email';
		}
	}
	function find_id()
    {
        let name = document.querySelector("#id_first").value;
        let result = document.querySelector(".id_result");
        if(name == "" )
        {
            result.innerText = "이름을 입력해주세요.";
            return;
        }
        let url = "/member/find_email/?name="+name;

        fetch(url,{
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            }})
            .then((response) => response.json())
            .then((data) =>  result.innerText = data.str);


    }
	
	function find_pw()
    {
       
        let email = document.querySelector("#id_second").value;

        let result = document.querySelector(".pw_result");
        if(email == "" )
        {
            result.innerText = "이메일을 입력해주세요.";
            return;
        }
        let url = "/member/find_pwd/?email="+email;

        fetch(url,{
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            }})
            .then((response) => response.json())
            .then((data) =>  result.innerText = data.str);
    }
	 


</script>
<style type="text/css">
.custom-margin-left {
	margin-left: 32rem; /* 혹은 다른 크기로 조절 */
}

.modal-header {
	display: flex;
	justify-content: center;
	border-bottom: 1px solid #ccc;
	background-color: black;
	margin-top: 100px; /* 여백 제거 */
}

.login-text {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 10px;
	margin-top: 50px; /* 여백 제거 */
}

.modal-title {
	color: white;
	font-size: 30px;
	font-weight: bold;
	font-family: 'Noto Sans KR', sans-serif;
}

.social-login {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction:column
}

.google-login {
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: large;
	padding: 10px 20px; /* 내부 여백 설정 */
	border-radius: 20px; /* 둥근 테두리 설정 */
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.3s ease;
	width: 40%;
	text-align: center;
	font-size: 16px;
	border: 1px solid #86A5FF;
}

.google-login:hover {
	background-color: #3c78e1; /* 호버 시 배경색 변경 */
	transform: scale(1); /* 호버 시 약간 확대되는 효과 */
}

.text {
	flex-grow: 1; /* 남은 공간을 텍스트가 채우도록 함 */
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 기본 링크 색상 유지 */
}

.facebook-login {
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: large;
	padding: 10px 20px; /* 내부 여백 설정 */
	border-radius: 20px; /* 둥근 테두리 설정 */
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.3s ease;
	width: 40%;
	text-align: center;
	font-size: 16px;
	margin-top: 12px;
	border: 1px solid #86A5FF;
}

.facebook-login:hover {
	background-color: #3c78e1; /* 호버 시 배경색 변경 */
	transform: scale(1); /* 호버 시 약간 확대되는 효과 */
}

.logo-index {
	display: flex;
	justify-content: center;
	align-items: center;
}

.or-container {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 10px;
}

.or-text {
	margin: 10px; /* "or" 텍스트 양 옆의 여백 설정 */
	color: #86A5FF;
	margin-top: 20px;
}

.or-line {
	flex-grow: 1; /* 나머지 공간을 모두 채우도록 설정 */
	border: none;
	border-top: 1px solid #86A5FF;
	margin-left: 30px;
	margin-right: 30px;
}

.login-form {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction:column
}

.information-input {
	font-family: 'Noto Sans KR', sans-serif;
	width:70%;
	margin-bottom:15px;
}


.input {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	margin-right: 23px;
}

.input input {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 10px; /* 둥근 테두리 설정 */
	font-size: 14px;
	outline: none; /* 포커스 효과 제거 */
	width:80%;
}

.input input::placeholder {
	color: #999;
}



.userName{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
	margin-left:100px;
}

.last-1 {
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: large;
	padding: 8px 8px;
	margin-top: 50px;
	margin-bottom: 30px;
	margin-left: -30px;
	border-radius: 50px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.3s ease;
	width: 50%;
	background-color: #00AB6B;
	color: white;
	border: none;
}

.find {
	margin-left: 500px;
}
.form-check {
	margin-top:30px;
	display:flex;
	width:56%;
}
</style>

</head>
<body>

	<div class="modal-header">
		<p class="modal-title">Sign up to download unlimited full
			resolution smedia</p>
	</div>
	<div style ="display:flex; flex-direction:column; justify-content:center; padding : 0 300px;" >

	<h2 class='login-text'>로그인</h2>
	<div class="social-login">

		<div class="google-login">
			<div class="logo-index">
				<img src="/images/member.images/logo.png" alt="" />
			</div>
			<a href="https://www.google.com" class="text"> 구글 계정으로 계속하기 </a>
		</div>

		<div class="facebook-login">
			<div class="logo-index">
				<img src="/images/member.images/facebook-logo.jpg" alt="" />
			</div>
			<a href="https://www.facebook.com" class="text"> 페이스북 계정으로 계속하기 </a>
		</div>
	</div>

	<div class="or-container">
		<hr class="or-line" />
		<span class="or-text">or</span>
		<hr class="or-line" />
	</div>


	<form action="/member/login" method="post" class="login-form">
		<div class="information-input">
			<div class="userName">*사용자 이메일</div>
			<div class="input">
				<input type="text" name="Email" id="Email" required="required"
					placeholder="Enter your username" value='${c_id_val}' />
			</div>
		</div>

		<div class="information-input">
			<div class="userName">*비밀번호</div>
			<div class="input">
				<input type="password" class="form-control" id="pwd"
					placeholder="Enter password" name="passwd" required="required" />
			</div>
		</div>

		<div class="form-check mb-3">

			<label class="form-check-label"> <c:choose>
					<c:when test="${c_id =='Y'}">
						<input class="form-check-input" type="checkbox" name="c_id"
							value="Y" checked="checked"> Remember ID
          </c:when>
					<c:otherwise>
						<input class="form-check-input" type="checkbox" name="c_id"
							value="Y"> Remember ID
          </c:otherwise>
				</c:choose>
			</label>
		</div>

		<button type="submit" class="last-1">로그인</button>
		
		<div class ="mb-5">
		<button type="button" data-bs-toggle="collapse" data-bs-target="#find_email"  class="btn btn-light">아이디 찾기</button>
		<button type="button" data-bs-toggle="collapse"
			data-bs-target="#find_PW" class="btn btn-light">비밀번호 찾기</button>
		<button type="button" class="btn btn-light" onclick="location.href='agree'">회원가입</button>
                    <div id="find_email" class="collapse mt-3 mb-3">
                        <div class="row">
                            <div class="col-sm-5">
                                <input type="text" class="form-control" placeholder="Enter name" id="id_first">
                            </div>
                       
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-outline-dark"  style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem;" onclick="find_id()">찾기</button>
                            </div>
                            <div class="id_result"></div>
                        </div>
                    </div>
                    <%--PW 찾기 --%>
                    <div id="find_PW" class="collapse mt-3 mb-3">
                        <div class="row">                 
                            <div class="col-sm-5">
                                <input type="email" class="form-control" placeholder="Enter email" id="id_second">
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-outline-dark"  style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem;" onclick="find_pw()">찾기</button>
                            </div>
                            <div class="pw_result"></div>
                        </div>
                    </div>
	</div>
	</form>
		
		 			

</div>
</body>
</html>
