package com.follow_up.model.SH.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.follow_up.model.SH.board.BoardServiceImpl")
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

	@Override
	public int create(BoardDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int passCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.passCheck(map);
	}

	@Override
	public int delete(int bnum) {
		// TODO Auto-generated method stub
		return mapper.delete(bnum);
	}

	@Override
	public int update(BoardDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public BoardDTO nextBnum(int bnum) {
		// TODO Auto-generated method stub
		return mapper.nextBnum(bnum);
	}

	@Override
	public BoardDTO prevBnum(int bnum) {
		// TODO Auto-generated method stub
		return mapper.prevBnum(bnum);
	}

}
