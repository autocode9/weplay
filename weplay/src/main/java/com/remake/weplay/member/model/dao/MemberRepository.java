package com.remake.weplay.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.remake.weplay.member.model.vo.Member;

public class MemberRepository {


	public Member login(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.login", member);
	}

	public int insert(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insert", member);
	}

	public int update(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.update", member);
	}

	public int delete(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.delete", member);
	}

}
