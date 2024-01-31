package com.follow_up.controller.SY;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.follow_up.model.SY.schedule.ScheduleDTO;
import com.follow_up.model.SY.schedule.ScheduleService;
import com.follow_up.model.SY.schedule.ScheduleTagDTO;

@Controller
public class ScheduleController {
	@Autowired
	@Qualifier("com.follow_up.model.SY.schedule.ScheduleServiceImpl")
	private ScheduleService service;
	
	@GetMapping("/schedule")
	public String Schedule(HttpServletRequest request) {
		List<ScheduleTagDTO> dtoList = service.getTagList();
				
		request.setAttribute("list", dtoList);
		
		return "/schedule/read";
	}
	
	@GetMapping(value="/schedule/getSchedule", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<Map> getSchedule(HttpServletRequest request){
		List<Map> list = service.getSchedule();
		return list;
	}
	
	@RequestMapping(value = "/schedule/addSchedule/{scheduleTitle}/{scheduleStartTime}/{scheduleEndTime}/{tagName}/{scheduleContent}", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String addOrder(@PathVariable String scheduleTitle, @PathVariable String scheduleStartTime, @PathVariable String scheduleEndTime, @PathVariable String tagName,@PathVariable String scheduleContent) {
		
		ScheduleDTO sdto = new ScheduleDTO();
		sdto.setScheduleTitle(scheduleTitle);
		sdto.setScheduleStartTime(scheduleStartTime);
		sdto.setScheduleEndTime(scheduleEndTime);
		sdto.setTagName(tagName);
		sdto.setScheduleContent(scheduleContent);
		int cnt = service.addSchedule(sdto);
		if(cnt>1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
//	@GetMapping(value="/schedule/getTagList", produces="application/json;charset=UTF-8")
//	@ResponseBody
//	public List<Map> getTagList(HttpServletRequest request){
//		List<Map> list = service.getTagList();
//		return list;
//	}
}
