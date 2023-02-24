package com.project.baguel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.baguel.model.StationDTO;


public interface IStationRepository {

	ArrayList<StationDTO> getTodayBest5();
	
	String getStationERR(@Param("selectDate")String selectDate,
			@Param("line")String line,
			@Param("stationName")String stationName);
	
	ArrayList<StationDTO> getTimeSData(@Param("selectDate")String selectDate,
			@Param("line")String line,
			@Param("stationName")String stationName);
	
	String[] getStationNames(@Param("line")String line);
}
