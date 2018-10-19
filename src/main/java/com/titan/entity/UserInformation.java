package com.titan.entity;

import java.util.List;
import java.util.Map;

public class UserInformation {
    private Map user;
    private List<Map> trees;

    public Map getUser() {
        return user;
    }

    public void setUser(Map user) {
        this.user = user;
    }

    public List<Map> getTrees() {
        return trees;
    }

    public void setTrees(List<Map> trees) {
        this.trees = trees;
    }
}
