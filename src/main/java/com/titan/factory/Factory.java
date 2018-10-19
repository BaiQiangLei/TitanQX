package com.titan.factory;

import com.titan.dao.ZjyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class Factory {
    @Autowired
    private ZjyDao d;

    @Transactional(rollbackFor = Exception.class)
    public String getIdNumber(String prefix){//获取一个不重复编号(并发量小于每毫秒1000次时保证不重复)
        Map map=new HashMap();
        Integer i=d.getId(map);
        if(i!=null){
            if(i>0){
                String theid= (map.get("id")+"");
                if(theid.length()==1){
                    theid="00"+theid;
                }else if (theid.length()==2){
                    theid="0"+theid;
                }
                if(Integer.parseInt(theid)>998){
                    d.cutTab("aid");
                }
                theid=prefix+this.getYYYYMMddHHmmssSSS()+theid;
                return theid;
            }
        }
        return null;
    }
    public String getYYYY(){//获取年份
        SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
        return sdf.format(new Date());
    }

    public String getMM(){
        SimpleDateFormat sdf=new SimpleDateFormat("MM");
        return sdf.format(new Date());
    }

    public String getdd(){
        SimpleDateFormat sdf=new SimpleDateFormat("dd");
        return sdf.format(new Date());
    }

    public String getYYYYMMddHHmmssSSS(){
        SimpleDateFormat sdf=new SimpleDateFormat("YYMMddHHmmssSSS");
        return sdf.format(new Date());
    }

    public String getHH(){
        SimpleDateFormat sdf=new SimpleDateFormat("HH");
        return sdf.format(new Date());
    }

    public String getmm(){
        SimpleDateFormat sdf=new SimpleDateFormat("mm");
        return sdf.format(new Date());
    }

    public String getss(){
        SimpleDateFormat sdf=new SimpleDateFormat("ss");
        return sdf.format(new Date());
    }

    public String getSSS(){
        SimpleDateFormat sdf=new SimpleDateFormat("SSS");
        return sdf.format(new Date());
    }




}
