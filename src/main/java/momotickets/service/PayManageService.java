package momotickets.service;

import momotickets.enumtype.UserType;
import momotickets.model.Account;
import momotickets.model.Order;

import javax.ejb.Remote;

@Remote
/**
 * Created by sparkler on 2018/3/6.
 * 支付、结账相关功能
 */
public interface PayManageService {

    /**
     * 会员支付订单
     * @param order
     * @param accountpwd
     * @return
     */
    Boolean payForOrder(Order order, String accountpwd);

    /**
     * 经理结算m某一演出所有订单金额
     * @param showid
     * @return
     */
    Boolean handleSettle(int showid);

    /**
     * 会员充值
     * @param accountid
     * @param money
     * @return
     */
    Boolean recharge(String accountid, int money);


    /**
     * 得到账户信息
     * @param uid
     * @param userType
     * @return
     */
    Account getAccount(String uid, UserType userType);

    /**
     * 更新账户密码
     * @param account
     * @return
     */
    Boolean modifyAccount(Account account);
}
