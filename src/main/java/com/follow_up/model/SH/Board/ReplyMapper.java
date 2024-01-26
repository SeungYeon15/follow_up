package com.follow_up.model.SH.Board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	List<ReplyDTO> list(Map map);

	int total(int bnum);

	ReplyDTO read(int rnum);
	
	ReplyDTO create(ReplyDTO vo);
	
	int update(ReplyDTO vo);

	int delete(int rnum);

}