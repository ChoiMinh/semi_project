package com.example;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
@WebFilter("/*")
public class loginFilter implements Filter {
	private final Logger log=LoggerFactory.getLogger(loginFilter.class);
	
	List<String>whiteList=List.of("/login.do","/register.do","/loginfind.do","/passwordfind.do","/logout.do",
				".ico","/admin","nicknameCheck.do","idCheck.do","/images",".css",".mp3",".png",".jpg",".woff");
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession s=req.getSession();
		boolean isWhiteList=false;
		String URI=req.getRequestURI();
		log.info("요청한 URL : {}",req.getRequestURI());
		if(s.getAttribute("user")!=null) {
			log.info("로그인 한 사용자");
			isWhiteList=true;
		}
		for(String pattern:whiteList) {
			if(URI.contains(pattern)) {
				log.info("pattern 통과 완료");
				isWhiteList=true;
			}
		}
		if(URI.equals("/") || isWhiteList) {
			log.info("whiteList");
		}else {
			log.info("blacklist");
			resp.sendRedirect("/login.do");
			return;
		}
		chain.doFilter(request, response);
		
	}
}
