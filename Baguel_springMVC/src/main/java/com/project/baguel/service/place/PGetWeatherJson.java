package com.project.baguel.service.place;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IPlaceRepository;
import com.project.baguel.model.PlaceDTO;
import com.sun.xml.internal.bind.v2.model.core.ID;

@Service
public class PGetWeatherJson implements IPlaceService {
	
	@Override
	public void execute(Model model) {
		System.out.println(">> PGetWeatherJson");
		
		// SET base_date
		LocalDateTime now = LocalDateTime.now();
		int nowDate = Integer.valueOf(now.format(DateTimeFormatter.ofPattern("yyyyMMdd")));
		int nowTime = Integer.valueOf(now.format(DateTimeFormatter.ofPattern("HHmm")));
		String base_date = null;
		if(nowTime < 2311) { // API update time
			base_date = String.valueOf(nowDate - 1);
		} else {
			base_date = String.valueOf(nowDate);
		}
		
		// SET base_time
		String base_time = "2300";
		
		String nx = null; String ny = null;
		Map<String, Object> map = model.asMap();
		PlaceDTO placeDTO = (PlaceDTO) map.get("placeDTO");
		if(placeDTO != null) {
			System.out.println(placeDTO);
			String place = placeDTO.getPlace();
			// SET nx & ny
			if (place.equals("cGarden")) {
				nx = "62"; ny = "126"; // 서울 대공원
			} else {
				nx = "60"; ny = "127"; // 그 외
			}
		} else {
			System.out.println(">> placeDTO is null <<");
			String xy = String.valueOf(map.get("xy"));
			System.out.println("xy is : " + xy);
			nx = xy.substring(0, 2);
			ny = xy.substring(3);
		}
		
		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst");
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
			+ "=BWAa0%2FSVnXgFMSyPeTVEGS5SjoEkMp3omTbFARPTMfDR3rJhlxl3KGWaIVoAmlEHvY4UhFw4X849u%2Bfsxl362A%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(base_date, "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode(base_time, "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8"));
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			String jsonData = sb.toString();
			model.addAttribute("jsonData", jsonData);
			System.out.println("exit weather json");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
