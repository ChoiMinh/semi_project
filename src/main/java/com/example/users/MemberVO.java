package com.example.users;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	private int seq;
	private String id;
	private String password;
	private String name;
	private String email;
	private String access;
}
