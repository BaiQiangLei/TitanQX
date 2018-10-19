package com.titan.controller;

import com.titan.entity.PageObj;
import com.titan.factory.Factory;
import com.titan.service.ZjyService;
import com.titan.serviceImpl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/fenye")//类路径
public class PagingController {
    @Autowired
    private BaseServiceImpl baseService;//分页通用service
    @Autowired
    private ZjyService sys;
    @Autowired
    private Factory f;


    @RequestMapping("/apo")//方法路径
    public @ResponseBody
    PageObj showApo(PageObj pg){
        pg.setSelectColumns("select *");//查询的列
        pg.setSelectSql("from apo_areacode");//查询语句
        pg=baseService.getPage(pg);//获取分页数据
        return pg;//返回分页数据
    }

}
