package com.remake.weplay.field.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.remake.weplay.field.model.vo.Field;

public interface FieldService {

	int countFields(HashMap<String, String> map);
	
	List<Field> selectFields(HashMap<String, String> map, RowBounds rowBounds);


}
