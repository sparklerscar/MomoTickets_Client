package momotickets.service;


import momotickets.model.Member;
import momotickets.model.Settle;
import momotickets.model.Therter;

import javax.ejb.Remote;
import java.util.List;
import java.util.Map;

@Remote
/**
 * Created by sparkler on 2018/3/6.
 * 统计相关的还需要思考统计些什么，暂时还未想好
 */
public interface StatisticsManageService {


    /**
     * 得到所有会员信息
     * @return
     */
    List<Member> getAllMember();

    /**
     * 得到所有场馆信息
     * @return
     */
    List<Therter> getAllTherter();

    /**
     * 得到所有结账账单信息
     * @return
     */
    List<Settle> getAllSettle();

    /**
     * 得到所有show的订单总额
     * @return
     */
    Map getTotalOfShow();

}
