package com.example.mybatis.jdbc;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MyBatisUtil {
	private final static Logger log=LoggerFactory.getLogger(MyBatisUtil.class);
	public static SqlSession  getSqlSession() {
		SqlSession session=null;
		log.info("session 생성 시도");
		try {
			String resource = "mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sqlSessionFactory.openSession();
		}catch(Exception e){
			e.printStackTrace();
		}
		if(session==null) {
			log.error("Session이 생성되지 않았습니다 다시 확인해주세요");
		}else {
			log.info("Session 생성 완료");
		}
		return session;
	}
}

