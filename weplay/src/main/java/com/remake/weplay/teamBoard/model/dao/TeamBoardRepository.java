package com.remake.weplay.teamBoard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.teamBoard.model.vo.TeamBoard;

@Repository
public class TeamBoardRepository {

	
	public List<TeamBoard> selectList(SqlSessionTemplate sqlSession, int teamNo, int boardCode){
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("teamNo", teamNo);
	    paramMap.put("boardCode", boardCode);
	    return sqlSession.selectList("teamBoardMapper.selectList", paramMap);
	}

}
