package com.project.baguel.service.station;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IStationRepository;
import com.project.baguel.model.MemberDTO;
import com.project.baguel.model.StationDTO;


@Service
public class StationService implements IStationService{

	@Autowired
	IStationRepository StationMapper;

	@Override
	public void execute(Model model) {
		
		ArrayList<StationDTO> timeSDataList = new ArrayList<StationDTO>();
		
		Map<String, Object> map = model.asMap();
		StationDTO stationDTO = (StationDTO) map.get("stationDTO");
		
		Date selectDate = stationDTO.getSelectDate();
		String line = stationDTO.getLine();
		String stationName = stationDTO.getStationName();
		
		timeSDataList = StationMapper.getTimeSData(selectDate, line, stationName);
		
		model.addAttribute("perTimeSList", timeSDataList);
		
	}
	
	/*
	@Override
	public ArrayList<StationDTO> getTimeSData(Date selectDate, String line, String stationName) {
		
		ArrayList<StationDTO> timeSDataList = new ArrayList<StationDTO>();
		
		
			timeSDataList = StationMapper.getTimeSData(selectDate, line, stationName);
			
			model.addAttribute("list", timeSDataList);
		return timeSDataList;
		
		
	}
	*/
	
	

	
	
//	@Override
//	public ArrayList<StationDTO> getTimeSData(Date selectDate, String line, String stationName) {
//		ArrayList<StationDTO> perTimeERR = new ArrayList<StationDTO>();
//		perTimeERR = stationMapper.getTimeSData(selectDate, line, stationName);
//		
//		return null;
//	}
//	


	

}