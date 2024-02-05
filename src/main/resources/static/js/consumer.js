$(function() { //페이지 로딩
	showList();
	showPage();
})

let replyUL = $(".card-body");
let replyPageFooter = $(".card-footer");

function showList() {
	/*댓글 목록 비동기 통신 요청*/
	getList({ bnum: bnum, sno: sno, eno: eno })
		.then(list => {
			let str = "";

			for (var i = 0; i < list.length; i++) {
				str += "<ul class='list-group'>";
				str += "<li class='list-group-item' data-userId='" + list[i].userId + "' data-rnum='" + list[i].rnum + "'>";
				str += "<strong class='float-start'>" + list[i].userId + "</strong>";
				str += "<small class='float-end'>" + list[i].rdate + "</small><br><p>";
				str += replaceAll(list[i].rcontent, '\n', '<br>') + "</p></li></ul>";
			}

			replyUL.html(str);

		});

}

function replaceAll(str, searchStr, replaceStr) {
	return str.split(searchStr).join(replaceStr);
}


let param = '';
param = "nPage=" + nPage;
param += "&nowPage=" + nowPage;
param += "&bnum=" + bnum;
param += "&col=" + colx;
param += "&word=" + wordx;

function showPage() {
	getPage(param)
		.then(paging => {
			let str = "<div><small class='text-muted'>" + paging + "</small></div>";

			replyPageFooter.html(str);
		});
}


let modal = $(".modal");
let modalInputContent = modal.find("textarea[name='rcontent']");
let modalModBtn = $("#modalModBtn");
let modalRemoveBtn = $("#modalRemoveBtn");
let modalRegisterBtn = $("#modalRegisterBtn");

$("#addReplyBtn").on('click', function(e) {
	
	modalInputContent.val("");

	modal.find("button[id !='modalCloseBtn']").hide();

	modalRegisterBtn.show();

	modal.modal("show");
	/*modal.show();*/

});

modalRegisterBtn.on('click', function(e) {
	if (modalInputContent.val() == '') {
		alert("Write it down here")
		modalInputContent.focus();
		return;
	}

	let reply = {
		rcontent: modalInputContent.val(),
		userId: userId,
		bnum: bnum
	};
	add(reply)
		.then(result => {
			modalInputContent.val('');
			modal.modal("hide");


			showList();
			showPage();

		});

});

//댓글 조회
$(".chat").on("click", "li", function(e) {
	let rnum = $(this).data("rnum");

	let lid = $(this).data("userid");
	console.log("lid: " + lid);
	console.log("loginId: " + loginId);

	get(rnum)
		.then(reply => {
			modalInputContent.val(reply.rcontent);
			modal.data("rnum", reply.rnum);
			modal.find("button[id !='modalCloseBtn']").hide();

			if (loginId == lid) {
				modalModBtn.show();
				modalRemoveBtn.show();
			}

			modal.modal("show");
		});
});

//댓글 수정
modalModBtn.on("click", function(e) {
	let reply = { rnum: modal.data("rnum"), rcontent: modalInputContent.val() };
	update(reply)
		.then(result => {
			modal.modal("hide");
			showList();
			showPage();
		});
});

//댓글 삭제
modalRemoveBtn.on("click", function(e) {
	let rnum = modal.data("rnum");
	if (confirm("삭제하시겠습니까?")) {
		remove(rnum)
			.then(result => {
				modal.modal("hide");
				showList();
				showPage();
			});
	}
	else {

	}
});
