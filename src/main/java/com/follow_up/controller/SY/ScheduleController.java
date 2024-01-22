package com.follow_up.controller.SY;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ScheduleController {
	@GetMapping("/schedule")
	public String Schedule() {
		return "/schedule/read";
	}
}
