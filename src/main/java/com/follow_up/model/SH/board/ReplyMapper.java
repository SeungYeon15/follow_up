package com.follow_up.model.SH.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	List<ReplyDTO> list(Map map);

	int total(int bnum);

	ReplyDTO read(int rnum);
	
	int create(ReplyDTO vo);
	
	int update(ReplyDTO vo);

	int delete(int rnum);

}
