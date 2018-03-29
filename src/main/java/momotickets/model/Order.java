package momotickets.model;

import momotickets.enumtype.OrderType;

import java.io.Serializable;
import java.util.Date;


public class Order implements Serializable {
    //s_id,u_id,name,quantity,price,date,state

    private int orderid;
    private String memberid;
    private int showid;
    private int ifOnline;
    private int ifChosen;
    private int amount;
    private double price;
    private double discount;
    private int coupon;
    private OrderType state;
    private Date time;

    public Order(int orderid, String memberid, int showid, int ifOnline, int ifChosen, int amount, double price, double discount, int coupon, OrderType state, Date time) {
        this.orderid = orderid;
        this.memberid = memberid;
        this.showid = showid;
        this.ifOnline = ifOnline;
        this.ifChosen = ifChosen;
        this.amount = amount;
        this.price = price;
        this.discount = discount;
        this.coupon = coupon;
        this.state = state;
        this.time = time;
    }

    public Order(String memberid, int showid, int ifOnline, int ifChosen, int amount, double price, double discount, int coupon, OrderType state, Date time) {
        this.memberid = memberid;
        this.showid = showid;
        this.ifOnline = ifOnline;
        this.ifChosen = ifChosen;
        this.amount = amount;
        this.price = price;
        this.discount = discount;
        this.coupon = coupon;
        this.state = state;
        this.time = time;
    }

    public Order() {
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public int getShowid() {
        return showid;
    }

    public void setShowid(int showid) {
        this.showid = showid;
    }

    public int getIfOnline() {
        return ifOnline;
    }

    public void setIfOnline(int ifOnline) {
        this.ifOnline = ifOnline;
    }

    public int getIfChosen() {
        return ifChosen;
    }

    public void setIfChosen(int ifChosen) {
        this.ifChosen = ifChosen;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getCoupon() {
        return coupon;
    }

    public void setCoupon(int coupon) {
        this.coupon = coupon;
    }

    public OrderType getState() {
        return state;
    }

    public void setState(OrderType state) {
        this.state = state;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }


}
