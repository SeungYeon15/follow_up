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

<link rel="stylesheet" href="/css/notice.css">

<script type="text/javascript">
	function read(nnum) {
		let url = "read";
		url += "?nnum=" + nnum;
		url += "&nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";
		location.href = url;
	}
	function qread(qnum) {
		let url = "qread";
		url += "?qnum=" + qnum;
		url += "&nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";
		location.href = url;
	}
</script>

<title>Notice List</title>
<meta charset="utf-8">
</head>
<body>
	<header class="header">
		<!-- <h1>Dua Lipa</h1> -->
	</header>
	<div class="container">
		<h2>NOTICE</h2>

		<div class="table-btn" role="group" aria-label="Button group"
			style="text-align: left;">
			<button type="button" class="btn btn-dark btn-sm"
				onclick="location.href='/notice/list';">Notice</button>
			<button type="button" class="btn btn-outline-dark btn-sm"
				onclick="location.href='/board/list';">Community</button>
		</div>

		<div id="noticeTable" class="table-responsive">
			<form action="./list">
				<%-- <c:set var="userId" value="admin" scope="request" /> --%>
				<input type="hidden" name='userId' value="admin">
				<!--value="${sessionScope.id}"-->
				<div class="row">
					<div class='col-3'>
						<select class="form-select" name="col">
							<option value="ntitle"
								<c:if test="${col=='ntitle'}">selected</c:if>>title</option>
							<option value="ncontent"
								<c:if test="${col=='ncontent'}">selected</c:if>>content</option>
							<option value="ntitle_ncontent"
								<c:if test="${col=='ntitle_ncontent'}">selected</c:if>>title/content
							</option>
							<option value="total"
								<c:if test="${col=='total'}">selected</c:if>>all</option>
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
					<div class='col'>
						<%-- <c:if test="${userId == 'admin'}"> --%>
							<button type="button" class="btn btn-dark"
								onclick="location.href='./create'">Post</button>
						<%-- </c:if> --%>
					</div>
					<%-- </c:if> --%>
				</div>
			</form>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>No.</th>
						<th>title</th>
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
								<tr onclick="read('${dto.nnum}')">
									<td>${dto.nnum}</td>
									<td><c:if
											test="${util:newImg(fn:substring(dto.ndate,0,10)) }">
											<img src="../images/new.gif">
										</c:if> ${dto.ntitle}</td>
									<td>${dto.ndate}</td>
									<td>${dto.nview}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
		</div>
		${paging}

	</div>
</body>
</html>
