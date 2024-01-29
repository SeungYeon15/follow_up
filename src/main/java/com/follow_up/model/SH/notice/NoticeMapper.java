package com.follow_up.model.SH.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {
	int total(Map map);

	List<NoticeDTO> list(Map map);

	int upViewcnt(int nnum);

	NoticeDTO read(int nnum);

	int create(NoticeDTO dto);

	int passCheck(Map<String, String> map);

	int delete(int nnum);

	int update(NoticeDTO dto);
		
}
