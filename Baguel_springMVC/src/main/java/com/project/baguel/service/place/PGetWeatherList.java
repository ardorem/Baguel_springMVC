package com.project.baguel.service.place;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IPlaceRepository;
import com.project.baguel.model.PlaceDTO;

@Service
public class PGetWeatherList implements IPlaceService {

	@Autowired
	IPlaceRepository iPlaceRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> PGetWeatherList");
		Map<String, Object> map = model.asMap();
		ArrayList<PlaceDTO> places = (ArrayList<PlaceDTO>)map.get("places");
		String fcstDate = (String) map.get("fcstDate");
		
		for(PlaceDTO place : places) {
			String xy = place.getXy();
			PlaceDTO placeResult = iPlaceRepository.getWeather(xy, fcstDate);
			place.setAvgTemp(placeResult.getAvgTemp());
			place.setPrecipitation(placeResult.getPrecipitation());
		}
		model.addAttribute("places", places);
	}

}
