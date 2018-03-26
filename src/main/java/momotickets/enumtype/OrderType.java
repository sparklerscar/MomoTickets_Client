package momotickets.enumtype;

/**
 * Created by sparkler on 2018/3/7.
 */
public enum OrderType {
    //已支付，未支付，已退订（包含自己退订和配票不成功系统自动退订），已关闭（15分钟内未支付自动关闭），已使用, 所有
    PAYED, WAIT, CANCEL, CLOSED, USED, ALL
}
