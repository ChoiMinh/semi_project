package com.example.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.users.FriendVO;
import com.example.users.UsersDAO;
import com.example.users.UsersVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ModifyController {
	private final Logger log=LoggerFactory.getLogger(ModifyController.class);
	
	@Autowired
	UsersDAO dao;
	
	HttpSession s;
	
	@GetMapping("/modify.do")
	public String goModifyPage(Model m,HttpServletRequest req) {
		log.info("내 정보 수정 페이지로 이동");
		log.info("현재 접속중인 사용자 정보 :{} ",req.getSession().getAttribute("user"));
		m.addAttribute("section",1);
		return "mypage/main";
	}
	
	@GetMapping("/mail.do")
	public String goMailPage(Model m,HttpServletRequest req) {
		log.info("메일함으로 이동");
		log.info("현재 접속중인 사용자 정보 :{} ",req.getSession().getAttribute("user"));
		return "mypage/mail";
	}
	
	@GetMapping("/myFriendList.do")
	public String goMyFriendList(Model m) {
		log.info("친구 정보 수정 페이지로 이동");
		m.addAttribute("section",3);
		return "mypage/main";
	}
	
	@PostMapping("/modify.do")
	public String modifyUser(UsersVO u,HttpServletRequest req) {
		log.info("UsersVO={}",u);
		s=req.getSession();
		//dao.updateUser
		if(dao.updateUser(u)==1) {
			log.info("유저 정보 변경 완료");
			s.setAttribute("user", dao.getUserById(u));
			log.info("정보 : "+s.getAttribute("user"));
			return "redirect:/modify.do";
		}else {
			log.info("유저 정보 변경 실패");
			return "mypage/main";
		}
	}

}
