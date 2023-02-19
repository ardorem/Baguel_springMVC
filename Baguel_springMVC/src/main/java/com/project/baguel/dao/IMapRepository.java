package com.project.baguel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.baguel.model.StationMapDTO;

public interface IMapRepository {
	String[] getAllLines();
	ArrayList<StationMapDTO> getAllErr(@Param("selectDate") String selectDate, 
			@Param("line") String line);
}
