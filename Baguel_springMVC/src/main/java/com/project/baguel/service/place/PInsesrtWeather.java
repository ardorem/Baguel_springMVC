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
import com.sun.xml.internal.bind.v2.model.core.ID;

@Service
public class PInsesrtWeather implements IPlaceService {

	@Autowired
	IPlaceRepository iPlaceRepository;

	@Override
	public void execute(Model model) {
		System.out.println(">> PInsertWeather");
		Map<String, Object> map = model.asMap();
		PlaceDTO placeDTO = (PlaceDTO) map.get("placeDTO");
		String xy = null;
		String fcstDate = null;
		
		if(placeDTO != null) {
			xy = placeDTO.getXy();
			fcstDate = placeDTO.getFcstDate();
		} else {
			xy = String.valueOf(map.get("xy"));
			fcstDate = String.valueOf(map.get("fcstDate"));
		}
		
		String jsonData = String.valueOf(map.get("jsonData"));
		System.out.println(">>> fcstDate : " + fcstDate);
		try {
			JSONParser jsonParser = new JSONParser();

			// JSON to JSON Object
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonData);

			// parsing to "items"
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
        	totalTmp += tmp;
        } // 평균 기온 계산

				if (itemObject.get("fcstDate").equals(fcstDate) && itemObject.get("category").equals("PCP")) {
					String target = (String) itemObject.get("fcstValue");
					
					if (!target.equals("강수없음")) {
						if (target.contentEquals("50.0mm 이상")) {
							float pcp = (float) 50.0;
							totalPcp += pcp;
						} else if (target.contentEquals("30.0~50.0mm")) {
							float pcp = (float) 40.0;
							totalPcp += pcp;
						} else {
							float pcp = Float.parseFloat(target.substring(0, target.length() - 2));
							totalPcp += pcp;
						}
					} // 총 강수량 계산
					
				} 
			} // for
			System.out.println("total TMP : " + totalTmp);
			System.out.println("total totalPcp : " + totalPcp);
			float precipitationFloat = totalPcp;
			String avgTemp = String.format("%.1f", totalTmp / 24); // 소수점 이하 1자리까지
			String precipitation = String.valueOf(precipitationFloat);
			
			System.out.println("precipitationFloat : " + precipitationFloat);
			System.out.println("avgTempFloat : " + avgTemp);
			
			iPlaceRepository.insertWeather(xy, fcstDate, avgTemp, precipitation);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
