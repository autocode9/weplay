package com.remake.weplay.teamBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.remake.weplay.teamBoardBrg.model.service.TeamBoardBrgService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TeamBoardController {

	@Autowired
	private TeamBoardBrgService teamBoardBrgService; 
	
	/***
	 * 팀브릿지 전체조회
	 * @param teamNo
	 * @param model
	 * @return
	 */
	@RequestMapping("teamBoard.teamBoard")
	public String selectList(@RequestParam(value="teamNo")int teamNo,Model model) {
		// /WEB-INF/views/member/myPage.jsp
		model.addAttribute("list", teamBoardBrgService.selectList(teamNo));
		
		return "teamBoard/teamBoard";
	}
	

	
}
