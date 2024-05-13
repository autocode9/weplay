package com.remake.weplay.team.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.city.model.vo.City;
import com.remake.weplay.team.model.vo.Team;

@Repository
public class TeamRepository {
	
	public List<Team> selectTeams(SqlSessionTemplate sqlSession, City city) {
		return sqlSession.selectList("");
	}

}
