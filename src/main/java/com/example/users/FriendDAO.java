package com.example.users;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.example.mybatis.jdbc.MyBatisUtil;

@Service
public class FriendDAO {
	List<FriendVO> ul;
	
	SqlSession s=MyBatisUtil.getSqlSession();
	
	private final static Logger log=LoggerFactory.getLogger(UsersDAO.class);
	
	public List<FriendVO> getFriendList(UsersVO u){
		log.info("id : "+u.getId());
		return s.selectList("FriendMapper.friendList",u.getId());
	}
	public List<FriendVO> getFriendList(int id){
		log.info("id : "+id);
		return s.selectList("FriendMapper.friendList",id);
	}
	
	public List<FriendVO> getReceiveFriendList(UsersVO u){
		log.info("id : "+u.getId());
		return s.selectList("FriendMapper.receiveFriendList",u.getId());
	}
	public List<FriendVO> getReceiveFriendList(int id){
		log.info("id : "+id);
		return s.selectList("FriendMapper.receiveFriendList",id);
	}
	
	public List<FriendVO> getSendFriendList(UsersVO u){
		log.info("id : "+u.getId());
		return s.selectList("FriendMapper.sendFriendList",u.getId());
	}
	public List<FriendVO> getSendFriendList(int id){
		log.info("id : "+id);
		return s.selectList("FriendMapper.sendFriendList",id);
	}
	
	public List<UsersVO> getUserListById(List<FriendVO> u){
		log.info("목록 : "+u);
		return s.selectList("FriendMapper.selectUserByID",u);
	}
	
	public List<UsersVO> getUserListByFID(List<FriendVO> u){
		log.info("목록 : "+u);
		return s.selectList("FriendMapper.selectUserByFID",u);
	}
	
	public void deleteSendFriend(FriendVO f) {
		log.info("목록 : "+f);
		s.delete("FriendMapper.deleteSendFriendList",f);
		s.commit();
	}
	
	public void deleteReceiveFriendList(FriendVO f) {
		log.info("목록 : "+f);
		 s.delete("FriendMapper.deleteReceiveFriendList",f);
		 s.commit();
	}
	
	public void deleteFriendList(FriendVO f) {
		log.info("목록 : ");
		deleteSendFriend(f);
		deleteReceiveFriendList(f);
		s.commit();
	}
	
	public void insertFriend(FriendVO f) {
		log.info("목록 : ");
		s.insert("FriendMapper.insertFriendList",f);
		s.commit();
	}
}
