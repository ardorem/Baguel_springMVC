package com.project.baguel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.baguel.model.PlacePastDTO;

public interface IPLacePastRepository {
	ArrayList<PlacePastDTO> getGbpData(@Param("baseDate") String baseDate);
	ArrayList<PlacePastDTO> getDspData(@Param("baseDate") String baseDate);
	ArrayList<PlacePastDTO> getCgpData(@Param("baseDate") String baseDate);
	ArrayList<PlacePastDTO> getCdpData(@Param("baseDate") String baseDate);
	ArrayList<PlacePastDTO> getCgardenData(@Param("baseDate") String baseDate);
	ArrayList<PlacePastDTO> getSemaData(@Param("baseDate") String baseDate);

}
