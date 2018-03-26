package momotickets.model;

import momotickets.enumtype.CheckType;

import java.io.Serializable;

/**
 * Created by sparkler on 2018/3/5.
 */
public class Therter extends User implements Serializable {
    private String therterid;
    private String pwd;
    private CheckType check;
    private String name;
    private String location;
    private String telnum;
    private int seat;
    private int row;
    private int column;
    private int tid;

    public Therter(String therterid, String pwd, CheckType check, String name, String location, String telnum, int seat, int row, int column, int tid) {
        this.therterid = therterid;
        this.pwd = pwd;
        this.check = check;
        this.name = name;
        this.location = location;
        this.telnum = telnum;
        this.seat = seat;
        this.row = row;
        this.column = column;
        this.tid = tid;
    }

    public Therter() {
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getTherterid() {
        return therterid;
    }

    public void setTherterid(String therterid) {
        this.therterid = therterid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public CheckType getCheck() {
        return check;
    }

    public void setCheck(CheckType check) {
        this.check = check;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTelnum() {
        return telnum;
    }

    public void setTelnum(String telnum) {
        this.telnum = telnum;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }
}
