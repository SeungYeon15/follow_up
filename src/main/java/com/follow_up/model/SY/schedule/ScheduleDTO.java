package com.follow_up.model.SY.schedule;

import java.util.List;

import lombok.Data;

@Data
public class ScheduleDTO {
	private String scheduleId;
	private String scheduleStartTime;
	private String scheduleEndTime;
	private String scheduleTitle;
	private String scheduleContent;
	private String tagName;
}
