package com.remake.weplay.team.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.remake.weplay.team.model.vo.Team;

public interface TeamService {

	int countTeams(HashMap<String, String> map);
	
	List<Team> selectTeams(HashMap<String, String> map, RowBounds rowBounds);


}
