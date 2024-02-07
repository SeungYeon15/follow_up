<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link href='https://fonts.googleapis.com/css?family=Cinzel'
	rel='stylesheet' />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
/* body 스타일 */
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

:root {
	--fc-border-color: #d3d2d2;
	--fc-daygrid-event-dot-width: 10px;
}

html, body {
	background-color: #f2ebe5;
	overflow: hidden;
	font-size: 14px;
	font-family: "Pretendard-Regular";
}

/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 4.5em;
	padding-bottom: 0.4em;
	font-size: 16px;
	font-weight: bolder;
}

li::marker {
	content: '❤ ';
}

 
#calendar {
	padding-left: 4.5em;
	padding-right: 4.5em;
}

.fc-daygrid-day-number {
	color: black;
}
</style>
</head>

<body style="padding: 30px;">
	<!-- calendar 태그 -->
	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>
	<input type="hidden" name='userId' value="${sessionScope.userName}">
	<ul>
		<c:forEach var="dto" items="${list }">
			<li id="${dto.tagName }"
				style='list-style: none; float: right; margin-right: 20px; color: #${dto.tagColor'><span
				style="color: #888;">${dto.tagName }</span></li>
		</c:forEach>
	</ul>
	<div id="info" style="display: none"></div>
	<div class="modal" id="scheduleModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">스케줄 추가</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="scheduleForm">
						<div class="form-group">
							<label for="title">일정 제목:</label> <input type="text"
								class="form-control" id="title" required>
						</div>
						<div class="form-group">
							<label for="content">일정 소개:</label> <input type="text"
								class="form-control" id="content" required>
						</div>
						<div class="form-group">
							<label for="tag">일정 태그:</label> <select id="tag" name="tag"
								style="width: 100%;">
								<c:forEach var="dto" items="${list }">
									<option value='${dto.tagName}' style='color: #${dto.tagColor'>
										${dto.tagName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="startTime">시작 시간:</label> <input
								type="datetime-local" class="form-control" id="startTime"
								required>
						</div>
						<div class="form-group">
							<label for="endTime">종료 시간:</label> <input type="datetime-local"
								class="form-control" id="endTime" required>
						</div>
						<button type="submit" class="btn btn-primary">추가</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
// 	var tagList = [] ;
	 function convertToDatetime(LocalValue) {
		  const localDate = new Date(LocalValue);
		  
		  const Datetime = localDate.toISOString().slice(0, 19).replace('T', ' ');

		  return Datetime;
		}
    function getSchedule(){
        return fetch("/schedule/getSchedule")
                        .then(response => response.json());
    }
//     function getTagList() {
//     	  return fetch("/schedule/getTagList")
//     	    .then(response => response.json()).then(data=>data.forEach(item=>{
//     			tagList.push(item.tagName+":"+item.tagColor)}));
//     	}

	
//     function setTagList(){
//   	  let selectEl = document.querySelector("select");
//   	tagList.then(data => {
//   	      data.forEach(item => {
//   	        $(selectEl).append("<option value='" + item.tagName + "' style='color:#"+item.tagColor+"'>" + item.tagName + "</option>");
//   	      });
//   	    });
//     }

   	function modalOn(start, end, calendar){
   	    var $useridElement = $("input[name='userid']");
   	    if ($useridElement.val() !== 'admin') {
   	        alert('관리자만 수정 가능합니다.');
   	return;
   	    }
    	  $("#scheduleModal").modal("show");
			document.getElementById('startTime').value=start;
			document.getElementById('endTime').value=end;
    	  $("#scheduleForm").submit(function (e) {
    	      e.preventDefault();
    	      
    	      var title = $('#title').val();
    	      var startTime = $('#startTime').val();
    	      var endTime = $('#endTime').val();
    	      var tag = $("#tag option:selected").val();
    	      var content = $('#content').val();

    	      var tagColor = document.getElementById(tag).style.color;
    	      
    	      calendar.addEvent({
                  title: title,
                  start: startTime,
                  end: endTime,
                  color: tagColor,
                  display: "list-item"
              });

    	      $("#scheduleModal").modal("hide");
    	      fetch('/schedule/addSchedule/'+title+'/'+startTime+'/'+endTime+'/'+tag+'/'+content);
    	     
    	    });
    	}
    (function() {
		$(function() {
		   	$('.modal').on('hidden.bs.modal', function (e) {
	    		$(this).find('form')[0].reset();
	    	});
// 			var option = $("#select option:selected").val();
// 			console.log(option);
				
			// calendar element 취득
			var calendarEl = $('#calendar')[0];
			// full-calendar 생성하기
			var calendar = new FullCalendar.Calendar(calendarEl, {
				height : '700px', // calendar 높이 설정
				expandRows : true, // 화면에 맞게 높이 재설정
				slotMinTime : '08:00', // Day 캘린더에서 시작 시간
				slotMaxTime : '20:00', // Day 캘린더에서 종료 시간
				// 해더에 표시할 툴바
				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				// initialDate: '2024-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				selectable : true, // 달력 일자 드래그 설정가능
				nowIndicator : true, // 현재 시간 마크
				dayMaxEvents : true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
				locale : 'ko', // 한국어 설정
				eventAdd : function(obj) { // 이벤트가 추가되면 발생하는 이벤트
					console.log(obj);
				},
				eventChange : function(obj) { // 이벤트가 수정되면 발생하는 이벤트
					console.log(obj);
				},
				eventRemove : function(obj) { // 이벤트가 삭제되면 발생하는 이벤트
					console.log(obj);
				},
				select : function(arg) {
					var offset = arg.start.getTimezoneOffset() * 60000; //ms단위라 60000곱해줌
					var startTime = new Date(arg.start - offset).toISOString().slice(0, -1);
					var endTime = arg.end.toISOString().slice(0, -1);
					  
					modalOn(startTime,endTime,calendar);
			        calendar.unselect();

// 						// 시작시간과 종료시간 가져오기
// 			    	    var startTime = convertToDatetime($("#startTime").val());
// 			    	    var endTime = convertToDatetime($("#endTime").val());
// 			    	    var Stitle = $("#title").val();
// 			    	    var Scontent = $("#content").val();
// 						// 캘린더에서 드래그로 이벤트를 생성할 수 있다.
// 						if (Stitle) {
// 							calendar.addEvent({
// 								title : Stitle,
// 								start : startTime,
// 								end : endTime,
// 								display: 'list-item'
// 							})
// 						}
						
					},
					// 이벤트 
// 					events :schedule
				});    
				// 캘린더 랜더링
				calendar.render();
				
				
				document.getElementsByClassName('fc-timeGridWeek-button')[0].addEventListener('click', function () {
				      var date = calendar.getDate();
// 				      alert("The current date of the calendar is " + date.toISOString());
				    });
				getSchedule()
			    .then(data => {
			        // data를 이용하여 FullCalendar 이벤트 배열 생성
			        var calendarEvents = data.map(item => {
			            return {
			                title: item.title,
			                start: item.start,
			                end: item.end,
			                color: "#" + item.tagColor,
			                display: "list-item"
			            };
			        });

			        // FullCalendar에 이벤트 배열 추가
			        calendar.addEventSource( calendarEvents);
			    });
			});
		})();
    		
    		
	</script>



</body>

</html>