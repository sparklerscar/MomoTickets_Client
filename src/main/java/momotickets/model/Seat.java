package momotickets.model;

import java.io.Serializable;

/**
 * Created by sparkler on 2018/3/6.
 */
public class Seat implements Serializable {
    private int seatid;
    private int row;
    private int column;
    private int showid;
    private int orderid;
    private int ifBought;

    public Seat(int seatid, int row, int column, int showid, int orderid, int ifBought) {
        this.seatid = seatid;
        this.row = row;
        this.column = column;
        this.showid = showid;
        this.orderid = orderid;
        this.ifBought = ifBought;
    }

    public Seat() {
    }

    public int getSeatid() {return seatid;}

    public void setSeatid(int seatid) {
        this.seatid = seatid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getShowid() {return showid;}

    public void setShowid(int showid) {this.showid = showid;}

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

    public int getIfBought() {
        return ifBought;
    }

    public void setIfBought(int ifBought) {
        this.ifBought = ifBought;
    }
}
