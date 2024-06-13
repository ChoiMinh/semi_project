package com.example.Controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.users.MemberDAO;
import com.example.users.MemberVO;
import com.example.users.UsersVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	private final static Logger log=LoggerFactory.getLogger(AdminController.class);
	@Autowired
	MemberDAO m_dao;

	@GetMapping("admin/list.do")
	public String goMemberList(HttpServletRequest req) {
		List<MemberVO> memberList =m_dao.selectAll();
		HttpSession s=req.getSession();
		UsersVO u=(UsersVO)s.getAttribute("user");
		
		if(u==null || !u.getUser_id().equals("root")) {
			return "mainpage/login/main";
		}
		
		req.setAttribute("memberList", memberList);
		return "mainpage/admin/list";
	}
	
	@GetMapping("admin/delete.do")
	public String goMemberDelete(int seq,HttpServletRequest req) {
		log.info("admin/detail.do 실행됨");
		MemberVO u=m_dao.findBySeq(seq);
		req.setAttribute("member", u);
		return "mainpage/admin/delete";
	}
	@GetMapping("admin/edit.do")
	public String goMemberEdit(int seq,HttpServletRequest req) {
		log.info("admin/detail.do 실행됨" );
		MemberVO u=m_dao.findBySeq(seq);
		req.setAttribute("member", u);
		return "mainpage/admin/edit";
	}
	@GetMapping("admin/detail.do")
	public String goAdminDetail(int seq,HttpServletRequest req) {
		log.info("admin/detail.do 실행됨 ");
		MemberVO u=m_dao.findBySeq(seq);
		req.setAttribute("member", u);
		return "mainpage/admin/detail";
	}
	
	@GetMapping("admin/input.do")
	public String goMemberInput(HttpServletRequest req) {
		log.info("admin/input.do 실행됨");
		return "mainpage/admin/input";
	}
	@PostMapping("admin/input.do")
	public String doMemberInput(MemberVO m,HttpServletRequest req) {
		log.info("POST - admin/input.do 실행됨");
		m_dao.insert(m);
		return "redirect:list.do";
	}
	@PostMapping("admin/edit.do")
	public String doMemberModify(MemberVO m,HttpServletRequest req) {
		log.info("POST - admin/edit.do 실행됨");
		m_dao.update(m);
		return "redirect:list.do";
	}
	@PostMapping("admin/delete.do")
	public String doMemberDelete(MemberVO m,HttpServletRequest req) {
		log.info("POST - admin/delete.do 실행됨");
		m_dao.delete(m);
		return "redirect:list.do";
	}
	
}
