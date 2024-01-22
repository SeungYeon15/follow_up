package com.follow_up.controller.SY;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.follow_up.model.SY.schedule.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired
	@Qualifier("com.follow_up.model.SY.schedule.ScheduleServiceImpl")
	private ScheduleService service;
	
	@GetMapping("/schedule")
	public String Schedule() {
		return "/schedule/read";
	}
	
	@GetMapping(value="/schedule/getSchedule", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<Map> getSchedule(HttpServletRequest request){
		List<Map> list = service.getSchedule();
		return list;
	}
}
