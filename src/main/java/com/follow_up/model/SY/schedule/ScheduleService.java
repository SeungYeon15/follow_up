package com.follow_up.model.SY.schedule;

import java.util.List;
import java.util.Map;

public interface ScheduleService {

	List<Map> getSchedule();
	List<ScheduleTagDTO> getTagList();
	int addSchedule(ScheduleDTO sdto);

}
