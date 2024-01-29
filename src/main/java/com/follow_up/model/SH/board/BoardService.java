package com.follow_up.model.SH.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	int total(Map map);

	List<BoardDTO> list(Map map);

	int upViewcnt(int bnum);

	BoardDTO read(int bnum);

	int create(BoardDTO dto);

	int passCheck(Map<String, String> map);

	int delete(int bnum);

	int update(BoardDTO dto);
	
}
