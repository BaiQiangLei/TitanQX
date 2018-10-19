package com.titan.controller;

import com.alibaba.fastjson.JSON;
import com.titan.entity.PageObj;
import com.titan.entity.ParamObj;
import com.titan.entity.UserInformation;
import com.titan.factory.Factory;
import com.titan.service.ZjyService;
import com.titan.serviceImpl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/zjy")//类路径
public class ZjyController {
    @Autowired
    private BaseServiceImpl baseService;//分页通用service
    @Autowired
    private ZjyService s;
    @Autowired
    private Factory f;

    @RequestMapping("/in")//登录
    public @ResponseBody
    UserInformation login_in(ParamObj param, HttpSession se){
        UserInformation u=s.login_in(param);
        se.setAttribute("url","/titan/jsp/bql/home.jsp");
        se.setAttribute("user",u);
        return u;//
    }

    @RequestMapping("/out")//登出
    public void login_out(HttpSession se, HttpServletResponse resp) throws IOException {
        se.invalidate();
        resp.getWriter().print("out");
    }

    @RequestMapping("/seturl")//设置页面url位置
    public @ResponseBody String seturl(ParamObj param, HttpSession se){
        se.setAttribute("url",param.getStr0());
        UserInformation u= (UserInformation) se.getAttribute("user");
        if(u!=null){
            if(u.getTrees()!=null){
                se.setAttribute("onetree",null);
                for (Map map:u.getTrees()) {
                    if(map.get("tvalue").equals(param.getStr0())){
                        se.setAttribute("onetree",map);
                        break;
                    }
                }
            }
        }

        return "";
    }

    @RequestMapping("/reolad")//页面重新加载
    public @ResponseBody String reloadIndex(ParamObj param, HttpSession se){
        UserInformation u=s.login_in(param);
        if(u!=null){
            se.setAttribute("user",u);
        }
        return "";
    }

    @RequestMapping("/setwhere")//设置页面位置
    public @ResponseBody Object setwhere(ParamObj param, HttpSession se){
        if(param.getWhere()!=null&&param.getStr0()!=null){
            se.setAttribute(param.getWhere(),param.getStr0());
        }
        return null;
    }

    @RequestMapping("/showvip")//查询所有会员
    public @ResponseBody PageObj showVip(PageObj pg){
        pg.setSelectColumns("select c.cname,c.csex,c.cphone,(year(SYSDATE())-year(c.cdate)) age,ww.wname vwname,date_format(v.opendate, '%Y-%m-%d %H:%i:%s') opendate,w.wname cwname,date_format(c.intime, '%Y-%m-%d %H:%i:%s') intime,v.vipnumber,v.money,ct.ctname");//查询的列
        pg.setSelectSql("from vip v left join customer c on c.cid=v.cid left join custype ct on ct.ctid=c.ctid left join worker w on w.wid=v.wid left join worker ww on ww.wid=c.wid");//查询语句
        pg=baseService.getPage(pg);//获取分页数据
        return pg;//返回分页数据
    }

    @RequestMapping("/getCardNmuber")//获取会员卡号
    public @ResponseBody String getCardNumber(){ return f.getIdNumber("V"); }

    @RequestMapping("/lodingaddvid")//加载添加VIP表单select框
    public @ResponseBody ParamObj lodingaddvid(){ return s.lodingselect(); }

    @RequestMapping("/addVip")//添加VIP
    public @ResponseBody String addVip(ParamObj p,HttpSession se){
        try{
            Object user=se.getAttribute("user");
            if(p.getMap()!=null){
                if(user!=null){
                    UserInformation u= (UserInformation) user;
                    p.getMap().put("wid",u.getUser().get("wid"));
                }else{
                    p.getMap().put("wid","NULL");
                }
            }
            if(p.getMap().get("cid").equals("")){
                String msg=s.crearAndOpenVip(p.getMap());
                return msg;
            }else{
                p.setMap(s.addVip(p.getMap()));
                if(!(p.getMap().get("vipid").equals(""))){
                    return "1";
                }
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        return "";
    }

    @RequestMapping("/checkIdNumber")//检查身份证唯一
    public @ResponseBody String checkIdNumber(ParamObj p){
        try {
            String str=s.checkIdNumber(p);
            return str;
        }catch (Exception e){

        }
        return "";
    }


}
