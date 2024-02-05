package com.follow_up.model.NH.member;
 
import java.util.List;
import java.util.Map;
 
public interface MemberMapper {
 
      
        
        int loginCheck(Map<String, String> map);
        
        String	getfind_emailcheck(Map<String, String> map);
        
        int create(MemberDTO dto);
        
        String	getfind_pwdcheck(Map<String, String> map);
        
        Map<String, String>getGrade(String id);
        
        int duplicatedEmail(String email);
        
        int updateFile(Map map);
        
    	MemberDTO getUserById(int id);
    	
    	MemberDTO read(int id);
    	
    	int update(MemberDTO dto);
    	
    	

}