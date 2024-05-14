package com.remake.weplay.member.model.service;

import com.remake.weplay.member.model.vo.Member;

public interface MemberService {
	
	// 로그인(SELECT)
	Member login(Member member);
	
	// 회원가입(INSERT)
	int insert(Member member);
	
	// 회원정보수정(UPDATE)
	int update(Member member);
	
	// 회원탈퇴(UPDATE)
	int delete(Member member);
	
}
