package com.example.Controller;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.users.UsersDAO;
import com.example.users.UsersVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	private final Logger log=LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	UsersDAO dao;
	
	HttpSession session;

	@PostMapping("/login.do")
	public String loginProcess(UsersVO u,HttpServletRequest req) {
		UsersVO dbUser=dao.getUserByUserId(u);
		log.info("db에서 받아온 정보 : "+dbUser);
		if(u.getUser_id().equals("root") && u.getPassword().equals("root")) {
			//어드민인 경우 관리자 페이지로 이동
			return "redirect:admin/list.do?section=1";
		}
		if(dbUser==null) {
			log.info("로그인 실패 : 맞지 않는 ID또는 Password");
			req.setAttribute("errMsg","ID나 Password가 맞지 않습니다.");
			return "mainpage/login/main";
		}
		if(u.getUser_id().equals(dbUser.getUser_id()) && u.getPassword().equals(dbUser.getPassword())) {
			//로그인에 성공한 경우
			log.info("로그인 성공!");
			session=req.getSession();
			session.setAttribute("user",dbUser);
			return "redirect:/";
		}
		
		log.info("로그인 실패 : 맞지 않는 ID또는 Password");
		req.setAttribute("errMsg","ID나 Password가 맞지 않습니다.");
		return "mainpage/login/main";
	}
	@GetMapping("/logout.do")
	public String logoutProcess(HttpServletRequest req) {
		req.getSession().removeAttribute("user");
		return "redirect:/";
	}
	
	@PostMapping("/register.do")
	public String registerProcess(UsersVO u) throws IOException{
		log.info("UsersVO={}",u);
		/*
		log.info("multipartfile={}",file);
		if(!file.isEmpty()) {
			String fullPath="userUpload/test/"+file.getOriginalFilename();
			log.info("파일 저장 fullPath={}",fullPath);
			file.transferTo(new File(fullPath));
		}
		*/
		//dao.insertUser
		if(dao.insertUser(u)==1) {
			log.info("회원가입 완료");
			return "redirect:/";
		}else {
			log.info("회원가입 실패");
			return "mainpage/login/register";
		}
	}
	
	@PostMapping("/loginfind.do")
	public String loginFindProcess(UsersVO u,HttpServletRequest req) {
		UsersVO dbUser=dao.getUserByNicknameAndEmail(u);
		if(dbUser==null) {
			dbUser=new UsersVO();
		}
		req.setAttribute("user_id", dbUser.getUser_id());
		return "mainpage/login/findResult";
	}
	@PostMapping("/passwordfind.do")
	public String passwordFindProcess(String user_id,HttpServletRequest req) {
		UsersVO dbUser=dao.getUserByUserId(user_id);
		if(dbUser==null) {
			dbUser=new UsersVO();
		}
		req.setAttribute("password", dbUser.getPassword());
		return "mainpage/login/findResult";
	}
}

@RestController
class idClass{
	@Autowired
	UsersDAO dao;
	
	private final Logger log=LoggerFactory.getLogger(LoginController.class);
	
	@GetMapping("/idCheck.do")
	public boolean idChecking(String user_id) {
		UsersVO dbUser=dao.getUserByUserId(user_id);
		if(dbUser==null) {
			log.info("ID중복체크 : 없는 값");
			return false;
		}
		log.info("ID중복체크 : 있는 값");
		return true;
	}
	@GetMapping("/nicknameCheck.do")
	public boolean nicknameChecking(String nickname) {
		UsersVO dbUser=dao.getUserByNickname(nickname);
		if(dbUser==null) {
			log.info("Nickname중복체크 : 없는 값");
			return false;
		}
		log.info("Nickname중복체크 : 있는 값");
		return true;
	}
}
