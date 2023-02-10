package com.project.baguel.service.place;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IPlaceRepository;
import com.project.baguel.model.PlaceDTO;

@Service
public class PGetWeather implements IPlaceService {

	@Autowired
	IPlaceRepository iPlaceRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> PGetWeather");
		Map<String, Object> map = model.asMap();
		PlaceDTO placeDTO = (PlaceDTO) map.get("placeDTO");
		String fcstDate = placeDTO.getFcstDate();
		
		int result = 0;
		System.out.println("fcstDate : " + fcstDate);
		String xy = placeDTO.getXy();
		
		PlaceDTO placeResult = iPlaceRepository.getWeather(xy, fcstDate);
		if(placeResult == null) {
			result = WEATHER_NOEXISTENT;
			model.addAttribute("result", result);
		} else {
			result = WEATHER_EXISTENT;
			model.addAttribute("result", result);
			model.addAttribute("placeResult", placeResult);
		}
		
	}

}
