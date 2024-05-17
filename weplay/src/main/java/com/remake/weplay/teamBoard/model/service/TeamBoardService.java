package com.remake.weplay.teamBoard.model.service;

import java.util.List;

import com.remake.weplay.member.model.vo.Member;
import com.remake.weplay.teamBoard.model.vo.TeamBoard;

public interface TeamBoardService {

	//팀보드 가져오기
	List<TeamBoard> selectList(int teamNo, int boardCode);
	
	int insertTeamBoard (Member member, TeamBoard teamBoard);
	
	
}
