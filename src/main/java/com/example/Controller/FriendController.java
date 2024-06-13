package com.example.Controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.users.FriendDAO;
import com.example.users.FriendVO;
import com.example.users.UsersDAO;
import com.example.users.UsersVO;

@Controller
public class FriendController {
	List<FriendVO> dbFriend;
	List<UsersVO> dbUser;
	@Autowired
	FriendDAO dao;
	
	private final static Logger log=LoggerFactory.getLogger(FriendController.class);
	
	@GetMapping("/delete/sendFriend.do")
	public String deleteSendFriendProcess(FriendVO f) {
		log.info("보낸 친구 요청 삭제");
		dao.deleteSendFriend(f);
		return "redirect:/modify.do";
	}
	@GetMapping("/delete/receiveFriend.do")
	public String deleteReceiveFriendProcess(FriendVO f) {
		log.info("받은 친구 요청 삭제");
		dao.deleteReceiveFriendList(f);
		return "redirect:/modify.do";
	}
	@GetMapping("/delete/Friend.do")
	public String deleteFriendProcess(FriendVO f) {
		log.info("친구 삭제");
		dao.deleteFriendList(f);
		return"redirect:/modify.do";
	}
	
	@GetMapping("insert/Friend.do")
	public String insertFriendProcess(FriendVO f) {
		log.info("친구 추가");
		dao.insertFriend(f);
		return "redirect:/modify.do";
	}
}

@RestController
class FriendRestController{
	List<FriendVO> dbFriend;
	List<UsersVO> dbUser;
	private final static Logger log=LoggerFactory.getLogger(FriendRestController.class);
	@Autowired
	FriendDAO dao;
	@GetMapping("friendList.do")
	public List<UsersVO> friendList(int f_section,int id,Model m){
		if(f_section==1) {
			dbFriend=dao.getFriendList(id);
			log.info("친구목록 불러오기 : list->{}",dbFriend);
			dbUser=dao.getUserListByFID(dbFriend);
		}else if(f_section==2) {
			dbFriend=dao.getReceiveFriendList(id);
			log.info("보낸 친구 요청 목록 불러오기 : list->{}",dbFriend);
			dbUser=dao.getUserListById(dbFriend);
		}else if(f_section==3) {
			dbFriend=dao.getSendFriendList(id);
			log.info("받은 친구 요청 목록 불러오기 : list->{}",dbFriend);
			dbUser=dao.getUserListByFID(dbFriend);
		}
		log.info("db에서 받아온 목록 : "+dbUser);
		return dbUser;
	}
}

