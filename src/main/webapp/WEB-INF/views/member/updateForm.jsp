<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <title>회원수정</title>
  <meta charset="utf-8">
  <style type="text/css">
    #need, #emailcheck { color: red; }
    body { background-color: #f8f9fa; }
    .container { margin-top: -130px; width: 60%; height: 45%; background-color: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
    .form-title { margin-bottom: 30px; font-size: 24px; font-weight: bold; color: #007bff; }
    .form-group { margin-bottom: 20px; }
    .input-group { margin-bottom: 15px; }
    .input-group-text { min-width: 150px; }
    .form-control { width: 70%; margin-right: 15px; text-align:start}
    .btn-group { margin-top: 20px; }
  </style>
  <script type="text/javascript">
  function emailCheck(email) {
      if (email === '') {
          alert("email를 입력하세요");
          document.frm.email.focus();
      } else {
          var url = "/member/emailcheck";
          url += "?email=" + email;

          $.get(url, function (data, textStatus) {
              $("#emailcheck").text(data.str);
          })
      }
  }
 
function inCheck(f){
  
  if(f.userEmail.value.length==0){
    alert("이메일을 입력하세요");
    f.email.focus();
    return false;
  }
  
}
 
</script>
</head>
<body>
  <div class="container" style="margin-left: 360px; margin-bottom: 100px;">
    <h3 class="form-title">정보 수정 <small>(<span id="need">*</span> 필수입력사항)</small></h3>
    <form action="/member/update" method="post" name='frm' onsubmit="return inCheck(this)" class="form-group">
      <input type="hidden" name="userId" value="${dto.userId}">
      <div class="input-group">
        <div class="input-group-text">이름</div>
        <div class="form-control">${dto.userName}</div>
      </div>
      <div class="input-group">
        <div class="input-group-text"><span id="need">*</span>비밀번호</div>
        <input type="password" class="form-control" id="passwd" value="${dto.userPasswd}" name="userPasswd">
      </div>
      <div class="input-group">
        <div class="input-group-text"><span id="need">*</span>이메일</div>
        <input type="email" class="form-control" id="email" value="${dto.userEmail}" name ="userEmail">
        <button type="button" class="btn btn-outline-dark" onclick="emailCheck(document.frm.userEmail.value)">Email 변경</button>
        <div id="emailcheck"></div>
      </div>
      <div class="btn-group">
        <button type="submit" class="btn btn-primary">수정</button>
        <button type="reset" class="btn btn-secondary">취소</button>
      </div>
    </form>
  </div>
</body>
</html>
