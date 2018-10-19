package com.titan.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class PageObj {
	private Integer page=1;//当前页数
	private Integer size=10;//每页显示条数
	private List list=new ArrayList();//分页数据
	private Integer count=0;//总条数
	private Integer pageMax=0;//最大页数
	private Map<String,Object> whereEqualMap=new HashMap<String, Object>();//传入数据等于该列的所有筛选条件
	private Map<String,Object> whereMinMap=new HashMap<String, Object>();//传入数据作为该列最小值的所有筛选条件
	private Map<String,Object> whereMaxMap=new HashMap<String, Object>();//传入数据作为该列最大值的所有筛选条件
	private String selectColumns;//sql语句查询列的部分
	private String selectSql;//sql语句片段
	private String keyWord="";//模糊查询关键字
	private List<String> queryColumns=new ArrayList<String>();//模糊检索的列
	private String orderColumn;//排序的列
	private String orderValue;//排序的规则
	private Map map=new HashMap();

	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getPageMax() {
		return pageMax;
	}
	public void setPageMax(Integer pageMax) {
		this.pageMax = pageMax;
	}
	public Map<String, Object> getWhereEqualMap() {
		return whereEqualMap;
	}
	public void setWhereEqualMap(Map<String, Object> whereEqualMap) {
		this.whereEqualMap = whereEqualMap;
	}
	public Map<String, Object> getWhereMinMap() {
		return whereMinMap;
	}
	public void setWhereMinMap(Map<String, Object> whereMinMap) {
		this.whereMinMap = whereMinMap;
	}
	public Map<String, Object> getWhereMaxMap() {
		return whereMaxMap;
	}
	public void setWhereMaxMap(Map<String, Object> whereMaxMap) {
		this.whereMaxMap = whereMaxMap;
	}

	public String getSelectColumns() {
		return selectColumns;
	}
	public void setSelectColumns(String selectColumns) {
		this.selectColumns = selectColumns;
	}
	public String getSelectSql() {
		return selectSql;
	}
	public void setSelectSql(String selectSql) {
		this.selectSql = selectSql;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public List<String> getQueryColumns() {
		return queryColumns;
	}
	public void setQueryColumns(List<String> queryColumns) {
		this.queryColumns = queryColumns;
	}
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	public String getOrderColumn() {
		return orderColumn;
	}
	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}
	public String getOrderValue() {
		return orderValue;
	}
	public void setOrderValue(String orderValue) {
		this.orderValue = orderValue;
	}




}
