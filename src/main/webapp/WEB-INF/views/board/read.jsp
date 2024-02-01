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
<link rel="stylesheet" href="/css/board.css">

<meta charset="UTF-8">
<title>Board Read</title>
<script type="text/javascript">
	let loginId = "user1" // "${sessionScope.userId}";

	function list() {
		let url = "list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";

		location.href = url;
	}

	function board_update() {
		if ('${dto.bnum}' !== loginId) {
			alert('수정 권한이 없습니다.');
		} else {
			let url = "update";
			url += "?nowPage=${param.nowPage}";
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			url += "&bnum=${dto.bnum}";
			location.href = url;
		}
	}

	function del() {
		if ('${dto.bnum}' !== loginId) {
			alert('삭제 권한이 없습니다.');
		} else if (confirm("삭제하시겠습니까?")) {
			let url = "delete";
			url += "?nowPage=${param.nowPage}";
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			url += "&bnum=${dto.bnum}";
			location.href = url;
		}
	}

	function prev() {
		let url = "read";
		url += "?bnum=${prevBnum}";
		url += "&nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		location.href = url;
	}

	function next() {
		let url = "read";
		url += "?bnum=${nextBnum}";
		url += "&nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		location.href = url;
	}
</script>

</head>
<body>
	<input type="hidden" name='userId' value="admin">
	<!--value="${sessionScope.userId}"-->
	<header class="header">
		<!-- <h1>Dua Lipa</h1> -->
	</header>
	<div class="container">
		<h2>
			<a onclick="list()">COMMUNITY</a>
		</h2>
		<table class="table">
			<thead>
				<tr>
					<th>${dto.btitle}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align: right;">${dto.userId}|${dto.bdate}|
						${dto.bview}</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-hover" id="table2">
			<thead>
				<tr>
					<th><div
							style="min-height: 350px; vertical-align: top; text-align: left; font-weight: normal;">${dto.bcontent}</div></th>
				</tr>
				<tr>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:choose>
						<c:when test="${prevBnum != null}">
							<td onclick="prev()"
								style="text-align: left; vertical-align: middle;"><b>prev∧</b>
								${prevBtitle}</td>
						</c:when>
						<c:otherwise>
							<td style="text-align: left; vertical-align: center;"><b>prev∨</b>
								-</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${nextBnum != null}">
							<td onclick="next()"
								style="text-align: left; vertical-align: center;"><b>next∨</b>
								${nextBtitle}</td>
						</c:when>
						<c:otherwise>
							<td style="text-align: left; vertical-align: center;"><b>next∨</b>
								-</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</tbody>
		</table>
		<div class="button-style">
			<button class="btn btn-outline-dark btn-sm"
				onclick="location='create'">Post</button>
			<button class="btn btn-outline-dark btn-sm" onclick="board_update()">Edit</button>
			<button class="btn btn-outline-dark btn-sm" onclick="del()">Delete</button>
			<button class="btn btn-outline-dark btn-sm" onclick="list()">Back</button>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>Reply
						<button id='addReplyBtn'
							class='btn btn-outline-dark float-end btn-sm'>New</button>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="card-body chat">
							<strong class="float-start">u1</strong> <small class="float-end">2023-08-12</small>
							<br>
							<p>Good job!</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="card-footer">Footer</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<script>
		let bnum = "${dto.bnum}";
		let sno = "${sno}";
		let eno = "${eno}";
		let nPage = "${nPage}";
		let nowPage = "${param.nowPage}";
		let colx = "${param.col}";
		let wordx = "${param.word}";
		let userId = "admin"/* "${sessionScope.userId}" */;
		console.log("userId: " + userId);
	</script>
	<script src="/js/producer.js" defer></script>
	<script src="/js/consumer.js" defer></script>

	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">New Reply</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<label>Content</label>
					<textarea cols="10" rows="5" class="form-control" name='rcontent'>New Reply!!!!</textarea>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Edit</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-success">Delete</button>
					<button id='modalCloseBtn' type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>