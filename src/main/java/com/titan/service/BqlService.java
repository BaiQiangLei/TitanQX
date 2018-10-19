package com.titan.service;

import com.titan.entity.ParamObj;

import java.text.ParseException;
import java.util.Map;

public interface BqlService {
    public Map khAdd(Map map) throws ParseException;
    public ParamObj cppFind();
    public ParamObj khcpFind(int cid);
}
