package com.follow_up.model.SH.Board;
 
import lombok.*;
 
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class BoardDTO {
 
	private int bno;
	private String bname;
	private String btitle;
	private String bcontent;
	private String bpasswd;
	private int bview;
	private String bdate;
	
//	private String filename;
//	private int filesize;
//	private MultipartFile filenameMF;
}