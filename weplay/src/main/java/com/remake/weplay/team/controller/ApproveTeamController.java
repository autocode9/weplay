package com.remake.weplay.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.remake.weplay.team.model.service.TeamService;

@Controller
public class ApproveTeamController {

	@Autowired
	private TeamService teamService;
	
	/**
	 * 신청리스트
	 * @param teamNo
	 * @param model
	 * @return
	 */
	@RequestMapping("approveList.do")
	public String approveTeam(@RequestParam(value="teamNo")int teamNo,Model model) {
		model.addAttribute("list", teamService.selectTeamApplication(teamNo));
		System.out.println(teamNo);
		System.out.println(teamService.selectTeamApplication(teamNo));
		return "teamBoard/teamManage";
	}
	
}
