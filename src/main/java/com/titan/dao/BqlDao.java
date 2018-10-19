package com.titan.dao;

import java.util.List;
import java.util.Map;
import java.lang.Integer;

public interface BqlDao {
    /*
     *添加客户信息和车辆信息
     *  */
    public Integer khAdd(Map map);
    public Integer qcAdd(Map map);
    /*
     *绑定客户默认车辆
     * 查询用户车辆
     *  */
    public List<Map> qcFind(int cid);
    public int qcCarid(Map map);
    /*
     *客户信息验证
     *  */
    public List<Map> khFind_cphone(String cphone);
    public List<Map> khFind_idcard(String idcard);
    /*
     *汽车信息验证
     *  */
    public List<Map> qcFind_carpz(String carpz);
    public List<Map> qcFind_vin(String vin);
    public List<Map> qcFind_engine(String engine);
    /*
     *查询汽车品牌、类型、型号
     *  */
    public List<Map> ppFind();
    public List<Map> cxFind();
    public List<Map> xhFind();
    /*
     *查询客户类型、办理人
     *  */
    public List<Map> ctFind();
    public List<Map> wFind();
}
