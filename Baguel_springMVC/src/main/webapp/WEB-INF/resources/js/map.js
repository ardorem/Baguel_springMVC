// Google map init
let map;
let line1Markers = [];
let line2Markers = [];
let line3Markers = [];
let line4Markers = [];
let line5Markers = [];
let line6Markers = [];
let line7Markers = [];
let line8Markers = [];
let placeMarkers = [];

window.initMap = function () {
  map = new google.maps.Map(document.getElementById("map"), {
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
    line1Markers.push(marker);
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
      + '<h3>' + stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
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
    line2Markers.push(marker);
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
      + '<h3>' + stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
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
    line3Markers.push(marker);
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>' + stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
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
    line4Markers.push(marker);
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>' + stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
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
    line5Markers.push(marker);
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>' + stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
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
    line6Markers.push(marker);
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>' + stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
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
    line7Markers.push(marker);
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>' + stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
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
    line8Markers.push(marker);
    bounds.extend(marker.position);

    let msg = '<h5>🚇' + line + '</h5>'
    + '<h3>' + stationName + '역 (' + stationNo + ')' + '</h3>' + '<br>'
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
    placeMarkers.push(marker);
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


  // ############## add Event Listeners
  document
    .getElementById("show-line1-markers")
    .addEventListener("click", showLine1Markers);
  document
    .getElementById("hide-line1-markers")
    .addEventListener("click", hideLine1Markers); // line1

  document
    .getElementById("show-line2-markers")
    .addEventListener("click", showLine2Markers);
  document
    .getElementById("hide-line2-markers")
    .addEventListener("click", hideLine2Markers); // line2

  document
    .getElementById("show-line3-markers")
    .addEventListener("click", showLine3Markers);
  document
    .getElementById("hide-line3-markers")
    .addEventListener("click", hideLine3Markers); // line3

  document
    .getElementById("show-line4-markers")
    .addEventListener("click", showLine4Markers);
  document
    .getElementById("hide-line4-markers")
    .addEventListener("click", hideLine4Markers); // line4

  document
    .getElementById("show-line5-markers")
    .addEventListener("click", showLine5Markers);
  document
    .getElementById("hide-line5-markers")
    .addEventListener("click", hideLine5Markers); // line5

  document
    .getElementById("show-line6-markers")
    .addEventListener("click", showLine6Markers);
  document
    .getElementById("hide-line6-markers")
    .addEventListener("click", hideLine6Markers); // line6

  document
    .getElementById("show-line7-markers")
    .addEventListener("click", showLine7Markers);
  document
    .getElementById("hide-line7-markers")
    .addEventListener("click", hideLine7Markers); // line7

  document
    .getElementById("show-line8-markers")
    .addEventListener("click", showLine8Markers);
  document
    .getElementById("hide-line8-markers")
    .addEventListener("click", hideLine8Markers); // line8

  document
    .getElementById("show-place-markers")
    .addEventListener("click", showPlaceMarkers);
  document
    .getElementById("hide-place-markers")
    .addEventListener("click", hidePlaceMarkers); // place

  document
    .getElementById("show-all-markers")
    .addEventListener("click", showAllMarkers);
  document
    .getElementById("hide-all-markers")
    .addEventListener("click", hideAllMarkers); // all


  // 초기 화면에서 마커 표시된 영역 기준으로 자동 줌
  map.fitBounds(bounds);
};

// ######################################################### line1
// Sets the map on all Markers in the array. -- line1
function setMapOnAllLine1(map) {
  for (let i = 0; i < line1Markers.length; i++) {
    line1Markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array. -- line1
function hideLine1Markers() {
  setMapOnAllLine1(null);
}

// Shows any markers currently in the array. -- line1
function showLine1Markers() {
  setMapOnAllLine1(map);
}

// ######################################################### line2
// Sets the map on all Markers in the array. -- line2
function setMapOnAllLine2(map) {
  for (let i = 0; i < line2Markers.length; i++) {
    line2Markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array. -- line2 
function hideLine2Markers() {
  setMapOnAllLine2(null);
}

// Shows any markers currently in the array. -- line2 
function showLine2Markers() {
  setMapOnAllLine2(map);
}

// ######################################################### line3
// Sets the map on all Markers in the array. -- line3
function setMapOnAllLine3(map) {
  for (let i = 0; i < line3Markers.length; i++) {
    line3Markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array. -- line3 
function hideLine3Markers() {
  setMapOnAllLine3(null);
}

// Shows any markers currently in the array. -- line3 
function showLine3Markers() {
  setMapOnAllLine3(map);
}

// ######################################################### line4
// Sets the map on all Markers in the array. -- line4
function setMapOnAllLine4(map) {
  for (let i = 0; i < line4Markers.length; i++) {
    line4Markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array. -- line4 
function hideLine4Markers() {
  setMapOnAllLine4(null);
}

// Shows any markers currently in the array. -- line4 
function showLine4Markers() {
  setMapOnAllLine4(map);
}

// ######################################################### line5
// Sets the map on all Markers in the array. -- line5
function setMapOnAllLine5(map) {
  for (let i = 0; i < line5Markers.length; i++) {
    line5Markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array. -- line5 
function hideLine5Markers() {
  setMapOnAllLine5(null);
}

// Shows any markers currently in the array. -- line5 
function showLine5Markers() {
  setMapOnAllLine5(map);
}

// ######################################################### line6
// Sets the map on all Markers in the array. -- line6
function setMapOnAllLine6(map) {
  for (let i = 0; i < line6Markers.length; i++) {
    line6Markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array. -- line6 
function hideLine6Markers() {
  setMapOnAllLine6(null);
}

// Shows any markers currently in the array. -- line6 
function showLine6Markers() {
  setMapOnAllLine6(map);
}

// ######################################################### line7
// Sets the map on all Markers in the array. -- line7
function setMapOnAllLine7(map) {
  for (let i = 0; i < line7Markers.length; i++) {
    line7Markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array. -- line7 
function hideLine7Markers() {
  setMapOnAllLine7(null);
}

// Shows any markers currently in the array. -- line7 
function showLine7Markers() {
  setMapOnAllLine7(map);
}

// ######################################################### line8
// Sets the map on all Markers in the array. -- line8
function setMapOnAllLine8(map) {
  for (let i = 0; i < line8Markers.length; i++) {
    line8Markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array. -- line8 
function hideLine8Markers() {
  setMapOnAllLine8(null);
}

// Shows any markers currently in the array. -- line8 
function showLine8Markers() {
  setMapOnAllLine8(map);
}

// ######################################################### place
// Sets the map on all Markers in the array. -- place 
function setMapOnAllPlace(map) {
  for (let i = 0; i < placeMarkers.length; i++) {
    placeMarkers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array. -- place 
function hidePlaceMarkers() {
  setMapOnAllPlace(null);
}

// Shows any markers currently in the array. -- place 
function showPlaceMarkers() {
  setMapOnAllPlace(map);
}

// ######################################################### all
// Sets the map on all Markers in the array. -- all 
function setMapOnAll(map) {
  for (let i = 0; i < line1Markers.length; i++) {
    line1Markers[i].setMap(map);
  }
  for (let i = 0; i < line2Markers.length; i++) {
    line2Markers[i].setMap(map);
  }
  for (let i = 0; i < line3Markers.length; i++) {
    line3Markers[i].setMap(map);
  }
  for (let i = 0; i < line4Markers.length; i++) {
    line4Markers[i].setMap(map);
  }
  for (let i = 0; i < line5Markers.length; i++) {
    line5Markers[i].setMap(map);
  }
  for (let i = 0; i < line6Markers.length; i++) {
    line6Markers[i].setMap(map);
  }
  for (let i = 0; i < line7Markers.length; i++) {
    line7Markers[i].setMap(map);
  }
  for (let i = 0; i < line8Markers.length; i++) {
    line8Markers[i].setMap(map);
  }
  for (let i = 0; i < placeMarkers.length; i++) {
    placeMarkers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array. -- all 
function hideAllMarkers() {
  setMapOnAll(null);
}

// Shows any markers currently in the array. -- all 
function showAllMarkers() {
  setMapOnAll(map);
}
