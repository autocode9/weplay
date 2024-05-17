package com.remake.weplay.team.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.team.model.dao.TeamRepository;
import com.remake.weplay.team.model.vo.Team;
import com.remake.weplay.team.model.vo.TeamApplication;

@Service
public class TeamServiceImpl implements TeamService {
	
	@Autowired
	private TeamRepository teamRepository;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int countTeams(HashMap<String, String> map) {
		return teamRepository.countTeams(sqlSession, map);
	}
	
	@Override
	public List<Team> selectTeams(HashMap<String, String> map, RowBounds rowBounds) {
		return teamRepository.selectTeams(sqlSession, map, rowBounds);
	}

	@Override
	public Team selectTeam(int teamNo) {
		return teamRepository.selectTeam(sqlSession, teamNo);
	}

	@Override
	public int applyCheck(TeamApplication teamApp) {
		return teamRepository.applyCheck(sqlSession, teamApp);
	}
	
	@Override
	public int joinTeam(TeamApplication teamApp) {
		return teamRepository.joinTeam(sqlSession, teamApp);
	}



}
