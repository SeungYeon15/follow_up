<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Notice</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/css/notice.css">
<script type="text/JavaScript">
	function checkIn(f) {
		if (f.ntitle.value == "") {
			alert("제목를 입력하세요");
			f.title.focus();
			return false;
		}
		if (f.ncontent.value == "") {
			window.alert("내용을 입력해 주세요.");
			f.content.focus();
			return false;
		}
		if (f.bpasswd.value == "") {
			alert("패스워드를 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
</script>
<meta charset="utf-8">
</head>
<body>
	<header class="header">
		<!-- <h1>Dua Lipa</h1> -->
	</header>
	<div class="container">
		<h2>New Post</h2>
		<form action="create" method="post" enctype="multipart/form-data">
			<input type="hidden" name='nname' value="admin"><!--value="${sessionScope.id}"-->
			<div class="mb-3 mt-3">
				<input type="text" class="form-control" id="ntitle"
					placeholder="Enter title" name="ntitle">
			</div>
			<div class="mb-3 mt-3">
				<textarea class="form-control" rows="14" id="ncontent"
					placeholder="Write it down here" name="ncontent"></textarea>
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