package com.titan.controller;

import com.titan.entity.PageObj;
import com.titan.entity.ParamObj;
import com.titan.service.BqlService;
import com.titan.serviceImpl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Map;

@Controller
@RequestMapping("/bql")
public class BqlController {
    @Autowired
    private BqlService bqlse;
    @Autowired
    private BaseServiceImpl baseService;//分页通用service


    @RequestMapping("/khAdd")
    public @ResponseBody Map khAdd(ParamObj param) throws ParseException {
        System.out.println(param.getMap().get("idcard"));
        Map i=bqlse.khAdd(param.getMap());
        System.out.println(i.toString());
        return i;
    }
    @RequestMapping("/cppFind")
    public @ResponseBody ParamObj cppFind(){
        return bqlse.cppFind();
    }

    @RequestMapping("/khFind")//方法路径
    public @ResponseBody
    PageObj showApo(PageObj pg){
        pg.setSelectColumns("select *");//查询的列
        pg.setSelectSql("from customer");//查询语句
        pg=baseService.getPage(pg);//获取分页数据
        return pg;//返回分页数据
    }
    @RequestMapping("/khcpFind")//方法路径
    public @ResponseBody ParamObj khcpFind(ParamObj param){
        return bqlse.khcpFind(param.getNum());
    }
}
