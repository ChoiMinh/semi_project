package com.example.users;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class dbMessage{
	private int id;
	private int receiver;
	private int sender;
	private String m_date;
	private String m_text;
}