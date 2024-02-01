<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="/css/notice.css">

<meta charset="UTF-8">
<title>Notice Read</title>
<script>
	function list() {
		let url = "list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";

		location.href = url;
	}

	function notice_update() {
		let url = "update";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nnum=${dto.nnum}";

		location.href = url;
	}

	function del() {
		let url = "delete";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nnum=${dto.nnum}";
		location.href = url;

		function prev() {
			let url = "read";
			url += "?bnum=${prevNnum}";
			url += "&nowPage=${param.nowPage}";
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			location.href = url;
		}

		function next() {
			let url = "read";
			url += "?bnum=${nextNnum}";
			url += "&nowPage=${param.nowPage}";
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			location.href = url;
		}

	}
</script>

</head>
<body>
	<input type="hidden" name='userId' value="">
	<!--value="${sessionScope.userId}"-->
	<header class="header">
		<!-- <h1>Dua Lipa</h1> -->
	</header>
	<div class="container">
		<h2>
			<a onclick="list()">NOTICE</a>
		</h2>
		<table class="table">
			<thead>
				<tr>
					<th>${dto.ntitle}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align: right;">${dto.userId}|${dto.ndate}|
						${dto.nview}</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-hover" id="table2">
			<thead>
				<tr>
					<th><div
							style="min-height: 350px; vertical-align: top; text-align: left; font-weight: normal;">${dto.ncontent}</div></th>
				</tr>
				<tr>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:choose>
						<c:when test="${prevNnum != null}">
							<td onclick="prev()"
								style="text-align: left; vertical-align: middle;"><b>prev∧</b>
								${prevNtitle}</td>
						</c:when>
						<c:otherwise>
							<td style="text-align: left; vertical-align: center;"><b>prev∨</b>
								-</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${nextNnum != null}">
							<td onclick="next()"
								style="text-align: left; vertical-align: center;"><b>next∨</b>
								${nextNtitle}</td>
						</c:when>
						<c:otherwise>
							<td style="text-align: left; vertical-align: center;"><b>next∨</b>
								-</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</tbody>
		</table>
		<div class="button-style" style="text-align: right;">
			<%-- <c:choose>
			<c:when test="${sessionScope.userId == 'admin'}"> --%>
			<button class="btn btn-outline-dark btn-sm"
				onclick="location='create'">Post</button>
			<button class="btn btn-outline-dark btn-sm" onclick="notice_update()">Edit</button>
			<button class="btn btn-outline-dark btn-sm" onclick="del()">Delete</button>
			<button class="btn btn-outline-dark btn-sm" onclick="list()">Back</button>
			<%-- </c:when>
				<c:otherwise>
					<button class="btn btn-outline-dark btn-sm"
						onclick="list()">Back</button>
				</c:otherwise>
			</c:choose> --%>
		</div>
	</div>
</body>
</html>