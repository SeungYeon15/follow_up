package com.follow_up.model.SH.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.follow_up.model.SH.board.ReplyServiceImpl")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper mapper;

	@Override
	public List<ReplyDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int total(int bnum) {
		// TODO Auto-generated method stub
		return mapper.total(bnum);
	}

	@Override
	public ReplyDTO read(int rnum) {
		// TODO Auto-generated method stub
		return mapper.read(rnum);
	}

	@Override
	public ReplyDTO create(ReplyDTO vo) {
		// TODO Auto-generated method stub
		return mapper.create(vo);
	}

	@Override
	public int update(ReplyDTO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(int rnum) {
		// TODO Auto-generated method stub
		return mapper.delete(rnum);
	}

}
