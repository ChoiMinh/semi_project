package com.example.users;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class MemberDAO {
	private static final List<MemberVO>memberList;
	private static int seq=1;
	static {
		memberList=new ArrayList<MemberVO>();
		memberList.add(new MemberVO(seq++,"hong1","hongpw1","홍길순","hong1@example.com","관리자"));
		for(int i=2;i<15;i++) {
			memberList.add(new MemberVO(seq++,"hong"+i,"hongpw"+i,"hongName"+i,"hong"+i+"@example.com","사용자"));
		}
	}
	public void insert(MemberVO dto) {
		dto.setSeq(seq++);
		memberList.add(dto);
	}
	
	
	public List<MemberVO> selectAll() {
		return memberList;
	}
	
	private int findIndex(int seq) {
		int idx = -1;
		for(int i=0; i<memberList.size(); i++) {
			if(memberList.get(i).getSeq() == seq) {
				idx = i;
				break;
			}
		}
		return idx;
	}
	
	
	public MemberVO findBySeq(int seq) {
		MemberVO product = null;
		int i = findIndex(seq);
		if(i != -1) {
			product = memberList.get(i);
		}
		
		return product;
	}
	
	
	public void update(MemberVO dto) {
		int i = findIndex(dto.getSeq());
		if(i != -1) {
			memberList.set(i, dto);
		}
	}
	
	
	public void delete(MemberVO dto) {
		int i = findIndex(dto.getSeq());
		if(i != -1) {
			memberList.remove(i);
		}
	}
}
