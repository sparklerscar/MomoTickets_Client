package momotickets.model;

import java.io.Serializable;

/**
 * Created by sparkler on 2018/3/5.
 */
public class Coupon implements Serializable {
    private int couponid;
    private String therterid;
    private int point;
    private int requireprice;
    private int reduceprice;

    public Coupon(int couponid, String therterid, int point, int requireprice, int reduceprice) {
        this.couponid = couponid;
        this.therterid = therterid;
        this.point = point;
        this.requireprice = requireprice;
        this.reduceprice = reduceprice;
    }

    public Coupon() {
    }

    public int getCouponid() {
        return couponid;
    }

    public void setCouponid(int couponid) {
        this.couponid = couponid;
    }

    public String getTherterid() {
        return therterid;
    }

    public void setTherterid(String therterid) {
        this.therterid = therterid;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getRequireprice() {
        return requireprice;
    }

    public void setRequireprice(int requireprice) {
        this.requireprice = requireprice;
    }

    public int getReduceprice() {
        return reduceprice;
    }

    public void setReduceprice(int reduceprice) {
        this.reduceprice = reduceprice;
    }
}
