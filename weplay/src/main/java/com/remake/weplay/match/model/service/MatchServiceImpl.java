package com.remake.weplay.match.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.match.model.dao.MatchRepository;
import com.remake.weplay.match.model.vo.MatchApplication;

@Service
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	private MatchRepository matchRepository;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int applyMatch(MatchApplication matchApp) {
		return matchRepository.applyMatch(sqlSession, matchApp);
	}

}
