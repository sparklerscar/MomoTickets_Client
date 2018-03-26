package momotickets.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by sparkler on 2018/3/6.
 */
public class Settle implements Serializable {
    private int showid;
    private int percent;
    private Date time;

    public Settle(int showid, int percent, Date time) {
        this.showid = showid;
        this.percent = percent;
        this.time = time;
    }

    public Settle() {
    }

    public int getShowid() {
        return showid;
    }

    public void setShowid(int showid) {
        this.showid = showid;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }


    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
