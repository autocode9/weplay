package com.remake.weplay.match.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MatchController {
	
	@GetMapping("matchApplicationForm")
	public String forwardToMatchAF() {
		return "match/matchApplication";
	}
}
