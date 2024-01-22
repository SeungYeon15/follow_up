<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href='https://fonts.googleapis.com/css?family=Cinzel'
	rel='stylesheet' />
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
	--fc-border-color: rgb(255, 255, 255);
	--fc-daygrid-event-dot-width: 10px;
}

html, body {
	overflow: hidden;
	font-size: 14px;
	font-family: "Pretendard-Regular";
}

/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 4.5em;
	padding-bottom: 0.4em;
}

#calendar {
	padding-left: 4.5em;
	padding-right: 4.5em;
}
</style>
</head>

<body style="padding: 30px;">
	<!-- calendar 태그 -->
	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>
	<script>
		(function() {
			$(function() {
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
					select : function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
						var title = prompt('Event Title:');
						if (title) {
							calendar.addEvent({
								title : title,
								start : arg.start,
								end : arg.end,
								allDay : arg.allDay
							})
						}
						calendar.unselect()
					},
					// 이벤트 
					events : [ {
						title : 'All Day Event',
						start : '2024-01-10',
						display : 'auto'
					}, {
						title : 'Long Event',
						start : '2024-01-01',
						end : '2024-01-10'
					}, {
						groupId : 999,
						title : 'Repeating Event',
						start : '2021-07-09T16:00:00'
					}, {
						groupId : 999,
						title : 'Repeating Event',
						start : '2021-07-16T16:00:00'
					}, {
						title : 'Conference',
						start : '2021-07-11',
						end : '2021-07-13'
					}, {
						title : 'Meeting',
						start : '2024-01-12T10:30:00',
						end : '2024-01-13T12:30:00'
					}, {
						title : 'Lunch',
						start : '2021-07-12T12:00:00'
					}, {
						title : 'Meeting',
						start : '2021-07-12T14:30:00'
					}, {
						title : 'Happy Hour',
						start : '2024-01-12T17:30:00'
					}, {
						title : 'Dinner',
						start : '2021-07-12T20:00:00'
					}, {
						title : 'Birthday Party',
						start : '2021-07-13T07:00:00'
					}, {
						title : 'Click for Google',
						url : 'http://google.com/', // 클릭시 해당 url로 이동
						start : '2024-01-28'
					} ]
				});
				// 캘린더 랜더링
				calendar.render();
			});
		})();
		document.getElementsByClassName('fc-timeGridWeek-button')[0]
				.addEventListener('click', function() {
					var date = calendar.getDate();
					alert("The current date of the calendar is "
							+ date.toISOString());
				});
	</script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  <script type="text/javascript">
    function getSchedule(){
        return fetch("/schedule/getSchedule")
                        .then(response => response.json());
    }
    window.onload=function(){
    	getSchedule()
                .then(data => {  
                   console.log(data);
                }).catch(console.log);
    };//페이지로딩
        
  </script>
</body>

</html>