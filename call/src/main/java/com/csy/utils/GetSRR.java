package com.csy.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class GetSRR {

	/**
	 * 获取HttpServletRequest
	 */
	public HttpServletRequest getRequest() {
		
		return  ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	}
	
	/**
	 *  获取HttpServletResponse
	 */
	public HttpServletResponse getResponse() {
		
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
	}
	
	/**
	 * 获取HttpSession
	 */
	public HttpSession getSession() {
		
		return getRequest().getSession();
	}
}
