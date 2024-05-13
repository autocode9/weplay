package com.remake.weplay.team.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.remake.weplay.city.model.vo.City;
import com.remake.weplay.team.model.vo.Team;

public interface TeamService {

	int countTeams();
	
	List<Team> selectTeams(City city, RowBounds rowBounds);


}
