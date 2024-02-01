<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Notice</title>
<style type="text/css">
#red {
	color: red;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/css/notice.css">
</head>
<body>
<header class="header">
		<!-- <h1>Dua Lipa</h1> -->
	</header>
	<div class="container">
		<h2>Delete</h2>
		<p id='red'>삭제하면 복구할 수 없습니다</p>
		<form action="delete" method="post">
			<input type="hidden" name='nnum' value="${param.nnum}">
			<input type="hidden" name='nowPage' value="${param.nowPage}">
			<input type="hidden" name='col' value="${param.col}">
			<input type="hidden" name='word' value="${param.word}">

			<div class="row ms-auto">
				<div class="col">
					<input type="password" name="npasswd" placeholder="Enter password"
						class="form-control" required>
				</div>
				<div class="col">
					<button class="btn btn-outline-dark">Delete</button>
					<button type="button" class="btn btn-light"
						onclick="history.back()">Cancel</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>