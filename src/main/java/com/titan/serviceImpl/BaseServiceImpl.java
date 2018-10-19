package com.titan.serviceImpl;

import java.util.List;
import java.util.Map;

import com.titan.dao.BaseDao;
import com.titan.entity.PageObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class BaseServiceImpl {
	@Autowired
	private BaseDao basedao;
	public PageObj getPage(PageObj pg) {//通用分页+模糊查询方法
		pg.setSelectSql(pg.getSelectSql()+" where 1=1 ");
		pg.setSelectSql(pg.getSelectSql());
		for(int i=0;i<pg.getQueryColumns().size();i++){//模糊查询条件语句
			if(i==0){
				pg.setSelectSql(pg.getSelectSql()+" and (`"+pg.getQueryColumns().get(i)+"` like \"%\"#{keyword}\"%\" ");
			}else if(i==pg.getQueryColumns().size()-1){
				pg.setSelectSql(pg.getSelectSql()+" or `"+pg.getQueryColumns().get(i)+"` like \"%\"#{keyword}\"%\") ");
			}else{
				pg.setSelectSql(pg.getSelectSql()+" or `"+pg.getQueryColumns().get(i)+"` like \"%\"#{keyword}\"%\" ");
			}
			if(pg.getQueryColumns().size()==1){
				pg.setSelectSql(pg.getSelectSql()+")");
			}
		}
		for (Map.Entry<String,Object> m:pg.getWhereEqualMap().entrySet()) {//前台传入数据等于该列的所有筛选条件
			pg.setSelectSql(pg.getSelectSql()+" and `"+m.getKey()+"`="+m.getValue());
		}
		for (Map.Entry<String,Object> m:pg.getWhereMaxMap().entrySet()) { //前台传入数据作为该列最大值的所有筛选条件
			pg.setSelectSql(pg.getSelectSql()+" and `"+m.getKey()+"`<="+m.getValue());
		}
		for (Map.Entry<String,Object> m:pg.getWhereMinMap().entrySet()) { //前台传入数据作为该列最小值的所有筛选条件
			pg.setSelectSql(pg.getSelectSql()+" and `"+m.getKey()+"`>="+m.getValue());
		}
		pg.getMap().put("sqlcount","select count(*) "+pg.getSelectSql());
		pg.getMap().put("keyword",pg.getKeyWord());
		int count=basedao.getCount(pg.getMap());
		pg.setCount(count);//总数据量
		String limit="";
		if(pg.getSize()!=null){//如果分页
			if(pg.getSize()>0){
				if(((double)count/(double)pg.getSize())>(count/pg.getSize())){
					pg.setPageMax((count/pg.getSize())+1);
				}else{
					pg.setPageMax((count/pg.getSize()));
				}
				if(pg.getPageMax()==0){
					pg.setPage(1);
				}else{
					if(pg.getPage()>pg.getPageMax()){
						pg.setPage(pg.getPageMax());
					}else if(pg.getPage()<1){
						pg.setPage(1);
					}
				}

				limit+=" limit  "+(pg.getPage()-1)*pg.getSize()+","+pg.getSize();
			}
		}
		pg.setSelectSql(pg.getSelectSql()+" order by `"+pg.getOrderColumn()+"` "+pg.getOrderValue()+" ");
		pg.getMap().put("sql",pg.getSelectColumns()+" "+pg.getSelectSql()+limit);
		List list=basedao.getPageList(pg.getMap());
		pg.setList(list);
		return pg;
	}

}
