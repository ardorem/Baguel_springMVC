package com.project.baguel.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.baguel.model.StationDTO;
import com.project.baguel.service.station.IStationService;

@Controller
public class SController {

	@Autowired
	@Qualifier("SGetStationNames")
	IStationService sGetStationNames;
	
	@Autowired
	@Qualifier("SGetStationERR")
	IStationService sGetStationERR;
	
	@Autowired
	@Qualifier("SGetTimeSData")
	IStationService sGetTimeSData;

	@RequestMapping("/today_best5")
	public String today_best5(Model model) {
		return "today_best5";
	}
	
	@RequestMapping("/holiday_best5")
	public String holiday_best5(Model model) {
		return "holiday_best5";
	}
	
	@RequestMapping("/srch_station")
	public String srch_station(Model model) {
		System.out.println("Controller → srch_station");
		Calendar cal = Calendar.getInstance();
		String ymd = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(ymd);
		String today = sdf.format(cal.getTime());
		
		model.addAttribute("today", today);
		
		sGetStationNames.execute(model);
		
		return "srch_station"; 
	}
	
	@RequestMapping(value="/result_station")
	public String getStationERR(StationDTO stationDTO, Model model) throws Exception{
		System.out.println("> Controller → getStationERR");
		model.addAttribute("stationDTO", stationDTO);
		sGetStationERR.execute(model);
		sGetTimeSData.execute(model);
		
		return "result_station"; 
		}

	
		
}
