package com.project.baguel.service.station;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IStationRepository;
import com.project.baguel.model.StationDTO;

@Service
public class SGetStationERR implements IStationService {

	@Autowired
	IStationRepository iStationRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> SGetStationERR");
		Map<String, Object> map = model.asMap();
		StationDTO stationDTO = (StationDTO) map.get("stationDTO");
		
		String selectDate = stationDTO.getSelectDate();
		String line = stationDTO.getLine();
		String stationName = stationDTO.getStationName();
		
		System.out.println(selectDate);
		System.out.println(line);
		System.out.println(stationName);
		
		String err = iStationRepository.getStationERR(selectDate, line, stationName);
		stationDTO.setErr(err);
		model.addAttribute("stationDTO", stationDTO);
	}

}
