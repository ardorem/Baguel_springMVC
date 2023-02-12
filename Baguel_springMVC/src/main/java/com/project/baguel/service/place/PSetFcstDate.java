package com.project.baguel.service.place;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.model.PlaceDTO;

@Service
public class PSetFcstDate implements IPlaceService {

	@Override
	public void execute(Model model) {
		System.out.println(">> PSetFcstDate");
		// SET fcstDate, day, selectDate
		Calendar cal = Calendar.getInstance();

		String ymd1 = "yyyy년+MM월+dd일";
		String ymd2 = "yyyy년 MM월 dd일";
		String ymd3 = "yyyyMMdd";
		String ymd4 = "yyyy-MM-dd";

		SimpleDateFormat sdf1 = new SimpleDateFormat(ymd1);
		SimpleDateFormat sdf2 = new SimpleDateFormat(ymd2);
		SimpleDateFormat sdf3 = new SimpleDateFormat(ymd3);
		SimpleDateFormat sdf4 = new SimpleDateFormat(ymd4);

		String selectDate = sdf1.format(cal.getTime());
		String today = sdf2.format(cal.getTime());
		String fcstDate = sdf3.format(cal.getTime());
		String selectDateStation = sdf4.format(cal.getTime());
		String day = String.valueOf(cal.get(Calendar.DAY_OF_WEEK)); // 요일

		model.addAttribute("selectDate", selectDate);
		model.addAttribute("fcstDate", fcstDate);
		model.addAttribute("day", day);
		model.addAttribute("today", today);
		model.addAttribute("selectDateStation", selectDateStation);
		
		System.out.println(">> PSetFcstDate EXIT");
	}

}
