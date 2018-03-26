package momotickets.model;

import java.io.Serializable;

/**
 * Created by sparkler on 2018/3/8.
 */
public class User implements Serializable {
    private String uid;
    private String pwd;

    public User(String uid, String pwd) {
        this.uid = uid;
        this.pwd = pwd;
    }

    public User() {
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
