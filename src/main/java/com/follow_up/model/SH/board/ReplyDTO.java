package com.follow_up.model.SH.board;

import lombok.Data;

@Data
public class ReplyDTO {
	private int rnum;
	private String rcontent;
	private String rdate;
	private String userId;
	private int bnum;

}