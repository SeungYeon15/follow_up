package com.follow_up.controller.YJ;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.follow_up.model.YJ.concert.ConcertDTO;
import com.follow_up.model.YJ.concert.ConcertMapper;
import com.follow_up.model.YJ.concert.ConcertService;

@Controller
public class ConcertController {
	@Autowired
	@Qualifier("com.follow_up.model.YJ.concert.ConcertServiceImpl")
	private ConcertService service;
	
	@Autowired
	private ConcertMapper mapper;
	
	@GetMapping("/concert")
	public String Concert(Model model) {
		List<ConcertDTO> list = mapper.list();
		model.addAttribute("list", list);
		return "/concert/list";
	}
	
}
