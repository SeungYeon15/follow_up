package com.follow_up.model.SY.schedule;

import java.util.List;
import java.util.Map;

public interface ScheduleService {

	List<Map> getSchedule();
	List<Map> getTagList();
	void addSchedule(Map<String, String> map);

}
