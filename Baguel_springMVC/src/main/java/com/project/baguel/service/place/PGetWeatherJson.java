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
		System.out.println(">> PInsertWeather");
		Map<String, Object> map = model.asMap();
		PlaceDTO placeDTO = (PlaceDTO) map.get("placeDTO");
		String place = placeDTO.getPlace();
		
		// SET base_date
		LocalDateTime now = LocalDateTime.now();
		int nowDate = Integer.valueOf(now.format(DateTimeFormatter.ofPattern("yyyyMMdd")));
		int nowTime = Integer.valueOf(now.format(DateTimeFormatter.ofPattern("HHmm")));
		String base_date = null;
		if(nowTime < 2311) { // API update time
			base_date = String.valueOf(nowDate - 1);
			System.out.println("nowDate : " + nowDate);
			System.out.println("base_date : " + base_date);
		} else {
			System.out.println("nowDate : " + nowDate);
			base_date = String.valueOf(nowDate);
			System.out.println("base_date : " + base_date);
		}
		
		// SET base_time
		String base_time = "2300";
		
		// SET nx & ny
		String nx = null; String ny = null;
		if (place.equals("cGarden")) {
			nx = "62"; ny = "126"; // 서울 대공원
		} else {
			nx = "60"; ny = "127"; // 그 외
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
			
			System.out.println(urlBuilder);
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
//			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			
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
			System.out.println();
//		System.out.println(sb.toString());
			String jsonData = sb.toString();
			model.addAttribute("jsonData", jsonData);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
