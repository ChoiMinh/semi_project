package com.example.users;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class MsgVO {
	private int m_id;
	private int id;
	private String receiver;
	private String  sender;
	private String m_date;
	private String m_text;
}
