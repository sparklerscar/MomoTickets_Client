package momotickets.service;

import momotickets.enumtype.CancelType;
import momotickets.enumtype.OrderType;
import momotickets.enumtype.UserType;
import momotickets.model.Order;
import momotickets.model.Seat;

import javax.ejb.Remote;
import java.util.List;

@Remote
/**
 * Created by sparkler on 2018/3/6.
 * 订单、购票相关功能
 */
public interface OrderManageService {

    /**
     * 购票，分为三种：线上选座、线上不选座、线下购票，中间的seatList为null，需要系统查询剩余空位，自动分配
     *
     * @param order
     * @param seatList
     * @return
     */
    Boolean buyTicket(Order order, List<Seat> seatList);

    /**
     * 会员退订订单/系统自动取消订单（15分钟内未支付或配票不成功），根据时长系统自动计算退款金额
     *
     * @param order
     * @param reason
     * @return
     */
    Boolean cancelOrder(Order order, CancelType reason);

    /**
     * 得到需要的订单列表
     *
     * @param userid
     * @param userType
     * @param orderType
     * @return
     */
    List<Order> getOrder(String userid, UserType userType, OrderType orderType);

    /**
     * @param orderid
     * @return
     */
    Order getOrderById(int orderid);
}
