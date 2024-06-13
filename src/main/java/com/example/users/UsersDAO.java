package com.example.users;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.mybatis.jdbc.MyBatisUtil;

@Service
public class UsersDAO {
	List<UsersVO> ul;
	
	SqlSession s=MyBatisUtil.getSqlSession();
	
	private final static Logger log=LoggerFactory.getLogger(UsersDAO.class);
	
	public List<UsersVO> getUsers(){
		return s.selectList("UserMapper.selectAll");
	}
	
	public UsersVO getUserById(UsersVO u) {
		log.info("user id : "+u.getId());
		return s.selectOne("UserMapper.selectUserByID",u.getId());
	}
	
	public UsersVO getUserById(int id) {
		log.info("user id : "+id);
		return s.selectOne("UserMapper.selectUserByID",id);
	}
	
	public UsersVO getUserByUserId(UsersVO u) {
		log.info("user id : "+u.getUser_id());
		return s.selectOne("UserMapper.selectUserByUserID",u.getUser_id());
	}
	
	public UsersVO getUserByUserId(String user_id) {
		log.info("user id : "+user_id);
		return s.selectOne("UserMapper.selectUserByUserID",user_id);
	}
	
	public UsersVO getUserByNickname(String nickname) {
		log.info("nickname : "+nickname);
		return s.selectOne("UserMapper.selectUserByNickname",nickname);
	}
	
	public UsersVO getUserByNicknameAndEmail(UsersVO u) {
		log.info("nickname and email : "+u) ;
		return s.selectOne("UserMapper.selectUserByNicknameAndEmail",u);
	}
	
	public int insertUser(UsersVO u) {
		log.info("입력할 user : "+u);
		if(s.insert("UserMapper.insertUser", u)>0)
		{	log.info("회원가입 성공");
			s.commit(); return 1;
		}else {
			log.info("회원가입 실패");
			s.rollback(); return 0;
		}
	}
	
	public int updateUser(UsersVO u) {
		log.info("입력된 user : "+u);
		if(s.insert("UserMapper.updateUserById", u) ==1)
		{	log.info("유저 업데이트 성공");
			s.commit(); return 1;
		}else {
			log.info("너무 많은 유저 업뎃 또는 입력오류");
			s.rollback(); return 0;
		}
	}
}
