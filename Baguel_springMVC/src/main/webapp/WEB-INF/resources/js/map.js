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

window.initMap = function () {
  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.5400456, lng: 126.9921017 },
    zoom: 10,
    styles: [{"featureType":"administrative","elementType":"labels.text","stylers":[{"visibility":"on"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"transit.station.rail","elementType":"all","stylers":[{"visibility":"simplified"},{"saturation":"-100"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"on"}]}]
  });

  
  const pin_gn= [
    { label: "A", name: "롯데월드타워몰", lat: 37.5125585, lng: 127.1025353 },
    { label: "M", name: "명동지하상가", lat: 37.563692, lng: 126.9822107 },
    { label: "T", name: "타임스퀘어", lat: 37.5173108, lng: 126.9033793 },
    { label: "X", name: "이대역", lat: 37.556760, lng: 126.945903 },

  ];
  const pin_rd= [
    { label: "C", name: "코엑스몰", lat: 37.5115557, lng: 127.0595261 },
    { label: "G", name: "고투몰", lat: 37.5062379, lng: 127.0050378 },
    { label: "D", name: "동대문시장", lat: 37.566596, lng: 127.007702 },
    { label: "I", name: "IFC몰", lat: 37.5251644, lng: 126.9255491 },
    { label: "l", name: "서울 시립미술관", lat: 37.564111, lng: 126.973841 },
  ];
  const pin_bl= [
    { label: "Z", name: "경복궁", lat: 37.579821, lng: 126.976917 },
    { label: "J", name: "창경궁", lat: 37.579474, lng: 126.995344 },
    { label: "K", name: "국립중앙박물관", lat: 37.524027, lng: 126.980499 },
    { label: "Q", name: "현대미술관-서울관", lat: 37.578471, lng: 126.980981 },
  ];
  const pin_yl= [
    { label: "Z", name: "이태원역", lat: 37.534481, lng: 126.993913 },
    { label: "J", name: "서울역", lat: 37.554727, lng: 126.970798 },
    { label: "K", name: "용산역", lat: 37.530066, lng: 126.964823 },
    { label: "Q", name: "압구정역", lat: 37.526380, lng: 127.028500 },
    { label: "Q", name: "노량진역", lat: 37.514067, lng: 126.951687 },
  ];
  // lat, lng -> 위도, 경도

  const bounds = new google.maps.LatLngBounds();
  const infowindow = new google.maps.InfoWindow();

  pin_gn.forEach(({ label, name, lat, lng }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label,
      map: map,
      icon: "images/pin_gn.png",
    });
    bounds.extend(marker.position);

    // 핀 클릭시 반응
    marker.addListener("click", () => {
      map.panTo(marker.position);
      infowindow.setContent(name);
      infowindow.open({
        anchor: marker,
        map, 

      });
    });
  });
// ###########################################################################  RED Pin  ################# 
  pin_rd.forEach(({ label, name, lat, lng }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label,
      map: map,
      icon: "images/pin_rd.png",
    });
    bounds.extend(marker.position);

    // 핀 클릭시 반응
    marker.addListener("mouseover", () => {
      infowindow.setContent(name);
      infowindow.open({
        anchor: marker,
        map,
      });
    });
    marker.addListener("mouseout", () => {
      infowindow.close({
        anchor: marker,
        map,
      });
    });

    marker.addListener("click", () => {
      map.panTo(marker.position);
      infowindow.setContent(showPopUp("exhibit_popup.html"));
      infowindow.setContent(name);
      infowindow.open({
        anchor: marker,
        map, 

      });
    });
  });

  pin_bl.forEach(({ label, name, lat, lng }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label,
      map: map,
      icon: "images/pin_bl.png",
    });
    bounds.extend(marker.position);

    // 핀 클릭시 반응
    marker.addListener("click", () => {
      map.panTo(marker.position);
      infowindow.setContent(name);
      infowindow.open({
        anchor: marker,
        map, 

      });
    });
  });
  pin_yl.forEach(({ label, name, lat, lng }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label,
      map: map,
      icon: "images/pin_yl.png",
    });
    bounds.extend(marker.position);

    // 핀 클릭시 반응
    marker.addListener("click", () => {
      map.panTo(marker.position);
      infowindow.setContent(name);
      infowindow.open({
        anchor: marker,
        map, 

      });
    });
  });

  // 마커 표시된 영역으로 자동 줌
  map.fitBounds(bounds);
};
