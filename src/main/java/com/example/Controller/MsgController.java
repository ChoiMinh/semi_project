package com.example.Controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.users.MsgDAO;
import com.example.users.MsgVO;
import com.example.users.UsersDAO;
import com.example.users.UsersVO;

import jakarta.servlet.http.HttpServletResponse;

@RestController
public class MsgController {
	
	private final Logger log=LoggerFactory.getLogger(MsgController.class);
	
	@Autowired
	MsgDAO dao;
	
	@Autowired
	UsersDAO tempDao;
	
	@GetMapping("/message/receiveList.do")
	public List<MsgVO> getReceiveMessage(UsersVO u) {
		log.info("받은 메시지 불러오기) 정보 : {}",u);
		return dao.getReceiveMessageList(u);
	}

	@GetMapping("/message/sendList.do")
	public List<MsgVO> getSendMessage(UsersVO u) {
		log.info("받은 메시지 불러오기) 정보 : {}",u);
		return dao.getSenderMessageList(u);
	}
	@GetMapping("/message/list.do")
	public List<MsgVO> getMessage(UsersVO u) {
		log.info("메시지 불러오기) 정보 : {}",u);
		return dao.getMessageList(u);
	}
	
	@GetMapping("/message/delete.do")
	public void deleteMessage(int m_id,HttpServletResponse resp) {
		log.info("메시지 삭제)정보 : {}",m_id);
		dao.deleteMessage(m_id);
		try {
			resp.sendRedirect("/mail.do");
			return;
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/message/insert.do")
	public void insertMessage(int id, String receiver,String content,HttpServletResponse resp) {
		log.info("메시지 추가)정보 id={},receiver={},content={}",id,receiver,content);
		dao.insertMessage(id,receiver,content);
		try {
			resp.sendRedirect("/mail.do");
			return;
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
