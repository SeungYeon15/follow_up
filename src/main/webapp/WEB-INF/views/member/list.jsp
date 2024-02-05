<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            
        }

        .card {
            margin-bottom: 20px;
        }

        .card img {
            max-width: 80%;
            height: auto;
        }

        .card-title {
            font-size: 1.25rem;
        }

        .card-text {
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <div class="" style="margin-top:120px;">
        <h2 class="text-center mb-4">회원목록</h2>

        ${admin} <br>

        <c:forEach var="dto" items="${list}">
            <div class="card">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <img src="${root}/member/storage/${dto.userFile}" class="card-img" alt="사용자 이미지">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">아이디: <a href="javascript:read('${dto.userId}')">${dto.userId}</a></h5>
                            <p class="card-text">성명: ${dto.userName}</p>
                            <p class="card-text">이메일: ${dto.userEmail}</p>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Bootstrap JS 및 Popper.js -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
