package com.example.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MiniController {
	
	private final Logger log=LoggerFactory.getLogger(MiniController.class);
	
	@GetMapping("/goGallery.do")
	public String goGalleryProcess() {
		log.info("갤러리로 이동");
		return "minihome/gallery";
	}
	@GetMapping("/goBoard.do")
	public String goBoardProcess() {
		log.info("게시판으로 이동");
		return "minihome/board";
	}
}
