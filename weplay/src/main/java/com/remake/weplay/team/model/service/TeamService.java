package com.remake.weplay.team.model.service;

import java.util.List;

import com.remake.weplay.city.model.vo.City;
import com.remake.weplay.team.model.vo.Team;

public interface TeamService {

	List<Team> selectTeams(City city);

}
