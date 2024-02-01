package com.follow_up.model.SH.board;
 
import lombok.Data;
 
@Data
public class BoardDTO {

	private int bnum;
	private String userId;
	private String btitle;
	private String bcontent;
	private String bpasswd;
	private int bview;
	private String bdate;

}