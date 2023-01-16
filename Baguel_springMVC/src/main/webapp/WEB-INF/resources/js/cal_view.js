function showPopUp(a) {
  console.log(a);
  //창 크기 지정
  var width = 750;
  var height = 400;

  //pc화면기준 가운데 정렬
  var left = (window.screen.width / 2) - (width / 2);
  var top = (window.screen.height / 4);

  //윈도우 속성 지정
  var windowStatus = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=yes, status=no, resizable=yes, titlebar=no';
  // scrollbars = yes -> 팝업창에서의 스크롤을 사용하겠다.
  // status = yes -> 상태 표시줄의 내용 지정
  // resizable = yes -> 팝업창 크기 조정 가능 여부
  // titlebar = yes -> 타이틀바를 보여줄지 여부

  //연결하고싶은url
  const url = a;

  //등록된 url 및 window 속성 기준으로 팝업창을 연다.
  window.open(url, "hello popup", windowStatus);
}

var eventWrite;
document.addEventListener('DOMContentLoaded', function () {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,listMonth'
    },
    locale: "ko",
    initialView: 'dayGridMonth',
    editable: true,
    selectable: true,
    events: [
      {
        title: '(국립중앙박물관)합스부르크 600년, 매혹의 걸작들 - 빈미술사박물관 특별전',
        start: '2022-10-15',
        end: '2022-11-02',
        constraint: 'businessHours',
        color: 'black'
      },
      {
        title: '(서울 시립미술관)키키 스미스 ― 자유낙하전',
        start: '2022-11-22',
        end: '2022-12-02',
        constraint: 'businessHours',
        color: 'blue'
      },
      {
        start: '2022-11-22',
        end: '2022-11-25',
        overlap: false,
        display: 'background',
        color: 'yellow'
      },
    ]
  });
  calendar.render();
  //******************************************** 클릭 이벤트 start
  calendar.on('eventClick', function (info) {
    showPopUp("exhibit_popup.html");
  }); //이벤트 클릭

  calendar.on('dateClick', function (info) {
    console.log('clicked on ' + info.dateStr);
    // alert("날짜 칸에 클릭");
    eventWrite = confirm(info.dateStr + "에 이벤트를 등록 하시겠어요?");
    if (eventWrite) {
      window.location.href = 'cal_add.html';
    }
  }); //
  //******************************************** 클릭 이벤트 start
});