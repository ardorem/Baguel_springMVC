const comments = document.getElementById("comments");
const addreplybtn = comments.getElementsByClassName("addreplybtn"); // 답글 버튼
const replyBtn = comments.getElementsByClassName("replyBtn"); // 수정하기, 취소 버튼,
																// 카운터
const replyarea = comments.getElementsByClassName("replyarea"); // textarea
const innerReply = comments.getElementsByClassName("innerReply");
const counter = comments.getElementsByClassName("counter");
// ------
const addReply = comments.getElementsByClassName("addReply");
const counterreply = comments.getElementsByClassName("counterreply");
// -------

function showedit(num) { // 수정 버튼을 눌렀을 때
	// innerReply[num].readOnly = false;
	for (i = 0; i < innerReply.length; i++) {
		if (num == i) {
			innerReply[i].readOnly = false;
			replyarea[i].style.border = "1px solid blue";
			replyarea[i].style.outline = "2px solid black";
			addreplybtn[i].style.display = 'none';
			replyBtn[i].style.display = 'block';
		} else {
			innerReply[i].readOnly = true;
			replyarea[i].style.border = "none";
			replyarea[i].style.outline = "none";
			addreplybtn[i].style.display = 'block';
			replyBtn[i].style.display = 'none';
		}
	}
	for (i = 0; i < addReply.length; i++) {
		addReply[j].style.display = 'none';
	}
}
// ***************************** 답글 창 보여주기
function show_reply(num) {
	for (i = 0; i < addReply.length; i++) {
		if (num == i) {
			addReply[i].style.display = 'block';
		} else {
			addReply[i].style.display = 'none';
		}
	}
}

// ***************************** 댓글 수정 중 취소를 눌렀을 때
function cancelEdit() {
	window.location.reload();
}

// ***************************** 댓글 수정창 카운터
function countComment(text, num) {
	let countNum = text.length;
	if (countNum <= 500) {
		counter[num].style.color = "white";
		counter[num].innerHTML = countNum;
		eventDescOk = true;
	} else {
		counter[num].style.color = "red";
		counter[num].innerHTML = "501";
		eventDescOk = false;
	}
	console.log(text.length);
}

// ***************************** 답글창 카운터
function count_reply(text, num) {
	let countNum = text.length;
	if (countNum <= 500) {
		counterreply[num].style.color = "white";
		counterreply[num].innerHTML = countNum;
		eventDescOk = true;
	} else {
		counterreply[num].style.color = "red";
		counterreply[num].innerHTML = "501";
		eventDescOk = false;
	}
	console.log(text.length);
}

// *************************** 최하단 댓글창 카운터
const counterBottom = document.getElementById("counterBottom");
function counterLast(text) {
	let countNum = text.length;
	if (countNum <= 500) {
		counterBottom.style.color = "white";
		counterBottom.innerHTML = countNum;
		eventDescOk = true;
	} else {
		counterBottom.style.color = "red";
		counterBottom.innerHTML = "501";
		eventDescOk = false;
	}
	console.log(text.length);
}
window.onload = function() {
	let tar = document.getElementsByTagName('textarea');
	for (var i = 0; i < tar.length; i++) {
		tar[i].style.height = '1px';
		tar[i].style.height = (12 + tar[i].scrollHeight) + 'px';
	}
}
window.onresize = function() {
	let tar = document.getElementsByTagName('textarea');
	for (var i = 0; i < tar.length; i++) {
		tar[i].style.height = '1px';
		tar[i].style.height = (12 + tar[i].scrollHeight) + 'px';
	}
}