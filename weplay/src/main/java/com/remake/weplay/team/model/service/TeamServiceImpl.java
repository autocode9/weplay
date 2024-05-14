package com.remake.weplay.team.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.city.model.vo.City;
import com.remake.weplay.team.model.dao.TeamRepository;
import com.remake.weplay.team.model.vo.Team;

@Service
public class TeamServiceImpl implements TeamService {
	
	@Autowired
	private TeamRepository teamRepository;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int countTeams() {
		return teamRepository.countTeams(sqlSession);
	}
	
	@Override
	public List<Team> selectTeams(City city, RowBounds rowBounds) {
		return teamRepository.selectTeams(sqlSession, city, rowBounds);
	}


}
