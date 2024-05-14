package com.remake.weplay.team.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.team.model.vo.Team;

@Repository
public class TeamRepository {
	
	public int countTeams(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("teamMapper.countTeams", map);
	}
	
	public List<Team> selectTeams(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds) {
		return sqlSession.selectList("teamMapper.selectTeams", map, rowBounds);
	}

}
