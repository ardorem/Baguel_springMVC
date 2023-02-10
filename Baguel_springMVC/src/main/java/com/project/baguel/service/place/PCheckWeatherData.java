package com.project.baguel.service.place;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IPlaceRepository;

@Service
public class PCheckWeatherData implements IPlaceService {

	@Autowired
	IPlaceRepository iPlaceRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> PCheckWeatherData");
		Map<String, Object> map = model.asMap();
		String xy = String.valueOf(map.get("xy"));
		String fcstDate = String.valueOf(map.get("fcstDate"));
		
		int result = iPlaceRepository.checkWeatherData(xy, fcstDate);
			
		model.addAttribute("result", result);
		System.out.println(">> PCheckWeatherData EXIT");
	}

}
