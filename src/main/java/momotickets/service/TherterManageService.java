package momotickets.service;

import momotickets.enumtype.CheckType;
import momotickets.enumtype.TimeType;
import momotickets.model.*;

import javax.ejb.Remote;
import java.util.List;

@Remote
/**
 * Created by sparkler on 2018/3/5.
 * 场馆相关功能
 */
public interface TherterManageService {
    /**
     * 注册场馆->内部调用checkTherterInfo审核场馆信息功能
     * @param theater
     * @return
     */
    Boolean registerTherter(Therter theater);

    /**
     * 得到场馆信息
     * @param therterid
     * @param checkType
     * @return
     */
    Therter getTherter(String therterid, CheckType checkType);

    /**
     * 修改场馆信息->内部调用checkTherterInfo审核场馆信息功能
     * @param therterBefore
     * @param therterModify
     * @return
     */
    Boolean modifyTherter(Therter therterBefore, Therter therterModify);

    /**
     * 场馆发布计划（生成show）
     * @param show
     * @return
     */
    Boolean publishShow(Show show);

    /**
     * 检票登记，改变参数ifChecked
     * @param order
     * @return
     */
    Boolean checkIn(Order order);

    /**
     * 得到会员折扣信息
     * @param therterid
     * @return
     */
    List<Discount> getDiscount(String therterid);

    /**
     * 得到优惠券信息
     * @param therterid
     * @return
     */
    List<Coupon> getCoupon(String therterid);

    /**
     * 更改会员折扣信息
     * @param discount
     * @return
     */
    Boolean modifyDiscount(Discount discount);

    /**
     * 更改优惠券信息
     * @param coupon
     * @return
     */
    Boolean modifyCoupon(Coupon coupon);

    /**
     * 得到根据时间条件得到的show列表
     * @param timeType
     * @return
     */
    List<Show> getShow(TimeType timeType);

    /**
     * 得到可结算的show列表
     * @param ifSettled
     * @return
     */
    List<Show> getShowSettle(int ifSettled);

    /**
     * 得到某场馆根据时间条件得到的show列表
     * @param therterid
     * @return
     */
    List<Show> getShowByTherter(String therterid, TimeType timeType);

    /**
     * 得到单条show的信息
     * @param showid
     * @return
     */
    Show getSingleShow(int showid);

    /**
     * 修改场馆密码，无需审核
     * @param therter
     * @return
     */
    Boolean modifyTherterPwd(Therter therter);

    /**
     * 根据showid得到当前show的作为信息
     * @param therterid
     * @param showid
     * @param ifBought
     * @return
     */
    List<Seat> getSeatsByShow(String therterid, int showid, int ifBought);

    /**
     * 得到单条coupon信息
     * @param couponid
     * @return
     */
    Coupon getSingleCoupon(int couponid);

    /**
     * 得到场馆注册或修改信息的场馆信息列表
     * @param checkType
     * @return
     */
    List<Therter> getTherterCheck(CheckType checkType);

    /**
     * 找到单个seat
     * @param therterid
     * @param showid
     * @param row
     * @param column
     * @return
     */
    Seat getSingleSeat(String therterid, int showid, int row, int column);

}
