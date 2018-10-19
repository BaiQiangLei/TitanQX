package com.titan.dao;

import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ZjyDao {
    public Map login_in(@Param("user") String user, @Param("pwd") String pwd);//登录
    public List<Map> getTrees(@Param("rid") Integer rid);//得到功能菜单
    public List<Map> getAllTrees();//得到所有菜单
    public Integer getId(Map map);//得到自增id数
    public Integer cutTab(@Param("table")String table);//截断表
    public List<Map> getCusType();//查询客户类型
    public List<Map> getCustomerNotVip();//查询不是VIP的客户
    public Integer addCustomer(Map map);//添加客户
    public Integer addVip(Map map);//办理会员
    public List<Map> checkIdNumber(@Param("idnumber")String idnumber);//查询身份证是否已存在
    public Integer addInComeRecord(@Param("intype")String intype,@Param("irmoney")double irmoney,@Param("irdate")Date irdate,@Param("jlwid")Integer jlwid,@Param("irps")String irps);//增加财务收入记录
}
