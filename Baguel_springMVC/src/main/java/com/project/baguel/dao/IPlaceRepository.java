package com.project.baguel.dao;

import org.apache.ibatis.annotations.Param;

import com.project.baguel.model.PlaceDTO;

public interface IPlaceRepository {
	void insertWeather(@Param("xy") String xy,
			@Param("fcstDate") String fcstDate,
			@Param("avgTemp") String avgTemp,
			@Param("precipitation") String precipitation);
	
	PlaceDTO getWeather (@Param("xy") String xy,
			@Param("fcstDate") String fcstDate);
	
}
