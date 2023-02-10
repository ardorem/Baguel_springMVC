package com.project.baguel.service.place;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.model.PlaceDTO;

@Service
public class PCalcVisitorsList implements IPlaceService {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		ArrayList<PlaceDTO> places = (ArrayList<PlaceDTO>) map.get("places");
		
		DecimalFormat decFormat = new DecimalFormat("###,###");
		
		String day = (String) map.get("day");
		int dayType = 0;
		
		if (day.equals("1") || day.equals("7")) {
			dayType = 2; // 주말
		} else {
			dayType = 1; // 평일
		}
		
		for(PlaceDTO placeDTO : places) {
			float avgTemp = Float.valueOf(placeDTO.getAvgTemp());
			float precipitation = Float.valueOf(placeDTO.getPrecipitation());
			String place = placeDTO.getPlace();
			int visitorsInt = 0;
			String visitors = null;
			
			if (place.equals("gBpalace")) {
				// 경복궁
				visitorsInt = (int) (11214.52 * dayType + 228.61 * avgTemp - 200.47 * precipitation);
			} else if (place.equals("dSpalace")) {
				// 덕수궁
				visitorsInt = (int) (6500.37 * dayType + 95.76 * avgTemp - 108.94 * precipitation);
			} else if (place.equals("cGpalace")) {
				// 창경궁
				visitorsInt = (int) (2656.596 * dayType + 37.318 * avgTemp - 50.426 * precipitation);
			} else if (place.equals("cDpalace")) {
				// 창덕궁
				visitorsInt = (int) (4455.43 * dayType + 79.83 * avgTemp - 79.83 * precipitation);
			} else if (place.equals("cGarden")) {
				// 서울 대공원
				visitorsInt = (int) (3290.79 * dayType + 77.84 * avgTemp - 71.39 * precipitation);
			} else if (place.equals("sema")) {
				// 서울 시립 미술관
				visitorsInt = (int) (929.97 + 1633.65 * dayType + 25.52 * avgTemp);
			}
			visitors = decFormat.format(visitorsInt);
			placeDTO.setVisitors(visitors);
		}
		
		model.addAttribute("places", places);
	}

}
