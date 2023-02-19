package com.project.baguel.dao;

import java.sql.Date;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.baguel.model.StationDTO;


public interface IStationRepository {

	ArrayList<StationDTO> getTodayBest5();
	
	String getStationERR(@Param("selectDate")Date selectDate,
			@Param("line")String line,
			@Param("stationName")String stationName);
	
	//ArrayList<StationDTO> getTimeSData(StationDTO stationDTO);
	
	
	ArrayList<StationDTO> getTimeSData(@Param("selectDate")Date selectDate,
			@Param("line")String line,
			@Param("stationName")String stationName);
	
}
