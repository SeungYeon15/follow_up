<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Music</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/musicStyles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
<style>
@font-face {
	font-family: 'Rubik';
	font-style: normal;
	font-weight: 300;
	src:
		url(https://fonts.gstatic.com/s/rubik/v28/iJWZBXyIfDnIV5PNhY1KTN7Z-Yh-WYiFV0Uw.ttf)
		format('truetype');
}

@font-face {
	font-family: 'Rubik';
	font-style: normal;
	font-weight: 700;
	src:
		url(https://fonts.gstatic.com/s/rubik/v28/iJWZBXyIfDnIV5PNhY1KTN7Z-Yh-4I-FV0Uw.ttf)
		format('truetype');
}

* {
	box-sizing: border-box;
	transition: 0.5s;
}

body {
	background: #FBFBFB;
	color: #45494e;
	font-family: "Rubik", "Montserrat", sans-serif;
	font-weight: 300;
	margin: 0;
	padding: 7.5px;
	width: 100%;
	background-image:
		url(/images/5005082-dua-lipa-music-celebrities-girls-hd-4k-5k.jpg);
	height: 100vh;
	width: 100vw;
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
}

h2 {
	font-weight: 700;
}
h4 {
	font-weight: 700;
}

#modal-image {
	display: inline-block;
	vertical-align: top;
}

#modal-list {
	margin-left: 3em;
	margin-top: 10px; display : inline-block;
	align-items: center;
	display: inline-block
}
</style>
</head>
<body>
	<div id="costumModal16" class="modal fade bd-example-modal-xl"
		data-easein="slideUpIn" tabindex="-1" role="dialog"
		aria-labelledby="costumModalLabel" aria-hidden="true" style="">
		<div class="modal-dialog modal-xl"
			style="max-width: 50%; width: 100%;">
			<div class="modal-content pt-3">
				<div class="modal-header">
					<h4 class="modal-title">Club Future Nostalgia</h4>
				</div>
				<div class="modal-body" style="align-items: center;">
					<div id="modal-image">
						<img src="/images/album/Cool.jpg" alt=""
							style="width: 100%; max-width: 500px;">
					</div>
					<div id="modal-list"></div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal"
						aria-hidden="true">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div id="app">
		<ul id="albums">
			<c:forEach var="i" begin="0" end="${fn:length(albumList) }">
				<%-- 		<p>${ albumList[i]}</p> --%>
				<c:if test="${not empty albumList[i].albumTitle }">
					<li class="album type${i%4+1} " id="album${albumList[i].albumId }"
						value=${i }>
						<figure>
							<img src="/images/album/${ albumList[i].albumImage}"
								alt="${albumList[i].albumTitle }">
							<figcaption>
								<h2>
									${albumList[i].albumTitle }<span class="release-year">[${ albumList[i].albumDate}]</span>
								</h2>
							</figcaption>
						</figure>
					</li>
				</c:if>
			</c:forEach>

			<!-- 		

			<!-- <album-item v-for="(album, index) in albums" v-bind:album="album" v-bind:key="index"></album-item> -->
		</ul>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	function getMusicList(id){
		var d = document.getElementById('modal-list');
		d.innerHTML="";
		d.insertAdjacentHTML('afterbegin','<ul id="musiclist">');
		return fetch('/music/getMusicList/'+id)
		.then(response => response.json())
		.then(data => data.forEach(item=>{
			d.insertAdjacentHTML('afterbegin','<li style="margin-bottom: 10px; /* 각 li 요소 사이의 간격 조정 */display: flex; /* 내부 텍스트를 수직 정렬하기 위해 flex 속성 추가 */align-items: center; /* 수직 정렬 기준을 가운데로 설정 */"><a href= '+item.musicLink+' rel="noopener" target="_blank">'+item.musicTitle+'</a></li>');
		}))
		d.insertAdjacentHTML('afterbegin','</ul>');
		;
	}

	$(document).ready(function() {
		// div를 클릭하면 모달 보이기
		$('.album').on('click', function() {
		    var id_check = $(this).attr("id");
		    var num = $('#'+id_check).val();
		    console.log(id_check);

            var imgSrc = $(this).find('img').attr('src');
            console.log('Clicked Image Source:', imgSrc);
            var h2Text = $(this).find('h2').text();
            console.log('Clicked h2 Text:', h2Text);
            
    		var d = document.getElementById('modal-image');
    		d.innerHTML="<img src='"+imgSrc+"' alt='' style='width: 100%; max-width: 500px;'>";

			document.getElementsByClassName('modal-header')[0].innerHTML='<h4 class="modal-title">'+h2Text.split("[")[0]+'</h4>';
//			    console.log(id_check.split("album")[1]);
		    getMusicList(id_check.split("album")[1]);
			$('#costumModal16').modal('show');
		});
	});
	</script>
	<!-- partial -->
	<!-- <script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.17-beta.0/vue.js'></script><script  src="./script.js"></script> -->
	<script type="text/javascript">
		$(".modal").each(
				function(l) {
					$(this).on(
							"show.bs.modal",
							function(l) {
								var o = $(this).attr("data-easein");
								"shake" == o ? $(".modal-dialog").velocity(
										"callout." + o) : "pulse" == o ? $(
										".modal-dialog").velocity(
										"callout." + o) : "tada" == o ? $(
										".modal-dialog").velocity(
										"callout." + o) : "flash" == o ? $(
										".modal-dialog").velocity(
										"callout." + o) : "bounce" == o ? $(
										".modal-dialog").velocity(
										"callout." + o) : "swing" == o ? $(
										".modal-dialog").velocity(
										"callout." + o) : $(".modal-dialog")
										.velocity("transition." + o)
							})
				});
	</script>
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.2/velocity.min.js'></script>
</body>
</html>
