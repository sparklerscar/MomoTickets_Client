package momotickets.service;

import momotickets.enumtype.CheckType;
import momotickets.enumtype.ReturnType;
import momotickets.enumtype.UserType;
import momotickets.model.Coupon;
import momotickets.model.Manager;
import momotickets.model.Member;
import momotickets.model.Therter;

import javax.ejb.Remote;

@Remote
/**
 * Created by sparkler on 2018/3/6.
 * 用户（三种）相关功能
 */
public interface UserManageService {

	/**
	 * 会员注册
	 * @param email
	 * @param name
	 * @param pwd
	 * @return
	 */
	Boolean register(String email, String name, String pwd);

    /**
     * 激活会员账号
     * @param email
     * @return
     */
	Boolean activeMember(String email);

	/**
	 * 登录，包含三种用户
	 * @param uid
	 * @param userType
	 * @param pwd
	 * @return
	 */
	ReturnType login(String uid, UserType userType, String pwd);

	/**
	 * 得到会员信息
	 * @param memberid
	 * @return
	 */
	Member getMember(String memberid);

	/**
	 * 修改会员信息
	 * @param member
	 * @return
	 */
	Boolean modifyMember(Member member);

	/**
	 * 得到经理信息
	 * @param managerid
	 * @return
	 */
	Manager getManager(String managerid);

	/**
	 * 经理审核场馆注册和修改信息
     * @param therter
	 * @param ifPassed
     * @param checkType
	 * @return
	 */
	Boolean checkTherterInfo(Therter therter, Boolean ifPassed, CheckType checkType);

	/**
	 * 会员兑换优惠券
	 * @param memberid
	 * @param coupon
	 * @return
	 */
	Boolean redeemCoupon(String memberid, Coupon coupon);

	/**
	 * 会员取消使用账户
	 * @param memberid
	 * @return
	 */
	Boolean cancelMember(String memberid);
}
