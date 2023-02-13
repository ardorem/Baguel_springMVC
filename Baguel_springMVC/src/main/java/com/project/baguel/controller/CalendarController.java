package com.project.baguel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.baguel.service.calendar.ICalendarService;

@Controller
public class CalendarController {
	
	@Autowired
//	@Qualifier("CGetEvents")
	ICalendarService cGetEvents;
	
	@RequestMapping("cal_view")
	public String calViewNevigate(Model model) {
		System.out.println("> Controller → calViewNevigate");
		cGetEvents.execute(model);
		return "cal_view";
	}
	
}
