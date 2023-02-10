package com.project.baguel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.baguel.model.StationDTO;

public interface IMapRepository {
	String[] getAllLines();
	ArrayList<StationDTO> getAllErr(@Param("selectDate") String selectDate, 
			@Param("line") String line);
}
