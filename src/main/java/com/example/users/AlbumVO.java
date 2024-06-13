package com.example.users;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlbumVO {
	private	int seq;
	private String title;
	private String content;
	private String album;
}
