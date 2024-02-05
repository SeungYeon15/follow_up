<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>이미지 수정</title>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }
        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="container" style="margin-left:300px;">
        <div class="mx-auto" style="max-width: 600px;">
            <h3 class="mb-4 text-center">이미지 수정</h3>
            
            <form action="/member/updateFile" method="post" enctype="multipart/form-data">
                <input type="hidden" name="oldfile" value="${param.fname}">
                <input type="hidden" name="id" value="${sessionScope.userId}">
                
                <!-- 원본 파일 카드 -->
                <div class="card mb-3">
                    <div class="card-body text-center"style="padding-top:100px; padding-bottom:100px;">
                        <h5 class="card-title mb-3">원본 파일</h5>
                        <img src="/member/storage/${param.fname}" class="img-fluid" alt="원본 파일">
                    </div>
                </div>
                
                <!-- 변경 파일 입력 -->
                <div class="mb-3">
                    <label for="filenameMF" class="form-label">변경 파일</label>
                    <input type="file" class="form-control" id="filenameMF" name="fname" accept=".jpg, .png, .gif" required="required">
                </div>
                
                <!-- 버튼 그룹 -->
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">수정</button>
                    <button type="button" class="btn btn-dark" onclick="history.back()">취소</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
