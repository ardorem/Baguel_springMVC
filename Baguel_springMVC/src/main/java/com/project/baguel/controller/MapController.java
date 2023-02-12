package com.project.baguel.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.baguel.service.map.IMapService;
import com.project.baguel.service.map.MGetAllErr;
import com.project.baguel.service.place.IPlaceService;

@Controller
public class MapController {
	
	@Autowired
	@Qualifier("PGetWeatherJson")
	IPlaceService pGetWeatherJson;

	@Autowired
	@Qualifier("PInsesrtWeather")
	IPlaceService pInsesrtWeather;
	
	@Autowired
	@Qualifier("PCheckWeatherData")
	IPlaceService pCheckWeatherData;
	// ----------
	@Autowired
	@Qualifier("PGetPlaces")
	IPlaceService pGetPlaces;
	
	@Autowired
	@Qualifier("PSetFcstDate")
	IPlaceService pSetFcstDate;
	
	@Autowired
	@Qualifier("PGetXys")
	IPlaceService pGetXys;
	
	@Autowired
	@Qualifier("PGetWeatherList")
	IPlaceService pGetWeatherList;
	
	@Autowired
	@Qualifier("PCalcVisitorsList")
	IPlaceService pCalcVisitorsList;
	
	@Autowired
	IMapService mGetAllErr;
	
	@RequestMapping("map")
	public String showMap(Model model) {
		System.out.println("> Controller → showMap");
//		- 모든 장소 데이터 받아오기 ArrayList
		pGetPlaces.execute(model);
		
//		- fcstDate, day, selectDate, selectDateStation 설정
		pSetFcstDate.execute(model);
		
//		- 모든 장소의 날씨 데이터 체크
		pGetXys.execute(model);
		Map<String, Object> map1 = model.asMap();
		String[] xys = (String[]) map1.get("xys");
		for(String xy : xys) {
			model.addAttribute("xy", xy);
			pCheckWeatherData.execute(model);
			
			Map<String, Object> map2 = model.asMap();
			int result = (int) map2.get("result");
			if(result == 0) {
				pGetWeatherJson.execute(model);
				pInsesrtWeather.execute(model);
			}
		}
	
		// 모든 장소의 날씨 데이터 받아오기 (model)
		pGetWeatherList.execute(model);
		
		// 예측 관람객 계산
		pCalcVisitorsList.execute(model);
		
		//-----------------
		
		//******* station 예측 혼잡률 가져오기
		mGetAllErr.execute(model);
		return "map";
	}
	
}
