package com.example.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.users.MemberDAO;
import com.example.users.MemberVO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
	private final Logger log=LoggerFactory.getLogger(HomeController.class);
	@GetMapping("/")
	public String goHome() {
		log.info("goHome 실행됨 - 메인화면");
		return "main";
	}
	@GetMapping("/login.do")
	public String goLogin() {
		log.info("goLogin 실행됨 - 메인화면");
		return "mainpage/login/main";
	}
	@GetMapping("/register.do")
	public String goRegister() {
		log.info("goRegister 실행됨 - 메인화면");
		return "mainpage/login/register";
	}
	@GetMapping("/loginfind.do")
	public String goLoginfind() {
		log.info("goLoginfind 실행됨 - 메인화면");
		return "mainpage/login/findid";
	}
	@GetMapping("/passwordfind.do")
	public String gopasswordfind() {
		log.info("gopasswordfind 실행됨 - 메인화면");
		return "mainpage/login/findpswd";
	}
	@GetMapping("/gomini.do")
	public String gomini() {
		log.info("gomini 실행됨 - 메인화면");
		return "mini";
	}
	
}
