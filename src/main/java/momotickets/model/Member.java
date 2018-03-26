package momotickets.model;

import java.io.Serializable;

//modify
public class Member extends User implements Serializable {
    private String memberid;
    private String pwd;
    private int isVip;
    private int viplevel;
    private String name;
    private double expense;
    private int point;

    public Member(String memberid, String pwd, int isVip, int viplevel, String name, double expense, int point, int isActive) {
        this.memberid = memberid;
        this.pwd = pwd;
        this.isVip = isVip;
        this.viplevel = viplevel;
        this.name = name;
        this.expense = expense;
        this.point = point;
        this.isActive = isActive;
    }

    public Member() {
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    private int isActive;


    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getIsVip() {
        return isVip;
    }

    public void setIsVip(int isVip) {
        this.isVip = isVip;
    }

    public int getViplevel() {
        return viplevel;
    }

    public void setViplevel(int viplevel) {
        this.viplevel = viplevel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getExpense() {
        return expense;
    }

    public void setExpense(double expense) {
        this.expense = expense;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}
