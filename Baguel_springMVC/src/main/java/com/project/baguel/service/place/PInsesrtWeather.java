package com.project.baguel.service.place;

import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IPlaceRepository;
import com.project.baguel.model.PlaceDTO;

@Service
public class PInsesrtWeather implements IPlaceService {

	@Autowired
	IPlaceRepository iPlaceRepository;

	@Override
	public void execute(Model model) {
		System.out.println(">> PInsertWeather");
		Map<String, Object> map = model.asMap();
		PlaceDTO placeDTO = (PlaceDTO) map.get("placeDTO");
		String xy = placeDTO.getXy();
		
		String fcstDate = placeDTO.getFcstDate();
		String jsonData = String.valueOf(map.get("jsonData"));
		System.out.println(">>> fcstDate : " + fcstDate);
		try {
			JSONParser jsonParser = new JSONParser();

			// JSON to JSON Object
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonData);

			// to array "items"
			JSONObject response = (JSONObject) jsonObject.get("response");
			JSONObject body = (JSONObject) response.get("body");
			JSONObject items = (JSONObject) body.get("items");

			// items의 배열을 추출
			JSONArray item = (JSONArray) items.get("item");
			float totalTmp = 0;
			float totalPcp = 0;

			for (int i = 0; i < item.size(); i++) {
				JSONObject itemObject = (JSONObject) item.get(i);
        if(itemObject.get("fcstDate").equals(fcstDate) && itemObject.get("category").equals("TMP")) {
        	String target = (String) itemObject.get("fcstValue");
        	int tmp = Integer.parseInt(target);
//        	System.out.println("예측 시간 : " + itemObject.get("fcstTime"));
//        	System.out.println("예측 기온 : " + tmp);
        	totalTmp += tmp;
        }

				if (itemObject.get("fcstDate").equals(fcstDate) && itemObject.get("category").equals("PCP")) {
					String target = (String) itemObject.get("fcstValue");
					if (!target.equals("강수없음")) {
						float pcp = Float.parseFloat(target.substring(0, target.length() - 2));
						totalPcp += pcp;
					}
//					System.out.println("예측 시간 : " + itemObject.get("fcstTime"));
//					System.out.println("예측 1시간 강수량 : " + target);
				}
			}
			System.out.println("total TMP : " + totalTmp);
			System.out.println("total totalPcp : " + totalPcp);
			float avgTempFloat = totalTmp / 24;
			float precipitationFloat = totalPcp / 24;
			System.out.println("avgTempFloat : " + avgTempFloat);
			System.out.println("precipitationFloat : " + precipitationFloat);
			String avgTemp = String.valueOf(avgTempFloat);
			String precipitation = String.valueOf(precipitationFloat);
			
			iPlaceRepository.insertWeather(xy, fcstDate, avgTemp, precipitation);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
