package com.remake.weplay.field.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.field.model.vo.Field;

@Repository
public class FieldRepository {

	public List<Field> selectFields(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("fieldMapper.selectFields");
	}

}
