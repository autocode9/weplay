package com.remake.weplay.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.remake.weplay.team.model.service.TeamService;
import com.remake.weplay.team.model.vo.Team;

@Controller
public class TeamController {
	
	@Autowired
	private TeamService teamService;
	
	@GetMapping("allTeams")
	public String forwardToAllTeams() {
		return "team/all-teams";
	}
	
	@GetMapping("teamInfo")
	public ModelAndView forwardToTeamInfo(ModelAndView mv, int teamNo) {
		Team team = teamService.selectTeam(teamNo);
		if(team != null) {
			mv.addObject("team", team).setViewName("team/team-info");
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
}
