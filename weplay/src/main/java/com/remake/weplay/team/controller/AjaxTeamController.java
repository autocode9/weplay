package com.remake.weplay.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.remake.weplay.city.model.vo.City;
import com.remake.weplay.team.model.service.TeamService;

@RestController
@RequestMapping(value="teams", produces="application/json; charset=UTF-8")
public class AjaxTeamController {
	
	@Autowired
	private TeamService teamService;
	
	@GetMapping
	public String selectTeams(City city) {
		System.out.println(city);
		return "";
	}

}
