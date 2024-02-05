<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            padding: 50px;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            color: #007bff;
        }

        .form-label {
            color: #495057;
        }

        .btn-outline-primary, .btn-outline-success {
            border-color: #007bff;
            color: #007bff;
        }

        .btn-outline-primary:hover, .btn-outline-success:hover {
            background-color: #007bff;
            color: #fff;
        }

        #emailcheck {
            font-size: 14px;
        }

        .input-group-text {
            background-color: #007bff;
            color: #fff;
        }

        .form-control {
            border: 1px solid #ced4da;
            border-radius: 5px;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .invalid-feedback {
            color: #dc3545;
        }

        .valid-feedback {
            color: #28a745;
        }
    </style>
</head>
<body>
<div class="container" style="margin-left:300px;">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title"><i class="bi bi-person"></i> 회원가입 <small>(<span style="color: red;">*</span>필수입력사항)</small></h2>
                    <form action="create" method="post" name='frm' enctype="multipart/form-data" onsubmit="return inCheck(this)">
                        <div class="mb-3">
                            <label for="mname" class="form-label"><span style="color: red;">*</span> 이름</label>
                            <input type="text" class="form-control" id="mname" placeholder="Enter 이름" name="userName" required>
                            <div class="invalid-feedback">이름을 입력하세요.</div>
                        </div>
                        <div class="mb-3">
                            <label for="userPasswd" class="form-label"><span style="color: red;">* </span> 비밀번호</label>
                            <input type="password" class="form-control" placeholder="Enter passwd" name="userPasswd" id="userPasswd" required>
                            <div class="invalid-feedback">비밀번호를 입력하세요.</div>
                        </div>
                        <div class="mb-3">
                            <label for="repasswd" class="form-label"><span style="color: red;">*</span> 비밀번호 확인</label>
                            <input type="password" class="form-control" placeholder="Enter repasswd" name="repasswd" id="repasswd" required>
                            <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
                            <div class="valid-feedback">비밀번호가 일치합니다.</div>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label"><span style="color: red;">*</span> 이메일</label>
                            <div class="input-group">
                                <input type="email" class="form-control" id="email" placeholder="Enter email" name="userEmail" required>
                                <button type="button" class="btn btn-info" onclick="emailCheck(document.frm.email.value)">Email 중복확인</button>
                                <div id="emailcheck" class="ms-2"></div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="fnameMF" class="form-label">사진</label>
                            <input type="file" class="form-control" id="fnameMF" name="fnameMF" accept=".jpg,.gif,.png">
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-outline-primary">등록</button>
                            <button type="button" class="btn btn-outline-success" onclick="location.href='/member/login'">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    function emailCheck(email) {
        if (email === '') {
            alert("email를 입력하세요");
            document.frm.email.focus();
        } else {
            var url = "emailcheck";
            url += "?email=" + email;

            $.get(url, function (data, textStatus) {
                $("#emailcheck").text(data.str);
            })
        }
    }

    // 입력값 검증
    function inCheck(f) {
        var passwd = f.userPasswd.value;
        var repasswd = f.repasswd.value;

        if (f.mname.value.length === 0) {
            setInvalidFeedback(f.mname, "이름을 입력하세요.");
            return false;
        }

        if (passwd.length === 0) {
            setInvalidFeedback(f.userPasswd, "비밀번호를 입력하세요.");
            return false;
        }

        if (repasswd.length === 0) {
            setInvalidFeedback(f.repasswd, "비밀번호 확인을 입력하세요.");
            return false;
        }

        if (passwd !== repasswd) {
            setInvalidFeedback(f.repasswd, "비밀번호가 일치하지 않습니다.");
            return false;
        } else {
            setValidFeedback(f.repasswd, "비밀번호가 일치합니다.");
        }

        if (f.email.value.length === 0) {
            setInvalidFeedback(f.email, "이메일을 입력하세요.");
            return false;
        }

        return true;
    }

    // 입력 요소에 유효하지 않은 피드백 설정
    function setInvalidFeedback(element, message) {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        element.nextElementSibling.textContent = message;
    }

    // 입력 요소에 유효한 피드백 설정
    function setValidFeedback(element, message) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        element.nextElementSibling.textContent = message;
    }
</script>
</body>
</html>
