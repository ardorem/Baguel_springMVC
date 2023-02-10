// Google map init
window.initMap = function () {
  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.5400456, lng: 126.9921017 },
    zoom: 10,
    styles: [{ "featureType": "administrative", "elementType": "labels.text", "stylers": [{ "visibility": "on" }] }, { "featureType": "poi", "elementType": "all", "stylers": [{ "visibility": "off" }] }, { "featureType": "transit.station.rail", "elementType": "all", "stylers": [{ "visibility": "simplified" }, { "saturation": "-100" }] }, { "featureType": "water", "elementType": "all", "stylers": [{ "visibility": "on" }] }]
  });

  const bounds = new google.maps.LatLngBounds();
  const infowindow = new google.maps.InfoWindow();

  // ###########################################################################  Sub Pin  ################# 
  pin_line1.forEach(({ line, lineNo, stationNo, stationName, lat, lng, err, url }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label: { text: lineNo, color: "white" },
      map: map,
      icon: "images/pin-line1.png",
    });
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>'+ stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
     + '<p>🚶예측 혼잡률 : <span class="emphasis">' + err + '</span>%</p>';
    marker.addListener("mouseover", () => {
      infowindow.setContent(msg);
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
      location.href = url;
    });
  });

  pin_line2.forEach(({ line, lineNo, stationNo, stationName, lat, lng, err, url }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label: { text: lineNo, color: "white" },
      map: map,
      icon: "images/pin-line2.png",
    });
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>'+ stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
     + '<p>🚶예측 혼잡률 : <span class="emphasis">' + err + '</span>%</p>';
    marker.addListener("mouseover", () => {
      infowindow.setContent(msg);
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
      location.href = url;
    });
  });

  pin_line3.forEach(({ line, lineNo, stationNo, stationName, lat, lng, err, url }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label: { text: lineNo, color: "white" },
      map: map,
      icon: "images/pin-line3.png",
    });
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>'+ stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
     + '<p>🚶예측 혼잡률 : <span class="emphasis">' + err + '</span>%</p>';
    marker.addListener("mouseover", () => {
      infowindow.setContent(msg);
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
      location.href = url;
    });
  });

  pin_line4.forEach(({ line, lineNo, stationNo, stationName, lat, lng, err, url }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label: { text: lineNo, color: "white" },
      map: map,
      icon: "images/pin-line4.png",
    });
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>'+ stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
     + '<p>🚶예측 혼잡률 : <span class="emphasis">' + err + '</span>%</p>';
    marker.addListener("mouseover", () => {
      infowindow.setContent(msg);
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
      location.href = url;
    });
  });

  pin_line5.forEach(({ line, lineNo, stationNo, stationName, lat, lng, err, url }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label: { text: lineNo, color: "white" },
      map: map,
      icon: "images/pin-line5.png",
    });
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>'+ stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
     + '<p>🚶예측 혼잡률 : <span class="emphasis">' + err + '</span>%</p>';
    marker.addListener("mouseover", () => {
      infowindow.setContent(msg);
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
      location.href = url;
    });
  });

  pin_line6.forEach(({ line, lineNo, stationNo, stationName, lat, lng, err, url }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label: { text: lineNo, color: "white" },
      map: map,
      icon: "images/pin-line6.png",
    });
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>'+ stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
     + '<p>🚶예측 혼잡률 : <span class="emphasis">' + err + '</span>%</p>';
    marker.addListener("mouseover", () => {
      infowindow.setContent(msg);
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
      location.href = url;
    });
  });

  pin_line7.forEach(({ line, lineNo, stationNo, stationName, lat, lng, err, url }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label: { text: lineNo, color: "white" },
      map: map,
      icon: "images/pin-line7.png",
    });
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>'+ stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
     + '<p>🚶예측 혼잡률 : <span class="emphasis">' + err + '</span>%</p>';
    marker.addListener("mouseover", () => {
      infowindow.setContent(msg);
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
      location.href = url;
    });
  });

  pin_line8.forEach(({ line, lineNo, stationNo, stationName, lat, lng, err, url }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label: { text: lineNo, color: "white" },
      map: map,
      icon: "images/pin-line8.png",
    });
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>'+ stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
     + '<p>🚶예측 혼잡률 : <span class="emphasis">' + err + '</span>%</p>';
    marker.addListener("mouseover", () => {
      infowindow.setContent(msg);
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
      location.href = url;
    });
  });
  // ###########################################################################  Sub Pin  ################# 

  // ###########################################################################  Place Pin  ################# 
  pin_place.forEach(({ label, placeName, lat, lng, tmp, pcp, visitors, url }) => {
    const marker = new google.maps.Marker({
      position: { lat, lng },
      label: { text: label, color: "white" },
      map: map,
      icon: "images/pin-place.png",
    });
    bounds.extend(marker.position);
    
    let msg = '<h3>' + placeName + '</h3>' + '<br>'
     + '<p>🚶예측 관람객 : <span class="emphasis">' + visitors + '</span>명</p>'
     + '<p>🌡️예상기온 : ' + tmp + '°C</p>'
     + '<p>🌧️예상 강수량 : ' + pcp + 'mm</p>';
     // 핀 클릭시 반응
     marker.addListener("mouseover", () => {
       infowindow.setContent(msg);
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
        // map.panTo(marker.position);
        location.href = url;
      });
    });
  // ###########################################################################  Place Pin  ################# 

  // 초기 화면에서 마커 표시된 영역 기준으로 자동 줌
  map.fitBounds(bounds);
};