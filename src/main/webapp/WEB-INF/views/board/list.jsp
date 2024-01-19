<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- 검색 돋보기 아이콘 -->
<link rel="stylesheet" href="/css/board.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://kit.fontawesome.com/71c72323b0.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function read(bno) {
		let url = "read";
		url += "?bno=" + bno;
		url += "&nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";
		location.href = url;
	}
</script>

<title>Board List</title>
<meta charset="utf-8">
</head>
<body>
	<header class="bg-dark py-2">
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<a class="navbar-brand text-white" href="/">Logo</a>
			</div>
		</nav>
	</header>
	<div class="container mt-3">
		<h3>게시판 목록</h3>
		<form action="list">
			<div class="row">
				<div class='col'>
					<select class="form-select" name="col">
						<option value="wname" <c:if test="${col=='bname'}">selected</c:if>>성명</option>
						<option value="title"
							<c:if test="${col=='btitle'}">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${col=='bcontent'}">selected</c:if>>내용</option>
						<option value="title_content"
							<c:if test="${col=='btitle_bcontent'}">selected</c:if>>제목+내용</option>
						<option value="total" <c:if test="${col=='total'}">selected</c:if>>전체출력</option>
					</select>
				</div>
				<div class="col">
					<input type="text" class="form-control" placeholder="Enter 검색어"
						name="word" value="${word}">
				</div>
				<div class='col'>
					<button type="submit" class="btn btn-dark">검색</button>
					<button type="button" class="btn btn-dark"
						onclick="location.href='create'">등록</button>
				</div>
			</div>
		</form>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
					<th>파일</th>
					<th>indent(답변차수)</th>
					<th>ansnum(답변순서)</th>
				</tr>
			</thead>
			<tbody>


				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="8">등록된 글이 없습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.bbsno}</td>
								<td><c:forEach begin="1" end="${dto.indent}">
										&nbsp;&nbsp;
									</c:forEach> <c:if test="${dto.indent > 0}">
										<img src='../images/re.jpg'>
									</c:if> <a href="javascript:read('${dto.bbsno}')"> ${dto.title} </a> <c:if
										test="${util:newImg(dto.wdate)}">
										<img src='../images/new.gif'>
									</c:if> <%-- <c:set var="rcount" value="${util:rcount(dto.bbsno,rmapper) }"></c:set>
									<c:if test="${rcount > 0}">
										<span class="badge rounded-pill bg-secondary">${rcount}</span>
									</c:if> --%></td>
								<td>${dto.wname}</td>
								<td>${dto.wdate}</td>
								<td>${dto.viewcnt}</td>
								<td><c:if test="${not empty dto.filename}">
										<a href="javascript:fileDown('${dto.filename}')">${dto.filename}</a>
									</c:if></td>
								<td>${dto.indent}</td>
								<td>${dto.ansnum}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>

		</table>

		${paging}

	</div>
</body>
</html>
