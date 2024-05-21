package com.remake.weplay.match.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.match.model.vo.MatchApplication;

@Repository
public class MatchRepository {

	public int applyMatch(SqlSessionTemplate sqlSession, MatchApplication matchApp) {
		return sqlSession.insert("matchMapper.applyMatch", matchApp);
	}
	
	
}
