package com.follow_up.model.NH.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.follow_up.model.NH.member.MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	
	@Override
	public int loginCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.loginCheck(map);
	}
	
	@Override
	public String getfind_emailcheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.getfind_emailcheck(map);
	}
	
	@Override
	public String getfind_pwdcheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.getfind_pwdcheck(map);
	}

	@Override
	public Map<String, String> getGrade(String id) {
		// TODO Auto-generated method stub
		return mapper.getGrade(id);
	}

	@Override
	public int duplicatedEmail(String email) {
		// TODO Auto-generated method stub
		return mapper.duplicatedEmail(email);
	}
	
	@Override
	public int create(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}
	
}