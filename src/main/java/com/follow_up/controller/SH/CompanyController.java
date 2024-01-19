package com.follow_up.controller.SH;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyController {
	@GetMapping("/company/company")
	public String home() {
		return  "/company/company";
	}
}
