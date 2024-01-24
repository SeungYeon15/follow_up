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

<script type="text/javascript">
	function read(bnum) {
		let url = "read";
		url += "?bnum=" + bnum;
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
	<header class="header">
		<h1>Dua Lipa</h1>
	</header>
	<div class="container">
		<h2>COMMUNITY</h2>
		<form action="./list">
			<input type="hidden" name='userId' value="">
			<!--value="${sessionScope.id}"-->
			<div class="row">
				<div class='col-3'>
					<select class="form-select" name="col">
						<option value="userId"
							<c:if test="${col=='userId'}">selected</c:if>>성명</option>
						<option value="btitle"
							<c:if test="${col=='btitle'}">selected</c:if>>제목</option>
						<option value="bcontent"
							<c:if test="${col=='bcontent'}">selected</c:if>>내용</option>
						<option value="btitle_bcontent"
							<c:if test="${col=='btitle_bcontent'}">selected</c:if>>제목+내용
						</option>
						<option value="total" <c:if test="${col=='total'}">selected</c:if>>전체출력
						</option>
					</select>
				</div>
				<div class="col-7">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Enter 검색어"
							name="word" value="${word}">
						<button class="btn btn-outline-secondary" type="submit"
							aria-label="검색">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
				<%-- <c:if
							test="${not empty sessionScope.id && sessionScope.grade == 'A'}"> --%>
				<c:if
					test="${requestScope.userId == 'admin' || not empty requestScope.userId}">
					<div class='col'>
						<button type="button" class="btn btn-dark"
							onclick="location.href='./create'">등록</button>
					</div>
				</c:if>
			</div>
		</form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>No.</th>
					<th>title</th>
					<th>id</th>
					<th>date</th>
					<th>view</th>
				</tr>
			</thead>
			<tbody>

				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="8">등록된 글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list}">
							<tr onclick="read('${dto.bnum}')">
								<td>${dto.bnum}</td>
								<td>${dto.btitle}<c:if
										test="${util:newImg(fn:substring(dto.bdate,0,10)) }">
										<img src="../images/new.gif">
									</c:if> <%-- <c:set var="rcount" value="${util:rcount(dto.noticeno,rmapper)}"></c:set> --%>
									<%-- <c:if test="${rcount >0 }">
										<span class="badge rounded-pill bg-secondary">${rcount}</span>
									</c:if> --%></td>
								<td>${dto.userId}</td>
								<td>${dto.bdate}</td>
								<td>${dto.bview}</td>
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
