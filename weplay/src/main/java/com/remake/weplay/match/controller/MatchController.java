package com.remake.weplay.match.controller;

import javax.servlet.http.HttpSession;

import com.remake.weplay.member.model.vo.Member;
import com.remake.weplay.team.model.service.TeamService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MatchController {
	
	@Autowired
	private TeamService teamService;
	
	@GetMapping("matchApplicationForm")
	public ModelAndView forwardToMatchAF(HttpSession session, ModelAndView mv, @RequestParam int awayTeamNo) {
		int teamNo = ((Member)session.getAttribute("loginUser")).getTeamNo();
		mv.addObject("homeTeam", teamService.selectTeam(teamNo)).setViewName("match/matchApplication");
		return mv;
	}
}
