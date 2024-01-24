<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/css/board.css">

<meta charset="UTF-8">
<title>Board Read</title>
<script>
	function list() {
		let url = "list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";

		location.href = url;
	}

	function board_update() {
		let url = "update";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&bnum=${dto.bnum}";

		location.href = url;
	}

	function del() {
		let url = "delete";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&bnum=${dto.bnum}";
		location.href = url;
	}
</script>

</head>
<body>
	<input type="hidden" name='userId' value="">
	<!--value="${sessionScope.id}"-->
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
					<td style="text-align: right;">${dto.userId} | ${dto.bdate} |
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
			<tr>
				<td onclick="prev('${dto.bnum}')"
					style="text-align: left; vertical-align: middle;"><b>prev∧</b>
					${dto.btitle}</td>
			</tr>
			<tr>
				<td onclick="prev('${dto.bnum}')"
					style="text-align: left; vertical-align: center;"><b>next∨</b>
					${dto.btitle}</td>
			</tr>
			</tbody>
		</table>
		<div class="button-style">
			<c:choose>
				<%-- <c:if
							test="${not empty sessionScope.id && sessionScope.grade == 'A'}"> --%>
				<c:when
					test="${requestScope.userId == 'admin' || not empty requestScope.userId}">

					<button class="btn btn-outline-dark btn-sm"
						onclick="location='create'">Post</button>
					<button class="btn btn-outline-dark btn-sm"
						onclick="board_update()">Edit</button>
					<button class="btn btn-outline-dark btn-sm" onclick="del()">Delete</button>

				</c:when>
				<c:otherwise>
					<button class="btn btn-outline-dark btn-sm"
						onclick="history.back()">Back</button>
				</c:otherwise>
			</c:choose>
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
							<br> Good job!
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
		let id = "${sessionScope.id}";
		console.log("id: " + id);
	</script>

	<script src="/js/producer.js" defer></script>
	<script src="/js/consumer.js" defer></script>

	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">REPLY MODAL</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<label>내용</label>
					<textarea cols="10" rows="3" class="form-control" name='content'>New Reply!!!!</textarea>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-success">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>