var eventDescOk = true;

function countTxt(text) {
  const counter = document.getElementById("counter");
  let countNum = text.length;
  if (countNum <= 400) {
    counter.style.color = "black";
    counter.innerHTML = countNum;
    eventDescOk = true;
  } else {
    counter.style.color = "red";
    counter.innerHTML = "401";
    eventDescOk = false;
  }
  console.log(text.length);
}

function addEventConfirm() {
  if (document.event_frm.eventFrom.value == 0) {
    alert("시작날짜를 입력해 주세요");
    event_frm.eventFrom.focus();
    return;
  }
  if (document.event_frm.eventTo.value == 0) {
    alert("종료날짜를 입력해 주세요");
    event_frm.eventTo.focus();
    return;
  }
  if (document.event_frm.eventFrom.value > document.event_frm.eventTo.value) {
  	alert("시작날짜가 종료날짜보다 큽니다.");
  	event_frm.eventTo.focus();
  	return;
  }

  if (document.event_frm.eventPlace.value == 0) {
    alert("장소를 입력해 주세요");
    event_frm.eventPlace.focus();
    return;
  }
  if (document.event_frm.eventPlace.value.length > 20) {
    alert("장소는 20자를 넘지 않게 입력 해주세요");
    event_frm.event.focus();
    return;
  }

  var selected = document.getElementById('eventType');
  if (selected.options[selected.selectedIndex].value == "none"){
    alert("일정 종류를 선택해 주세요");
    event_frm.eventType.focus();
    return;
  }
  if (document.event_frm.event.value == 0) {
    alert("일정 이름을 입력해 주세요");
    event_frm.event.focus();
    return;
  }
  if (document.event_frm.event.value.length > 100) {
    alert("일정 이름은 100자를 넘지 않게 입력 해주세요");
    event_frm.event.focus();
    return;
  }
  if (!eventDescOk) {
    alert("간단한 설명은 400자를 넘지 않게 입력 해주세요");
    event_frm.event.focus();
    return;
  }
  document.event_frm.submit();
}
