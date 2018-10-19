package com.titan.serviceImpl;

import com.alibaba.fastjson.JSON;
import com.titan.dao.ZjyDao;
import com.titan.entity.ParamObj;
import com.titan.entity.UserInformation;
import com.titan.factory.Encryption;
import com.titan.service.ZjyService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ZjyServiceImpl implements ZjyService {
    @Autowired
    private ZjyDao d;
    @Autowired
    private Encryption e;

    //登录
    public UserInformation login_in(ParamObj param) {
        Map mp=d.login_in(param.getStr0(),e.codeToSafeCode(param.getStr1()));
        UserInformation u=new UserInformation();
        if(mp!=null){
            mp.put("wpwd",param.getStr1());
            u.setUser(mp);
            if(mp.get("rtype")!=null){
                if((mp.get("rtype")+"").equals("1")){
                    u.setTrees(d.getTrees(Integer.parseInt(mp.get("rid")+"")));
                }else if((mp.get("rtype")+"").equals("0")){
                    u.setTrees(d.getAllTrees());
                }
            }
            return u;
        }
        return null;
    }

    @Override//新建客户
    public Map addCustomer(Map map) {
        d.addCustomer(map);
        return map;
    }

    @Override//办理会员
    public Map addVip(Map map) {
        d.addVip(map);
        double dou=Double.parseDouble(map.get("openmoney")+"");
        if(dou>0.0){
            d.addInComeRecord("会员卡工本费",dou,new Date(),null,"");
        }
        return map;
    }

    @Override//加载添加VIP表单select框
    public ParamObj lodingselect() {
        ParamObj p=new ParamObj();
        p.setList_1(d.getCusType());
        p.setList_2(d.getCustomerNotVip());
        return p;
    }

    @Override//新建客户并办理会员
    @Transactional(rollbackFor = Exception.class)
    public String crearAndOpenVip(Map map) {
        map=this.addCustomer(map);//新建客户
        map=this.addVip(map);//办理VIP
        System.out.println(JSON.toJSONString(map));

        if(!(map.get("vipid").equals(""))){
            return "1";
        }
        return "";
    }

    @Override
    public String checkIdNumber(ParamObj param) {
        List<Map> list=d.checkIdNumber(param.getStr0());
        if(list!=null&&list.size()>0){
            return "1";
        }
        return null;
    }


}
