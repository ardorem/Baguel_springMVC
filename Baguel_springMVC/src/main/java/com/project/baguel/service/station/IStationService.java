package com.project.baguel.service.station;

import java.sql.Date;

import org.springframework.ui.Model;

import com.project.baguel.model.StationDTO;


public interface IStationService {
	
	//public ArrayList<StationDTO> getTimeSData(Date selectDate, String line, String stationName);
	
	public void execute(Model model);
}
