package com.follow_up.controller.SY;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MusicControlloer {
	@GetMapping("/music")
	public String Music() {
		return "/music";
	}
}
