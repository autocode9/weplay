package com.remake.weplay.team.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.google.gson.JsonElement;
import com.remake.weplay.team.model.vo.Team;
import com.remake.weplay.team.model.vo.TeamApplication;

public interface TeamService {

	int countTeams(HashMap<String, String> map);
	
	List<Team> selectTeams(HashMap<String, String> map, RowBounds rowBounds);

	Team selectTeam(int teamNo);

	int applyCheck(TeamApplication teamApp);
	
	int joinTeam(TeamApplication teamApp);



}
