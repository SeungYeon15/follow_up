package com.follow_up.model.SH.Board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.follow_up.model.SH.Board.BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<BoardDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int upViewcnt(int bnum) {
		// TODO Auto-generated method stub
		return mapper.upViewcnt(bnum);
	}

	@Override
	public BoardDTO read(int bnum) {
		// TODO Auto-generated method stub
		return mapper.read(bnum);
	}

}
