package com.example.users;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mybatis.jdbc.MyBatisUtil;

import lombok.AllArgsConstructor;
import lombok.Data;

@Service
public class MsgDAO{
	private final static Logger log=LoggerFactory.getLogger(MsgDAO.class);
	
	@Autowired
	UsersDAO dao;
	
	SqlSession s=MyBatisUtil.getSqlSession();
	
	public List<MsgVO> getReceiveMessageList(UsersVO u){
		return s.selectList("MsgMapper.receiveMessageList",u.getId());
	}
	public List<MsgVO> getReceiveMessageList(int id){
		return s.selectList("MsgMapper.receiveMessageList",id);
	}
	
	public List<MsgVO> getSenderMessageList(UsersVO u){
		return s.selectList("MsgMapper.senderMessageList",u.getId());
	}
	
	public List<MsgVO> getSenderMessageList(int id){
		return s.selectList("MsgMapper.senderMessageList",id);
	}
	public List<MsgVO> getMessageList(UsersVO u){
		return s.selectList("MsgMapper.messageList",u.getId());
	}
	
	public List<MsgVO> getMessageList(int id){
		return s.selectList("MsgMapper.messageList",id);
	}
	
	public void deleteMessage(int m_id) {
		s.delete("MsgMapper.deleteMessage",m_id);
		s.commit();
	}
	public void insertMessage(int id,String receiver,String content) {
		UsersVO u=dao.getUserById(id);
		UsersVO r=dao.getUserByNickname(receiver);
		if(r==null || u==null) {
			log.error("없는 사용자 입니다.");
			return;
		}
		dbMessage m=new dbMessage(id,r.getId(),u.getId(),LocalDate.now().toString(),content);
		log.info("넣을 데이터 : {}",m);
		s.insert("MsgMapper.insertMessage",m);
		s.commit();
	}
}

