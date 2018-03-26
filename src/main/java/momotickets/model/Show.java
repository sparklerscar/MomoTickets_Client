package momotickets.model;

import momotickets.enumtype.ShowType;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by sparkler on 2018/3/5.
 */
public class Show implements Serializable {
    private int showid;
    private String therterid;
    private ShowType showtype;
    private String name;
    private String description;
    private Date time;
    private int floorprice;
    private int pricegap;
    private int columngap;
    private int ifOnsale;

    public int getIfOnsale() {
        return ifOnsale;
    }

    public void setIfOnsale(int ifOnsale) {
        this.ifOnsale = ifOnsale;
    }

    public Show(int showid, String therterid, ShowType showtype, String name, String description, Date time, int floorprice, int pricegap, int columngap, int ifOnsale) {
        this.showid = showid;
        this.therterid = therterid;
        this.showtype = showtype;
        this.name = name;
        this.description = description;
        this.time = time;
        this.floorprice = floorprice;
        this.pricegap = pricegap;
        this.columngap = columngap;
        this.ifOnsale = ifOnsale;
    }

    public Show() {
    }

    public int getShowid() {
        return showid;
    }

    public void setShowid(int showid) {
        this.showid = showid;
    }

    public String getTherterid() {
        return therterid;
    }

    public void setTherterid(String therterid) {
        this.therterid = therterid;
    }

    public ShowType getShowtype() {
        return showtype;
    }

    public void setShowtype(ShowType showtype) {
        this.showtype = showtype;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getFloorprice() {
        return floorprice;
    }

    public void setFloorprice(int floorprice) {
        this.floorprice = floorprice;
    }

    public int getPricegap() {
        return pricegap;
    }

    public void setPricegap(int pricegap) {
        this.pricegap = pricegap;
    }

    public int getColumngap() {
        return columngap;
    }

    public void setColumngap(int columngap) {
        this.columngap = columngap;
    }
}
