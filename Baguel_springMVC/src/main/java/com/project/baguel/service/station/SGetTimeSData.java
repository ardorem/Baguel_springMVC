package com.project.baguel.service.station;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IStationRepository;
import com.project.baguel.model.StationDTO;

@Service
public class SGetTimeSData implements IStationService{

	@Autowired
	IStationRepository StationMapper;

	@Override
	public void execute(Model model) {
		System.out.println(">> SGetTimeSData");
		ArrayList<StationDTO> timeSDataList = new ArrayList<StationDTO>();
		
		Map<String, Object> map = model.asMap();
		StationDTO stationDTO = (StationDTO) map.get("stationDTO");
		
		String selectDate = stationDTO.getSelectDate();
		String line = stationDTO.getLine();
		String stationName = stationDTO.getStationName();
		timeSDataList = StationMapper.getTimeSData(selectDate, line, stationName);
		model.addAttribute("perTimeSList", timeSDataList);
	}

}