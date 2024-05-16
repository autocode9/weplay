package com.remake.weplay.teamBoardBrg.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.teamBoardBrg.model.dao.TeamBoardBrgRepository;
import com.remake.weplay.teamBoardBrg.model.vo.TeamBoardBrg;

@Service
public class TeamBoardBrgServiceImpl implements TeamBoardBrgService {

	@Autowired
	private TeamBoardBrgRepository teamBoardBrgRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<TeamBoardBrg> selectList(int teamNo) {
		return teamBoardBrgRepository.selectList(sqlSession, teamNo);
	}

	
	
}
