package com.example.Controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.users.AlbumDAO;
import com.example.users.AlbumVO;
import com.example.users.AlbumVO;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class AlbumController {
	private final Logger log=LoggerFactory.getLogger(AlbumController.class);
	
	@Autowired
	AlbumDAO dao;
	
	@GetMapping("album/list.do")
	public List<AlbumVO> getList(){
		log.info("album/list.do 실행됨");
		return dao.selectAll();
	}
	
	@GetMapping("album/delete.do")
	public void goAlbumDelete(int seq) {
		log.info("album/delete.do 실행됨");
		dao.delete(seq);
	}
	
	@GetMapping("album/input.do")
	public void doAlbumInput(AlbumVO a) {
		log.info("POST - album/input.do 실행됨");
		dao.insert(a);
	}
	@GetMapping("album/edit.do")
	public void doAlbumModify(AlbumVO a) {
		log.info("POST - album/edit.do 실행됨");
		dao.update(a);
	}
}
