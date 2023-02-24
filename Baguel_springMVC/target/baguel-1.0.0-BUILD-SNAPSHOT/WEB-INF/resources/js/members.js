let idOk = false;
let pwOk = false;
let nameOk = false;
let emailOk = false;
let nickNameOk = false;
const CORRECT_COLOR = "blue";
const WRONG_COLOR = "red";

// *********************************************************** caps lock check
function checkCapsLock(event) {
  if (event.getModifierState("CapsLock")) {
    document.getElementById("msgCapslock").innerHTML = "<p style='box-shadow: inset 0 -0.5em 0 #FEE715;'>Caps Lock이 켜져 있습니다.</p>"
  } else {
    document.getElementById("msgCapslock").innerHTML = "<p style='color: grey;'>Caps Lock이 꺼져 있습니다.</p>";
  }
}
// *********************************************************** caps lock check fin.

// *************************************************************** ID check
function checkId(id) {

  const msgId = document.getElementById("msgId");
  //아이디 영소문자+숫자 (4~16자리 입력) 정규식
  const idRegExp = /^(?=.*[a-z])(?=.*[0-9])[a-z0-9]{4,16}$/;
  
  if (idRegExp.test(id)) {
    msgId.style.color = CORRECT_COLOR;
    msgId.innerHTML = "사용 가능한 아이디 입니다. ✔";
    idOk = true;
  } else {
    msgId.style.color = WRONG_COLOR;
    msgId.innerHTML = "사용 불가한 아이디 입니다.";
    idOk = false;
  }
}
// *************************************************************** ID check fin.

// **************************************************** PW + caps lock check
function checkPw(pw, event) {
  // pw check
  const msgPw = document.getElementById("msgPw");
  //비밀번호 영소문자+영대문자+숫자+특수조합(8~16자리 입력) 정규식
  const pwRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9])[a-zA-Z0-9!@#$%^*+=-]{8,16}$/;
  
  if (pwRegExp.test(pw)) {
    msgPw.style.color = CORRECT_COLOR;
    msgPw.innerHTML = "비밀번호 형식에 맞습니다. ✔";
    pwOk = true;
  } else {
    msgPw.style.color = WRONG_COLOR;
    msgPw.innerHTML = "비밀번호 형식에 맞지 않습니다.";
    pwOk = false;
  }

  // capslock check
//  if (event.getModifierState("CapsLock")) {
//    document.getElementById("msgCapslock").innerHTML = "<p style='box-shadow: inset 0 -0.5em 0 #FEE715;'>Caps Lock이 켜져 있습니다.</p>"
//  } else {
//    document.getElementById("msgCapslock").innerText
//      = ""
//  }
  checkCapsLock(event);
}
// **************************************************** PW + caps lock check fin.

//*************************************************************** name check
function checkName(name) {
  const msgName = document.getElementById("msgName");
  //이름 영소문자+영대문자+한글(1~15) 정규식
  // const nameRegExp = /^[가-힣]{2,4}|[a-zA-Z]{2,20}\s[a-zA-Z]{2,20}$/; // -> error
  //이름 한글(2~5) 정규식
  const nameRegExp = /^[가-힣]{2,5}$/;
  
  if (nameRegExp.test(name)) {
    msgName.style.color = CORRECT_COLOR;
    msgName.innerHTML = "사용 가능한 이름 입니다. ✔";
    nameOk = true;
  } else {
    msgName.style.color = WRONG_COLOR;
    msgName.innerHTML = "사용 불가한 이름 입니다.";
    nameOk = false;
  }
}
// *************************************************************** name check fin.

// *************************************************************** email check
function checkEmail(userMail) {
  const msgEmail = document.getElementById("msgEmail");
  //이메일 정규식
  const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

  if (emailRegExp.test(userMail)) {
    msgEmail.style.color = CORRECT_COLOR;
    msgEmail.innerHTML = "사용 가능한 이메일 입니다. ✔";
    emailOk = true;
  } else {
    msgEmail.style.color = WRONG_COLOR;
    msgEmail.innerHTML = "이메일을 확인해주세요.";
    emailOk = false;
  }
}
// *************************************************************** email check fin.

// *************************************************************** email check
function checkNickName(userNick) {
  const msgNickName = document.getElementById("msgNickName");
  //닉네임 영문 대문자/소문자/숫자 사용가능, 2~16자
  const nickNameRegExp = /[a-zA-Z0-9]{2,16}$/;

  if (nickNameRegExp.test(userNick)) {
    msgNickName.style.color = CORRECT_COLOR;
    msgNickName.innerHTML = "사용 가능한 닉네임 입니다. ✔";
    nickNameOk = true;
  } else {
    msgNickName.style.color = WRONG_COLOR;
    msgNickName.innerHTML = "사용할 수 없는 닉네임 입니다.";
    nickNameOk = false;
  }
}
// *************************************************************** email check fin.

function infoConfirm() {
	if (document.reg_frm.userId.value.length == 0) {
		alert("아이디는 필수사항입니다.");
		reg_frm.userId.focus();
		return;
	}
	if(! idOk) {
		alert("아이디를 다시 확인 해주세요");
		reg_frm.userId.focus();
		return;
	}
	
// ***************************************************************  ID 관련 끝
	if (document.reg_frm.userPw.value.length == 0) {
		alert("비밀번호는 필수사항 입니다.");
		reg_frm.userPw.focus();
		return;
	}
	if (document.reg_frm.userPw.value != document.reg_frm.userPw_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.userPw.focus();
		return;
	}
	if(! pwOk) {
		alert("비밀번호를 다시 확인 해주세요");
		reg_frm.userPw.focus();
		return;
	}
// ***************************************************************  password 관련 끝

	
	if (document.reg_frm.userName.value.length == 0) {
		reg_frm.userName.focus();
		alert("이름은 필수사항 입니다.");
		return;
	}
	if(! nameOk) {
		alert("이름을 다시 확인 해주세요");
		reg_frm.userName.focus();
		return;
	}
// ***************************************************************  name 관련 끝
	
	if (document.reg_frm.userMail.value.length == 0) {
		alert("메일은 필수사항 입니다.");
		reg_frm.userMail.focus();
		return;
	}
	if(! emailOk) {
		alert("메일을 다시 확인 해주세요");
		reg_frm.userMail.focus();
		return;
	}
// ***************************************************************  email 관련 끝
	
	if (document.reg_frm.userNick.value.length == 0) {
		reg_frm.userNick.focus();
		alert("닉네임은 필수사항 입니다.");
		return;
	}
	if(! nickNameOk) {
		alert("닉네임을 다시 확인 해주세요");
		reg_frm.userNick.focus();
		return;
	}
// ***************************************************************  nickname 관련 끝
	document.reg_frm.submit(); // 위의 모든것을 만족하면 submit

}

function updateInfoConfirm() {
	if (document.reg_frm.userPw.value.length == 0) {
		alert("비밀번호는 필수사항 입니다.");
		reg_frm.userPw.focus();
		return;
	}
	if (document.reg_frm.userPw.value != document.reg_frm.userPw_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.userPw.focus();
		return;
	}
	if(! pwOk) {
		alert("비밀번호를 다시 확인 해주세요");
		reg_frm.userPw.focus();
		return;
	}
// ***************************************************************  password 관련 끝
	
	
	if (document.reg_frm.userName.value.length == 0) {
		reg_frm.userName.focus();
		alert("이름은 필수사항 입니다.");
		return;
	}
	if(! nameOk) {
		alert("이름을 다시 확인 해주세요");
		reg_frm.userName.focus();
		return;
	}
// ***************************************************************  name 관련 끝
	
	if (document.reg_frm.userMail.value.length == 0) {
		alert("메일은 필수사항 입니다.");
		reg_frm.userMail.focus();
		return;
	}
	if(! emailOk) {
		alert("메일을 다시 확인 해주세요");
		reg_frm.userMail.focus();
		return;
	}
// ***************************************************************  email 관련 끝
	
	if (document.reg_frm.userNick.value.length == 0) {
		reg_frm.userNick.focus();
		alert("닉네임은 필수사항 입니다.");
		return;
	}
	if(! nickNameOk) {
		alert("닉네임을 다시 확인 해주세요");
		reg_frm.userNick.focus();
		return;
	}
// ***************************************************************  nickname 관련 끝
	document.reg_frm.submit(); // 위의 모든것을 만족하면 submit
	
}

function findIdConfirm() {
	if (document.found_id.userName.value.length == 0) {
		found_id.userName.focus();
		alert("이름은 필수사항 입니다.");
		return;
	}
	if(! nameOk) {
		alert("이름을 다시 확인 해주세요");
		found_id.userName.focus();
		return;
	}
// ***************************************************************  name 관련 끝
	
	if (document.found_id.userMail.value.length == 0) {
		alert("메일은 필수사항 입니다.");
		found_id.userMail.focus();
		return;
	}
	if(! emailOk) {
		alert("메일을 다시 확인 해주세요");
		found_id.userMail.focus();
		return;
	}
// ***************************************************************  email 관련 끝
	document.found_id.submit(); // 위의 모든것을 만족하면 submit
	
}

function resetPwConfirm() {
	if (document.found_pw.userId.value.length == 0) {
		alert("아이디는 필수사항입니다.");
		found_pw.userId.focus();
		return;
	}
	if(! idOk) {
		alert("아이디를 다시 확인 해주세요");
		found_pw.userId.focus();
		return;
	}
	
// ***************************************************************  ID 관련 끝
	if (document.found_pw.userName.value.length == 0) {
		found_pw.userName.focus();
		alert("이름은 필수사항 입니다.");
		return;
	}
	if(! nameOk) {
		alert("이름을 다시 확인 해주세요");
		found_pw.userName.focus();
		return;
	}
// ***************************************************************  name 관련 끝
	
	if (document.found_pw.userMail.value.length == 0) {
		alert("메일은 필수사항 입니다.");
		found_pw.userMail.focus();
		return;
	}
	if(! emailOk) {
		alert("메일을 다시 확인 해주세요");
		found_pw.userMail.focus();
		return;
	}
// ***************************************************************  email 관련 끝
	document.found_pw.submit(); // 위의 모든것을 만족하면 submit
	
}

function deactive() {
	//함수명 deactivate로 명명시 작동하지 않음
	if (window.confirm("회원 탈퇴 하시겠습니까? 1/2")) {
		if (window.confirm("정말 회원 탈퇴 하시겠습니까? 2/2 \n 🚨 확인을 누르시면 취소할 수 없습니다 🚨")) {
			location.href="deactive";
      }
	}
}
