package momotickets.model;

import java.io.Serializable;

/**
 * Created by sparkler on 2018/3/5.
 */
public class Discount implements Serializable {
    private int discountid;
    private String therterid;
    private int viplevel;
    private int percent;

    public Discount(int discountid, String therterid, int viplevel, int percent) {
        this.discountid = discountid;
        this.therterid = therterid;
        this.viplevel = viplevel;
        this.percent = percent;
    }

    public Discount(String therterid, int viplevel, int percent) {
        this.therterid = therterid;
        this.viplevel = viplevel;
        this.percent = percent;
    }

    public Discount() {
    }

    public int getDiscountid() {
        return discountid;
    }

    public void setDiscountid(int discountid) {
        this.discountid = discountid;
    }

    public String getTherterid() {
        return therterid;
    }

    public void setTherterid(String therterid) {
        this.therterid = therterid;
    }

    public int getViplevel() {
        return viplevel;
    }

    public void setViplevel(int viplevel) {
        this.viplevel = viplevel;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }
}
