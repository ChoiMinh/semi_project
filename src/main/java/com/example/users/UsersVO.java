package com.example.users;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class UsersVO {
	private int id;
	private String user_id;
	private String password;
	private String email;
	private String nickname;
	private String photo;
}
