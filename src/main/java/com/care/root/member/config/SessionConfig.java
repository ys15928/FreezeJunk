package com.care.root.member.config;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.care.root.member.dto.MemberDTO;

@WebListener
public class SessionConfig implements HttpSessionListener {
	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();
	
	public synchronized static String getSessionidCheck(String type, String compareId){
		String result = "";
		for( String key : sessions.keySet() ){
			HttpSession hs = sessions.get(key);
			MemberDTO dto = null;
			if(hs.getAttribute(type) != null) {
				dto = (MemberDTO) hs.getAttribute(type);
			}
			if(hs != null &&  hs.getAttribute(type) != null && dto.getId().equals(compareId) ){
				result =  key.toString();
			}
		}
		removeSessionForDoubleLogin(result);
		return result;
	}
	
	private static void removeSessionForDoubleLogin(String userId){
		if(userId != null && userId.length() > 0){
			sessions.get(userId).invalidate();
			sessions.remove(userId);    		
		}
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
