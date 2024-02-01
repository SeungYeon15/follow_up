package com.follow_up.model.SY.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service ("com.follow_up.model.SY.schedule.ScheduleServiceImpl")
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleMapper mapper;

	@Override
	public List<Map> getSchedule() {
		// TODO Auto-generated method stub
		return mapper.getSchedule();
	}

	@Override
	public List<ScheduleTagDTO> getTagList() {
		// TODO Auto-generated method stub
		return mapper.getTagList();
	}

	@Override
	public int addSchedule(ScheduleDTO sdto) {
		// TODO Auto-generated method stub
		return mapper.addSchedule(sdto);
	}


}
