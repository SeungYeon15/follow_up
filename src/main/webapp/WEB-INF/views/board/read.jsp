<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function list(){
	let url = "list";
	url += "?nowPage=${param.nowPage}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	
	location.href= url;
}

function reply(){
	let url = "reply";
	url += "?nowPage=${param.nowPage}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&noticeno=${dto.noticeno}";
	
	location.href= url;
}

function notice_update(){
	let url = "update";
	url += "?nowPage=${param.nowPage}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&noticeno=${dto.noticeno}";
	
	location.href= url;
}

function del(){
	let url = "delete";
	url += "?nowPage=${param.nowPage}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&noticeno=${dto.noticeno}";
	location.href= url;
}
</script>

</head>
<body>
	<div class="container mt-3 mb-3">
		<h3>조회</h3>
		<ul class="list-group">
			<li class="list-group-item">작성자 : ${dto.userId}</li>
			<li class="list-group-item">제목 : ${dto.btitle}</li>
			<li class="list-group-item" style="height: 350px; overflow-y: scroll">${dto.bcontent}</li>
			<li class="list-group-item">조회수 : ${dto.bview}</li>
			<li class="list-group-item">등록일 : ${dto.bdate}</li>
		</ul>
		<br>
		<button class="btn btn-outline-dark" onclick="location='create'">등록</button>
		<button class="btn btn-outline-dark" onclick="del()">삭제</button>
		<button class="btn btn-outline-dark" onclick="notice_update()">수정</button>
		<button class="btn btn-outline-dark" onclick="list()">목록</button>
		<br> <br>
		<!--댓글  -->
		<div class="card">
			<div class="card-header">
				댓글
				<button id='addReplyBtn' class='btn btn-primary float-end btn-sm'>New
					Reply</button>
			</div>
			<div class="card-body chat">
				<strong class="float-start">u1</strong> <small class="float-end">2023-08-12</small>
				<br>
				<p>Good job!</p>
			</div>
			<div class="card-footer">Footer</div>
		</div>
		<!--div card end  -->
	</div>
	<!-- container end -->

	<!-- 페이지 로딩시 댓글 목록 처리-->
	<script>
		let noticeno = "${dto.bnum}"; 
		let sno = "${sno}";
		let eno = "${eno}";
		<!-- 댓글용 paging, 게시판 검색 -->
		let nPage = "${nPage}";
		let nowPage = "${param.nowPage}";
		let colx = "${param.col}";
		let wordx = "${param.word}";
		<!-- session에서 id 가져옴 -->
		let id = "${sessionScope.id}";
		console.log("id: " + id);
 	</script>
	<!-- 댓글처리 관련 Javascript 파일 추가-->
	<script src="/js/producer.js" defer></script>

	<script src="/js/consumer.js" defer></script>


	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
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