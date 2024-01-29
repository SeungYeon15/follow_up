<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Notice</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/css/notice.css">
<script type="text/JavaScript">
	function checkIn(f) {
		if (f.title.value == "") {
			alert("제목를 입력하세요");
			f.title.focus();
			return false;
		}
		if (CKEDITOR.instances['content'].getData() == "") {
			window.alert("내용을 입력해 주세요.");
			CKEDITOR.instances['content'].focus();
			return false;
		}
		if (f.passwd.value == "") {
			alert("패스워드를 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<header class="header">
		<!-- <h1>Dua Lipa</h1> -->
	</header>
	<div class="container">
		<h2>Update</h2>
		<form action="update" enctype="multipart/form-data" method="post">
			<input type="hidden" name='nnum' value="${dto.nnum}"> <input
				type="hidden" name='nowPage' value="${param.nowPage}"> <input
				type="hidden" name='col' value="${param.col}"> <input
				type="hidden" name='word' value="${param.word}">
			<div class="mb-3 mt-3">
				<input type="text" class="form-control" id="ntitle"
					value="${dto.ntitle}" name="ntitle">
			</div>
			<div class="mb-3 mt-3">
				<textarea class="form-control" rows="14" id="ncontent"
					name="ncontent">${dto.ncontent}</textarea>
			</div>
			<div class="mb-3 mt-3">
				<input type="password" class="form-control" id="npasswd"
					placeholder="Enter password" name="npasswd">
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
			<button type="button" class="btn btn-light" onclick="history.back()">Cancel</button>
		</form>
	</div>
</body>
</html>