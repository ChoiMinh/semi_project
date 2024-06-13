package com.example.users;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class AlbumDAO {
	private static final List<AlbumVO>albumList;
	private static int seq=1;
	static {
		albumList=new ArrayList<AlbumVO>();
		albumList.add(new AlbumVO(seq++,"오늘의 명언","그렇죠 아직 걱정부터 하기엔 이르죠 일단 실천을!","/images/album/1.jpg"));
		albumList.add(new AlbumVO(seq++,"오늘 먹다남은 커피한잔","때로 인생이란 커피 한 잔이 가져다주는 따스함에 관한 문제이다.","/images/album/2.jpg"));
		albumList.add(new AlbumVO(seq++,"신선대 정상에서 한 컷","보람찼지만 이틀째 누워있다","/images/album/3.jpg"));
		albumList.add(new AlbumVO(seq++,"아 맞다 오늘 9시 수업인데","지금 9시 30분이네...","/images/album/4.jpg"));
		albumList.add(new AlbumVO(seq++,"돼지","근데 코 누르면 일어남?","/images/album/5.jpg"));
	}
	public void insert(AlbumVO dto) {
		dto.setSeq(seq++);
		albumList.add(dto);
	}
	
	
	public List<AlbumVO> selectAll() {
		return albumList;
	}
	
	private int findIndex(int seq) {
		int idx = -1;
		for(int i=0; i<albumList.size(); i++) {
			if(albumList.get(i).getSeq() == seq) {
				idx = i;
				break;
			}
		}
		return idx;
	}
	
	
	public AlbumVO findBySeq(int seq) {
		AlbumVO product = null;
		int i = findIndex(seq);
		if(i != -1) {
			product = albumList.get(i);
		}
		
		return product;
	}
	
	
	public void update(AlbumVO dto) {
		int i = findIndex(dto.getSeq());
		if(i != -1) {
			albumList.set(i, dto);
		}
	}
	
	
	public void delete(AlbumVO dto) {
		int i = findIndex(dto.getSeq());
		if(i != -1) {
			albumList.remove(i);
		}
	}
	public void delete(int seq) {
		int i = findIndex(seq);
		if(i != -1) {
			albumList.remove(i);
		}
	}
}
