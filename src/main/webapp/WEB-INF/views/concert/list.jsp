<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
        />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
        />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap"
            rel="stylesheet"
        />
        <link
            href="https://fonts.googleapis.com/css2?family=Anton&display=swap"
            rel="stylesheet"
        />
        <title>행사 및 콘서트 일정</title>
        <link rel="stylesheet" href="/css/concert.css" />
    </head>
    <body>
        <div class="col" id="list">
        	 <c:choose>
			      <c:when test="${empty list}">
			      	<tr><td colspan="5">등록된 공지사항이 없습니다.</td></tr>
			      </c:when>
		      <c:otherwise>
		        	<c:forEach var="dto" items="${list}" varStatus="status">
			            <div class="row pov" id="ele_${dto.conid}">
			                <div class="col hvr-float">
			                    ${dto.name}
			                    <i class="bi bi-arrow-up-right"></i>
			                    <div class="mar">
			                        <span class="badge">${dto.date}</span>
			                        <span class="badge rounded-pill">Primary</span>
			                        <span class="badge rounded-pill">Primary</span>
			                    </div>
			                </div>
			
			                <img
			                    class="col my_img"
			                    id="img_1"
			                    src="/images/concert/${dto.image}"
			                 
			                />
			            </div>
		            </c:forEach>
	            </c:otherwise>
	     	</c:choose>
        </div>
    </body>
</html>
