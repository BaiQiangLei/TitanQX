package com.titan.serviceImpl;

import com.titan.dao.BqlDao;
import com.titan.entity.ParamObj;
import com.titan.service.BqlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service

public class BqlServiceImpl implements BqlService {
    @Autowired
    private BqlDao dao;

    /*
     * 数据唯一验证
     * 并添加客户信息的车辆信息
     * */
    public Map khAdd(Map map) throws ParseException {
        List<Map> idcard=dao.khFind_idcard((String) map.get("idcard"));
        List<Map> cphone=dao.khFind_cphone((String) map.get("cphone"));
        List<Map> carpz=dao.qcFind_carpz((String) map.get("carpz"));
        List<Map> vin=dao.qcFind_vin((String) map.get("vin"));
        List<Map> engine=dao.qcFind_engine((String) map.get("engine"));
        System.out.println(map);
        int aa=0;
        if (map.get("idcard").equals("")){
            System.out.println("idcard为空");
        }else if(idcard.size()!=0 ){
            System.out.println("idcard："+idcard);
            map.put("idcard","0");
            aa=1;
        }
        if (cphone.size()!=0){
            System.out.println("cphone："+cphone);
            map.put("cphone","0");
            aa=1;
        }
        if (carpz.size()!=0){
            System.out.println("carpz："+carpz);
            map.put("carpz","0");
            aa=1;
        }
        if (map.get("vin").equals("")){
            System.out.println("vin为空");
        }else if (vin.size()!=0){
            System.out.println("vin："+vin);
            map.put("vin","0");
            aa=1;
        };
        if (map.get("engine").equals("")){
            System.out.println("engine为空");
        }else if (engine.size()!=0){
            System.out.println("engine："+engine);
            map.put("engine","0");
            aa=1;
        }
        System.out.println("判断完成："+aa);
        if (aa==0){
            System.out.println("开始添加");
            Date date = new Date();//获得系统时间.
            SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
            String nowTime = sdf.format(date);
            Date time = sdf.parse(nowTime);
            map.put("cdate",time);
            int i1=dao.khAdd(map);
            System.out.println(i1);
            int i2=dao.qcAdd(map);
            System.out.println(map.get("carid"));
            int i3=dao.qcCarid(map);
            System.out.println(i3);
        }
        return map;

    }
    /*
     * 查询汽车品牌、类型、型号
     * */
    @Override
    public ParamObj cppFind() {
        List<Map> pp=dao.ppFind();
        List<Map> cx=dao.cxFind();
        List<Map> xh=dao.xhFind();
        List<Map> ct=dao.ctFind();
        List<Map> w=dao.wFind();
        ParamObj param=new ParamObj();
        param.setList_1(pp);
        param.setList_2(cx);
        param.setList_3(xh);
        param.setList_4(ct);
        param.setList_5(w);
        return param;
    }

    @Override
    public ParamObj khcpFind(int cid) {
        List<Map> w=dao.qcFind(cid);
        ParamObj param=new ParamObj();
        param.setList_1(w);
        return param;
    }
}
