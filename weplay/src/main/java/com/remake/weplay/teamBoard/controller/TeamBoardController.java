package com.remake.weplay.teamBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TeamBoardController {

	@RequestMapping("teamBoard.teamBoard")
	public String myPage() {
		// /WEB-INF/views/member/myPage.jsp
		return "teamBoard/teamBoard";
	}
	
}
