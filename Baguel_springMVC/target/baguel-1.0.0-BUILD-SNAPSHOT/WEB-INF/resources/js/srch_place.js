function placeSrchConfirm() {
  let placeSrchFrm = document.getElementById('placeSrchFrm');
  let selected1 = document.getElementById('daySelect');
  let selected2 = document.getElementById('placeSelect');

  if (selected1.options[selected1.selectedIndex].value == "none") {
    alert("조회할 날짜를 선택해 주세요");
    placeSrchFrm.daySelect.focus();
    return;
  }

  if (selected2.options[selected2.selectedIndex].value == "none") {
    alert("조회할 장소를 선택해 주세요");
    placeSrchFrm.placeSelect.focus();
    return;
  }
  placeSrchFrm.submit();
}