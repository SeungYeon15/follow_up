package com.follow_up.model.SH.Board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	int total(Map map);

	List<BoardDTO> list(Map map);

	int upViewcnt(int bnum);

	BoardDTO read(int bnum);
	
}
