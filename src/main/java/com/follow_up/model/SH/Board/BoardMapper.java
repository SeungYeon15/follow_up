package com.follow_up.model.SH.Board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
	int total(Map map);

	List<BoardDTO> list(Map map);
	
	int upViewcnt(int bnum);

	BoardDTO read(int bnum);
}
