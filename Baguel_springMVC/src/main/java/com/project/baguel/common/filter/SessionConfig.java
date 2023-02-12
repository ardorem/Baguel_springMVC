package com.project.baguel.common.filter;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionConfig implements HttpSessionListener {

private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();
	
	//중복로그인 확인
	public synchronized static boolean getSessionidCheck(String type, String compareId){
		boolean result = false;
		for( String key : sessions.keySet() ){
			HttpSession hs = sessions.get(key);
			if(hs != null &&  hs.getAttribute(type) != null && hs.getAttribute(type).toString().equals(compareId) ){
				result = true;
			}
		}
		return result;
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
	    sessions.put(se.getSession().getId(), se.getSession());
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		if(sessions.get(se.getSession().getId()) != null){
			sessions.get(se.getSession().getId()).invalidate();
			sessions.remove(se.getSession().getId());	
		}
	}

}
