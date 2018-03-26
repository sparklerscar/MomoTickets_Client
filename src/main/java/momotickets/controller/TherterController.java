package momotickets.controller;


import momotickets.enumtype.CheckType;
import momotickets.enumtype.OrderType;
import momotickets.enumtype.TimeType;
import momotickets.enumtype.UserType;
import momotickets.factory.EJBFactory;
import momotickets.model.Order;
import momotickets.model.Show;
import momotickets.service.OrderManageService;
import momotickets.service.PayManageService;
import momotickets.service.TherterManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by sparkler on 2018/3/9.
 */
@Controller
@RequestMapping(value = "/therter")
public class TherterController {
    private static final long serialVersionUID = 1L;

    @RequestMapping(value = "/{userid}/publishShow")
    public String getRegisterTherter(@PathVariable String userid) {
        return "therter/therterPublishShow";
    }

    @ResponseBody
    @RequestMapping(value="/publishNewShow", method=RequestMethod.POST)
    public String publishShow(Show show) {
        String result = "";
        System.out.println("\n----------publishShow---------------");
        System.out.println(show.getName());
        if (show.getFloorprice() <= 0 || show.getPricegap() < 0 || show.getColumngap() < 0) {
            result="参数不合法！";
            System.out.println("_______________result: "+result);
            return result;
        }
        //xxx业务逻辑处理
        show.setIfOnsale(1);
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        therterManageService.publishShow(show);
        result="发布成功！";
        System.out.println("_______________result: "+result);
        return result;
    }

    @RequestMapping(value = "/{userid}/checkIn", method = RequestMethod.GET)
    public Boolean checkIn(@PathVariable String userid) {
        return false;
    }

    @ResponseBody
    @RequestMapping(value="/searchOrderById", method=RequestMethod.GET)
    public Order searchOrderById(int orderid){
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        Order order = orderManageService.getOrderById(orderid);
        return order;
    }
//
//    @RequestMapping(value = "/{userid}/buyTicketOffline", method = RequestMethod.GET)
//    public Boolean buyTicketOffline(@PathVariable String userid) {
//        return false;
//    }

    @RequestMapping(value = "/{userid}/therterShow", method = RequestMethod.GET)
    public ModelAndView getTherterShow(@PathVariable String userid) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        ModelAndView modelAndView = new ModelAndView("/therter/therterShow");
        modelAndView.addObject("therterShowAll", therterManageService.getShowByTherter(userid, TimeType.ALL));
//        modelAndView.addObject("therterShowNow", therterManageService.getShowByTherter(userid, TimeType.NOW));
//        modelAndView.addObject("therterShowTimeout", therterManageService.getShowByTherter(userid, TimeType.TIMEOUT));
        return modelAndView;
    }

    @RequestMapping(value = "/{userid}/therterOrder", method = RequestMethod.GET)
    public ModelAndView getTherterOrder(@PathVariable String userid) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        ModelAndView modelAndView = new ModelAndView("/therter/therterOrder");
//        ALL, PAYED, WAIT, CANCEL, CLOSED, USED
        modelAndView.addObject("therterOrderAll", orderManageService.getOrder(userid, UserType.THERTER, OrderType.ALL));
//        modelAndView.addObject("therterOrderPayed", orderManageService.getOrder(userid, UserType.THERTER, OrderType.PAYED));
//        modelAndView.addObject("therterOrderWait", orderManageService.getOrder(userid, UserType.THERTER, OrderType.WAIT));
//        modelAndView.addObject("therterOrderCancel", orderManageService.getOrder(userid, UserType.THERTER, OrderType.CANCEL));
//        modelAndView.addObject("therterOrderClosed", orderManageService.getOrder(userid, UserType.THERTER, OrderType.CLOSED));
//        modelAndView.addObject("therterOrderUsed", orderManageService.getOrder(userid, UserType.THERTER, OrderType.USED));
        return modelAndView;
    }

    @RequestMapping(value = "/{userid}/therterInfo", method = RequestMethod.GET)
    public ModelAndView getTherterInfo(@PathVariable String userid,
                                       HttpSession session) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        PayManageService payManageService = (PayManageService) EJBFactory.getEJB("PayManageServiceImpl", "momotickets.service.PayManageService");
        ModelAndView modelAndView = new ModelAndView("/therter/therterInfo");
        modelAndView.addObject("therter", therterManageService.getTherter(userid, CheckType.CHECKED));
        modelAndView.addObject("account", payManageService.getAccount(userid, UserType.THERTER));
        return modelAndView;
    }

//    @RequestMapping(value = "/{userid}/therterDiscAndCoupon", method = RequestMethod.GET)
//    public Boolean getTherterDiscAndCoupon(@PathVariable String userid) {
//        return false;
//    }
//
//    @ResponseBody
//    @RequestMapping(value = "/{userid}/therterInfo", method = RequestMethod.GET)
//    public Boolean modifyTherterInfo(@PathVariable String userid) {
//        return false;
//    }
//
//    @ResponseBody
//    @RequestMapping(value = "/{userid}/therterDiscAndCoupon", method = RequestMethod.GET)
//    public Boolean modifyTherterDisc(@PathVariable String userid) {
//        return false;
//    }
}

