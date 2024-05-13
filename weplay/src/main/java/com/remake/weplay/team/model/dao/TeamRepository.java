package com.remake.weplay.team.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.city.model.vo.City;
import com.remake.weplay.team.model.vo.Team;

@Repository
public class TeamRepository {
	
	public int countTeams(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teamMapper.countTeams");
	}
	
	public List<Team> selectTeams(SqlSessionTemplate sqlSession, City city, RowBounds rowBounds) {
		//return sqlSession.selectList("teamMapper.selectTeams", city, rowBounds);
		return null;
	}

}
