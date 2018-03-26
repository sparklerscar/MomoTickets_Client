package momotickets.model;

import momotickets.enumtype.UserType;

import java.io.Serializable;

/**
 * Created by sparkler on 2018/3/5.
 */
public class Account implements Serializable {
    private String accountid;
    private String accountpwd;
    private UserType accounttype;
    private double balance;

    public Account(String accountid, String accountpwd, UserType accounttype, double balance) {
        this.accountid = accountid;
        this.accountpwd = accountpwd;
        this.accounttype = accounttype;
        this.balance = balance;
    }

    public Account() {
    }

    public String getAccountid() {
        return accountid;
    }

    public void setAccountid(String accountid) {
        this.accountid = accountid;
    }

    public String getAccountpwd() {
        return accountpwd;
    }

    public void setAccountpwd(String accountpwd) {
        this.accountpwd = accountpwd;
    }

    public UserType getAccounttype() {
        return accounttype;
    }

    public void setAccounttype(UserType accounttype) {
        this.accounttype = accounttype;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }
}
