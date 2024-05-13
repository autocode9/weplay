package com.remake.weplay.commons.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.commons.model.vo.City;

@Repository
public class CityRepository {

	public List<City> selectCities(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("");
	}

}
