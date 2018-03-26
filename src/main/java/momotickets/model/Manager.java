package momotickets.model;

import java.io.Serializable;

/**
 * Created by sparkler on 2018/3/5.
 */
public class Manager extends User implements Serializable{
    private String managerid;
    private String pwd;

    public Manager(String managerid, String pwd) {
        this.managerid = managerid;
        this.pwd = pwd;
    }

    public Manager() {
    }

    public String getManagerid() {
        return managerid;
    }

    public void setManagerid(String managerid) {
        this.managerid = managerid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
