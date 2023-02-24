function toggleBtn1() {
  
  // 토글 할 버튼 선택 (btn1)
  const more = document.getElementById('more_place');
  
  // 추가 그래프 숨기기 (display: none)
  if(more.style.display == 'none') {
    more.style.display = 'block';
  }
  // btn` 보이기 (display: block)
  else {
    more.style.display = 'none';
  }
  
}
