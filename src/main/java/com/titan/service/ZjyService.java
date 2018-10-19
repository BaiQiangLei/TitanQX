package com.titan.service;

import com.titan.entity.ParamObj;
import com.titan.entity.UserInformation;

import java.util.Map;


public interface ZjyService {
    public UserInformation login_in(ParamObj param);//登录
    public Map addCustomer(Map map);//添加用户
    public Map addVip(Map map);//办理会员
    public ParamObj lodingselect();//加载添加vip表单的select
    public String crearAndOpenVip(Map map);//新建客户并办理会员
    public String checkIdNumber(ParamObj param);//检查身份证唯一
}
