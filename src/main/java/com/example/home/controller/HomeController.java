package com.example.home.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	private final Logger log=LoggerFactory.getLogger(HomeController.class);
	@GetMapping("/")
	public String goHome() {
		log.info("goHome 실행됨 - 메인화면");
		return "index";
	}
}
