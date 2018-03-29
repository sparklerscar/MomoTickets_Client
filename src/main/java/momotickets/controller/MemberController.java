package momotickets.controller;


import momotickets.enumtype.*;
import momotickets.factory.EJBFactory;
import momotickets.model.Account;
import momotickets.model.Member;
import momotickets.model.Order;
import momotickets.service.OrderManageService;
import momotickets.service.PayManageService;
import momotickets.service.TherterManageService;
import momotickets.service.UserManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by sparkler on 2018/3/9.
 */
@Controller
@RequestMapping(value = "/member")
public class MemberController {
    private static final long serialVersionUID = 1L;

    @RequestMapping(value = "/{userid}/memberInfo", method = RequestMethod.GET)
    public ModelAndView getMemberInfo(@PathVariable String userid) {
        UserManageService userManageService = (UserManageService) EJBFactory.getEJB("UserManageServiceBean", "momotickets.service.UserManageService");
        PayManageService payManageService = (PayManageService) EJBFactory.getEJB("PayManageServiceImpl", "momotickets.service.PayManageService");
        //        StrEnumChange strEnumChange = new StrEnumChange();
        ModelAndView modelAndView = new ModelAndView("/member/memberInfo");
        modelAndView.addObject("member", userManageService.getMember(userid));
        modelAndView.addObject("account", payManageService.getAccount(userid, UserType.MEMBER));
        return modelAndView;
    }

    @RequestMapping(value = "/homepage", method = RequestMethod.GET)
    public ModelAndView doLogin(HttpServletRequest request,
                                HttpServletResponse response) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        StrEnumChange strEnumChange = new StrEnumChange();
        ModelAndView modelAndView = new ModelAndView("/homepage");
        modelAndView.addObject("showList", therterManageService.getShow(TimeType.NOW));
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/modifyInfo", method = RequestMethod.POST)
    public String modifyInfo(HttpServletRequest request) {
        UserManageService userManageService = (UserManageService) EJBFactory.getEJB("UserManageServiceBean", "momotickets.service.UserManageService");

        String name = request.getParameter("nickname");
        String memberid = request.getParameter("memberid");
        Member member = userManageService.getMember(memberid);
        member.setName(name);
        String result = "";
        if (userManageService.modifyMember(member)) {
            result = "Success!";
        } else {
            result = "Fail! Please try again.";
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/modifyPwd", method = RequestMethod.POST)
    public String modifyPwd(HttpServletRequest request) {
        UserManageService userManageService = (UserManageService) EJBFactory.getEJB("UserManageServiceBean", "momotickets.service.UserManageService");
        String result = "";
        String prePwd = request.getParameter("prePwd");
        String pwd = request.getParameter("pwd");
        String memberid = request.getParameter("memberid");
        Member member = userManageService.getMember(memberid);
        String prePwdTrue = member.getPwd();
        if (prePwd.equals(prePwdTrue)) {
            member.setPwd(pwd);
            if (userManageService.modifyMember(member)) {
                result = "Success!";
            } else {
                result = "Fail! Please try again.";
            }
        } else {
            result = "Pre password wrong! Please try again.";
        }
        System.out.println("result: " + result);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/modifyApwd", method = RequestMethod.POST)
    public String modifyApwd(HttpServletRequest request) {
        System.out.println("Modify account pwd!");
        PayManageService payManageService = (PayManageService) EJBFactory.getEJB("PayManageServiceImpl", "momotickets.service.PayManageService");
        String result = "";
        String preApwd = request.getParameter("preApwd");
        String apwd = request.getParameter("apwd");
        String memberid = request.getParameter("memberid");
        Account account = payManageService.getAccount(memberid, UserType.THERTER);
        String preApwdTrue = account.getAccountpwd();
        if (preApwd.equals(preApwdTrue)) {
            account.setAccountpwd(apwd);
            if (payManageService.modifyAccount(account)) {
                result = "Success!";
            } else {
                result = "Fail! Please try again.";
            }
        } else {
            result = "Pre password wrong! Please try again.";
        }
        return result;
    }

    @RequestMapping(value = "/{userid}/memberOrder", method = RequestMethod.GET)
    public ModelAndView getMemberOrder(@PathVariable String userid) {
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        ModelAndView modelAndView = new ModelAndView("/member/memberOrder");
//        ALL, PAYED, WAIT, CANCEL, CLOSED, USED
        modelAndView.addObject("memberOrderAll", orderManageService.getOrder(userid, UserType.MEMBER, OrderType.ALL));
        modelAndView.addObject("memberOrderPayed", orderManageService.getOrder(userid, UserType.MEMBER, OrderType.PAYED));
        modelAndView.addObject("memberOrderWait", orderManageService.getOrder(userid, UserType.MEMBER, OrderType.WAIT));
        modelAndView.addObject("memberOrderCancel", orderManageService.getOrder(userid, UserType.MEMBER, OrderType.CANCEL));
        modelAndView.addObject("memberOrderClosed", orderManageService.getOrder(userid, UserType.MEMBER, OrderType.CLOSED));
        modelAndView.addObject("memberOrderUsed", orderManageService.getOrder(userid, UserType.MEMBER, OrderType.USED));
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/cancelOrder")
    public String cancelOrder(HttpServletRequest request) {
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        String result = "";
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        System.out.println("cancel orderid: " + orderid);
        Order order = orderManageService.getOrderById(orderid);
        System.out.println("order.getOrderState: " + order.getState());
        if (orderManageService.cancelOrder(order, CancelType.CANCEL)) {
            result = "Success!";
        } else {
            result = "Fail! Please try again.";
        }
        System.out.println("cancel order result: " + result);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteMemberAcc")
    public String deleteMemberAccount(HttpServletRequest request) {
        String memberid = request.getParameter("memberid");
        UserManageService userManageService = (UserManageService) EJBFactory.getEJB("UserManageServiceBean", "momotickets.service.UserManageService");
        String result = "";
        if (userManageService.cancelMember(memberid)) {
            result = "Success!";
        } else {
            result = "Fail! Please try again!";
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/payForOrder")
    public String payForOrderById(HttpServletRequest request) {
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        PayManageService payManageService = (PayManageService) EJBFactory.getEJB("PayManageServiceImpl", "momotickets.service.PayManageService");

        String result = "";
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        String accountPwd = request.getParameter("accountPwd");
        Order order = orderManageService.getOrderById(orderid);
        Account account = payManageService.getAccount(order.getMemberid(),UserType.MEMBER);
        String accountPwdTrue = account.getAccountpwd();
//        if(accountPwd.equals(accountPwdTrue)){
            if (payManageService.payForOrder(order,accountPwdTrue)) {
                result = "Success!";
            } else {
                result = "Balance not enough!";
            }
//        }else {
//            result = "Account pwd wrong!";
//        }

        return result;
    }

}

