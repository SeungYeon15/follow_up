package com.follow_up.model.NH.member;
 
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
 
import lombok.*;

public class MemberDTO{

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserPasswd() {
		return userPasswd;
	}
	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}
	public String getUserFile() {
		return userFile;
	}
	public void setUserFile(String userFile) {
		this.userFile = userFile;
	}
	public String getUserRegisterDate() {
		return userRegisterDate;
	}
	public void setUserRegisterDate(String userRegisterDate) {
		this.userRegisterDate = userRegisterDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	public MultipartFile getFnameMF() {
		return FnameMF;
	}
	public void setFnameMF(MultipartFile FnameMF) {
		this.FnameMF = FnameMF;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", userPasswd=" + userPasswd + ", userFile=" + userFile
				+ ", userRegisterDate=" + userRegisterDate + ", userName=" + userName + ", userEmail=" + userEmail
				+ ", userGrade=" + userGrade + ", getUserId()=" + getUserId() + ", getUserPasswd()=" + getUserPasswd()
				+ ", getUserFile()=" + getUserFile() + ", getUserRegisterDate()=" + getUserRegisterDate()
				+ ", getUserName()=" + getUserName() + ", getUserEmail()=" + getUserEmail() + ", getUserGrade()="
				+ getUserGrade() + ", getFnameMF =" + getFnameMF() +", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	private int userId;
	private String userPasswd   ;
	private String userFile  ;
	private String userRegisterDate  ;
    private String userName    ;
    private String userEmail    ;
    private String userGrade;
    private MultipartFile FnameMF;

}
