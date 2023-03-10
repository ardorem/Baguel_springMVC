package com.project.baguel;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("about")
	public String logoutNevigate(HttpServletRequest request) {
		System.out.println("> Controller → about");

    String ip = request.getHeader("X-Forwarded-For");

    if (ip == null) {
        ip = request.getHeader("Proxy-Client-IP");
        logger.info(">>>> Proxy-Client-IP : " + ip);
    }
    if (ip == null) {
        ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
        logger.info(">>>> WL-Proxy-Client-IP : " + ip);
    }
    if (ip == null) {
        ip = request.getHeader("HTTP_CLIENT_IP");
        logger.info(">>>> HTTP_CLIENT_IP : " + ip);
    }
    if (ip == null) {
        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        logger.info(">>>> HTTP_X_FORWARDED_FOR : " + ip);
    }
    if (ip == null) {
        ip = request.getRemoteAddr();
    }
    //logger.info(">>>> X-FORWARDED-FOR : " + ip);
    System.out.println("the ip address is : "+ip);
		
		return "about";
	}
	
//	@RequestMapping("srch_place")
//	public String srchPlaceNevigate() {
//		System.out.println("> Controller → srchPlaceNevigate");
//		return "srch_place";
//	}
//	
//	@RequestMapping("srch_station")
//	public String srchStationNevigate() {
//		System.out.println("> Controller → srchStationNevigate");
//		return "srch_station";
//	}
	
	@ExceptionHandler({SQLException.class, DataAccessException.class})
	public String errorException() {
		System.out.println("> Controller → errorException");
		return "error";
	}
	
	@RequestMapping("error")
	public String errorNevigate() {
		System.out.println("> Controller → error Nevigate");
		return "error";
	}
	
	@RequestMapping("wip")
	public String workInProgressNevigate() {
		System.out.println("> Controller → workInProgress Nevigate");
		return "wip";
	}
	
}
