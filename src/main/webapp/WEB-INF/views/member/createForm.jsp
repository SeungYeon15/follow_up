<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#need {
	color: red;
}

#idcheck, #emailcheck {
	color: red;
}

margin{
	margin-left:100px;
}

</style>
<script type="text/javascript">
	function emailCheck(email) {
		if (email == '') {
			alert("email를 입력하세요");
			document.frm.email.focus();
		} else {
			var url = "emailcheck";
			url += "?email=" + email;

			$.get(url, function(data, textStatus) {

				$("#emailcheck").text(data.str);

			})
		}
	}

	//입력값 검증  
	function inCheck(f) {
		
		if (f.passwd.value.length == 0) {
			alert("비번을 입력하세요");
			f.passwd.focus();
			return false;
		}
		if (f.repasswd.value.length == 0) {
			alert("비번확인을 입력하세요");
			f.repasswd.focus();
			return false;
		}
		if (f.passwd.value != f.repasswd.value) {
			alert("비번과 비번확인이 일치하지 않습니다.");
			f.passwd.value = "";
			f.repasswd.value = "";
			f.passwd.focus();
			return false;
		}
		if (f.mname.value.length == 0) {
			alert("이름을 입력하세요");
			f.mname.focus();
			return false;
		}
		if (f.tel.value.length == 0) {
			alert("전화번호를 입력하세요");
			f.tel.focus();
			return false;
		}
		if (f.email.value.length == 0) {
			alert("이메일을 입력하세요");
			f.email.focus();
			return false;
		}
		
	}
</script>


</head>
<body>
	
		<div class="container" style="margin-left: 200px;">	
		<h2><i class="fa-solid fa-user" style="margin-right: -220px;"></i> 회원가입 <small>(<span id="need">*</span>필수입력사항)</small></h2>
		<form action="create" method="post" name='frm'
			enctype="multipart/form-data" onsubmit="return inCheck(this)"
			style='width: 80%'>
		
		
		<div class="input-group mb-3">
				<div class="input-group-text">
					<span id="need">*</span> 이름
				</div>
				<input type="text" class="form-control" id="mname"
					placeholder="Enter 이름" name="userName">

			</div>
		
		<div class="input-group mb-3">
				<div class="input-group-text">
					<span id="need">* </span> 비밀번호
				</div>
				<input type="password" class="form-control"
					placeholder="Enter passwd" name="userPasswd">

			</div>
		
		
		<!-- <div class="input-group mb-3">
				<div class="input-group-text">
					<span id="need">*</span> 비밀번호 확인
				</div>
				<input type="password" class="form-control"
					placeholder="Enter repasswd" name="repasswd">

			</div> -->
			
		

			<div class="input-group mb-3">
				<div class="input-group-text">
					<span id="need">*</span> 이메일
				</div>
				<input type="email" class="form-control" id="email"
					placeholder="Enter email" name="userEmail">
				<button type="button" class="btn btn-info"
					onclick="emailCheck(document.frm.email.value)">Email 중복확인</button>
				<div id="emailcheck"></div>
			</div>
			
		
			
			

			<div class="input-group mb-3">
				<div class="input-group-text">사진</div>
				<input type="file" class="form-control" id="fnameMF" name="fnameMF"
					accept=".jpg,.gif,.png">
			</div>


			<div class="input-group mb-3">
				<button type="submit" class="btn btn-outline-primary">등록</button>
				<button type="reset" class="btn btn-outline-success">취소</button>
			</div>

		</form>

		<br>
		<br>
	</div>
</body>
</html>