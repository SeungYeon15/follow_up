package com.follow_up.model.SH.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
	int total(Map map);

	List<BoardDTO> list(Map map);
	
	int upViewcnt(int bnum);

	BoardDTO read(int bnum);

	int create(BoardDTO dto);
	
	int passCheck(Map<String, String> map);

	int delete(int bnum);

	int update(BoardDTO dto);

	BoardDTO nextBnum(int bnum);

	BoardDTO prevBnum(int bnum);
	
}
