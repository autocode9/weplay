package com.remake.weplay.teamBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.remake.weplay.team.model.service.TeamService;
import com.remake.weplay.team.model.vo.TeamApplication;
import com.remake.weplay.team.model.vo.TeamMember;

@Controller
public class AjaxTeamBoardController {

	@Autowired TeamService teamService;
	
	/***
	 * 팀에삽입
	 * @param teamMember
	 * @return
	 */
	@ResponseBody
	@PostMapping("insertToTeamMember")
	public String ajaxInsertToTeamMember(TeamMember teamMember) {
		return null;
	}
	
	@ResponseBody
	@PostMapping("updateTeamApplication")
	public String ajaxUpdateTeamApplication(TeamApplication teamApplication) {
		return null;
		
	}
	
	
}
