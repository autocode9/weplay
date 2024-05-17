package com.remake.weplay.teamBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.remake.weplay.teamBoardBrg.model.service.TeamBoardBrgService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TeamBoardController {

	@Autowired
	private TeamBoardBrgService teamBoardBrgService; 
	
	
	@ResponseBody
	@GetMapping(value="teamboardSelect", produces="applcation/json; charset=UTF-8")
	public String selectBoardList(int boardNo) {
		
		return new Gson().toJson(boardService.selectReply(boardNo));
		
	}
	
}
