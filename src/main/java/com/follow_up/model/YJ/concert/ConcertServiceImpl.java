package com.follow_up.model.YJ.concert;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service ("com.follow_up.model.YJ.concert.ConcertServiceImpl")
public class ConcertServiceImpl implements ConcertService{
	
	@Autowired
	private ConcertMapper mapper;

	@Override
	public List<ConcertDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

}
