const lineNotSelected = [ '호선을 우선 선택해 주세요' ];

function stationChange(line) {
	let target = document.getElementById("stationName");
	let stations;

	if (line.value == "호선") {
		stations = lineNotSelected;
	}
	if (line.value == "1호선") {
		stations = line1;
	}
	if (line.value == "2호선") {
		stations = line2;
	}
	if (line.value == "3호선") {
		stations = line3;
	}
	if (line.value == "4호선") {
		stations = line4;
	}
	if (line.value == "5호선") {
		stations = line5;
	}
	if (line.value == "6호선") {
		stations = line6;
	}
	if (line.value == "7호선") {
		stations = line7;
	}
	if (line.value == "8호선") {
		stations = line8;
	}

	target.options.length = 0;

	for (x in stations) {
		let opt = document.createElement("option");
		opt.value = stations[x];
		opt.innerHTML = stations[x];
		target.appendChild(opt);
	}
}

function stationSrchConfirm() {
	let srch_station = document.getElementById('srch_station');
	let selected1 = document.getElementById('stationName');

	let selectDate = document.getElementById('selectDate');
	let selectDateValue = (selectDate.value).substr(0, 4);

	if (selectDateValue == '') {
		alert("날짜를 선택 해주세요");
		srch_station.selectDate.focus();
		return;
	}
	
	if (!(selectDateValue == 2023)) {
		alert("2023년도 예측만 조회 가능합니다");
		srch_station.selectDate.focus();
		return;
	}

	if (selected1.options[selected1.selectedIndex].value == "none") {
		alert("조회할 역을 선택해 주세요");
		srch_station.stationName.focus();
		return;
	}

	srch_station.submit();
}