package com.project.baguel.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.project.baguel.dao.IStationRepository;
import com.project.baguel.model.StationDTO;
import com.project.baguel.service.station.IStationService;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Controller
public class SController {

	@Autowired
	IStationService iStationService;
	IStationRepository StationMapper;
	
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
		return "srch_station"; 
	}
	
	@RequestMapping(value="/result_station")
	public String getStationERR(StationDTO stationDTO, Model model) throws Exception{
		
		Date selectDate = stationDTO.getSelectDate();
		String line = stationDTO.getLine();
		String stationName = stationDTO.getStationName();
		model.addAttribute("selectDate", selectDate);
		model.addAttribute("line", line);
		model.addAttribute("stationName", stationName);
		model.addAttribute("ERR", StationMapper.getStationERR(selectDate, line, stationName));
		
		model.addAttribute("StationDTO", stationDTO);
		iStationService.execute(model);
		
//		model.addAttribute("list", iStationService.execute(model, stationDTO));
	
		//model.addAttribute("perTimeERR", StationMapper.createSGraph(selectDate, line, stationName));
//		model.addAttribute("direction",createSGraph.getDirection());
//		model.addAttribute("t55_65", StationMapper.createSGraph(selectDate, line, stationName).getT55_65());
//		model.addAttribute("t70_95", StationMapper.createSGraph(selectDate, line, stationName).getT70_95());
//		
//		System.out.println(createSGraph.getT55_65());
		
		//model.addAttribute("list", iStationService.execute(model, selectDate, line, stationName);)
		
		return "result_station"; }

	
		
}
