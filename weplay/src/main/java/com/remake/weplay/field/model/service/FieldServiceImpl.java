package com.remake.weplay.field.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.field.model.dao.FieldRepository;
import com.remake.weplay.field.model.vo.Field;

@Service
public class FieldServiceImpl implements FieldService {
	
	@Autowired
	private FieldRepository fieldRepository;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Field> selectFields() {
		return fieldRepository.selectFields(sqlSession);
	}

}
