package com.follow_up.model.SH.Board;
 
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
	
//	private String filename;
//	private int filesize;
//	private MultipartFile filenameMF;

//	private List<MemberDTO> list;
}