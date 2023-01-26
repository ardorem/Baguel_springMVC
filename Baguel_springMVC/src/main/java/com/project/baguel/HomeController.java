package com.project.baguel;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("about")
	public String logoutNevigate() {
		System.out.println("> Controller → about");
		return "about";
	}
	
//	@RequestMapping("srch_place")
//	public String srchPlaceNevigate() {
//		System.out.println("> Controller → srchPlaceNevigate");
//		return "srch_place";
//	}
//	
	@RequestMapping("srch_station")
	public String srchStationNevigate() {
		System.out.println("> Controller → srchStationNevigate");
		return "srch_station";
	}
	
	@RequestMapping("cal_view")
	public String calViewNevigate() {
		System.out.println("> Controller → calViewNevigate");
		return "cal_view";
	}
	
	@RequestMapping("map")
	public String mapNevigate() {
		System.out.println("> Controller → mapNevigate");
		return "map";
	}
	
}
