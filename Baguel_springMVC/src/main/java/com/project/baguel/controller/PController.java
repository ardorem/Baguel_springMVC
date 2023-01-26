package com.project.baguel.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.baguel.model.PlaceDTO;
import com.project.baguel.service.place.IPlaceService;
import com.project.baguel.service.placepast.IPlacePastService;

@Controller
public class PController {
	
	@Autowired
	@Qualifier("PGetWeather")
	IPlaceService pGetWeather;
	
	@Autowired
	@Qualifier("PGetWeatherJson")
	IPlaceService pGetWeatherJson;
	
	@Autowired
	@Qualifier("PInsesrtWeather")
	IPlaceService pInsesrtWeather;
	
	@Autowired
	@Qualifier("PCalcVisitors")
	IPlaceService pCalcVisitors;
	
	@Autowired
	IPlacePastService getPastPlaceData;
	
	@RequestMapping("srch_place")
	public String srchPlaceNevigate(Model model) {
		System.out.println("> Controller → srchPlaceNevigate");
		Calendar cal = Calendar.getInstance();
		
		String ymd1 = "yyyy년 MM월 dd일";
		String ymd2 = "yyyyMMdd";
		
		SimpleDateFormat sdf = new SimpleDateFormat(ymd1);
		SimpleDateFormat sdf2 = new SimpleDateFormat(ymd2);
		
		String today = sdf.format(cal.getTime());
		String todayV = sdf2.format(cal.getTime());
		int todayDay = cal.get(Calendar.DAY_OF_WEEK);
		System.out.println(todayDay);
		
		cal.add(Calendar.DATE, +1); //날짜를 하루 더한다.
		String tomorrow = sdf.format(cal.getTime());
		String tomorrowV = sdf2.format(cal.getTime());
		int tomorrowDay = cal.get(Calendar.DAY_OF_WEEK);
		System.out.println(tomorrowDay);
		
		cal.add(Calendar.DATE, +1); //날짜를 하루 더한다.
		String dAtomorrow = sdf.format(cal.getTime());
		String dAtomorrowV = sdf2.format(cal.getTime());
		int dAtomorrowDay = cal.get(Calendar.DAY_OF_WEEK);
		System.out.println(dAtomorrowDay);
		
		model.addAttribute("today", today);
		model.addAttribute("todayV", todayV);
		model.addAttribute("todayDay", todayDay);
		
		model.addAttribute("tomorrow", tomorrow);
		model.addAttribute("tomorrowV", tomorrowV);
		model.addAttribute("tomorrowDay", tomorrowDay);
		
		model.addAttribute("dAtomorrow", dAtomorrow);
		model.addAttribute("dAtomorrowV", dAtomorrowV);
		model.addAttribute("dAtomorrowDay", dAtomorrowDay);
		
		return "srch_place";
	}
	
	@RequestMapping("result_place")
	public String resultPlace(String selectDate, PlaceDTO placeDTO, Model model) {
		System.out.println("> Controller → resultPlace");
		model.addAttribute(placeDTO);
		pGetWeather.execute(model);
		int result = 0;
		
		Map<String, Object> map = model.asMap();
		result = (int)map.get("result");
		
		if(result == IPlaceService.WEATHER_NOEXISTENT) {
			pGetWeatherJson.execute(model);
			pInsesrtWeather.execute(model);
			pGetWeather.execute(model);
		} 
		pCalcVisitors.execute(model);
		getPastPlaceData.execute(model);
		model.addAttribute("selectDate",selectDate);
		return "result_place";
	}
	
	
}
