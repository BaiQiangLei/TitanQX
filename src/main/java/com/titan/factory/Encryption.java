package com.titan.factory;

import org.springframework.stereotype.Component;

@Component
public class Encryption {//字符串加密


    public String codeToSafeCode(String code){//字符串加密
        String str0="";
        for (char c :code.toCharArray()) {
            str0+=(long)c+" ";
        }
        String safeCode="";
        for (char c : str0.toCharArray()) {
            safeCode+=(char)((long)c+37);
        }
        return safeCode;
    }
    public String safeCodeToCode(String safeCode){//加密字符串解析
        String str0="";
        for (char c : safeCode.toCharArray()) {
            str0+=(char)((long)c-37);
        }
        String code="";
        for (String string : str0.split(" ")) {
            code+=(char)(Long.parseLong(string));
        }
        return code;
    }
}
