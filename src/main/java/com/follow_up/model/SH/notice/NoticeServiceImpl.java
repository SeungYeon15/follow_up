package com.follow_up.model.SH.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.follow_up.model.SH.notice.NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<NoticeDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int upViewcnt(int nnum) {
		// TODO Auto-generated method stub
		return mapper.upViewcnt(nnum);
	}

	@Override
	public NoticeDTO read(int nnum) {
		// TODO Auto-generated method stub
		return mapper.read(nnum);
	}

	@Override
	public int create(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int passCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.passCheck(map);
	}

	@Override
	public int delete(int nnum) {
		// TODO Auto-generated method stub
		return mapper.delete(nnum);
	}

	@Override
	public int update(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	
}
