package com.titan.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao {
	public List<Map> getPageList(Map mp);
	public Integer getCount(Map mp);
}
