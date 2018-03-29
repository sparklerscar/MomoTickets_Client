package momotickets.controller;


import momotickets.enumtype.*;
import momotickets.factory.EJBFactory;
import momotickets.model.*;
import momotickets.service.OrderManageService;
import momotickets.service.PayManageService;
import momotickets.service.TherterManageService;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by sparkler on 2018/3/9.
 */
@Controller
//@Scope
@RequestMapping(value = "/therter")
public class TherterController {
    private static final long serialVersionUID = 1L;

    @RequestMapping(value = "/{userid}/publishShow")
    public String getRegisterTherter(@PathVariable String userid) {
        return "therter/therterPublishShow";
    }


    @ResponseBody
    @RequestMapping(value = "/publishNewShow")
    public String publishShow(HttpServletRequest request) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");

        StrEnumChange strEnumChange = new StrEnumChange();
        DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        ParsePosition pos = new ParsePosition(0);//转换长时间字符串

        String therterid = request.getParameter("therterid");
        ShowType showtype = (ShowType) strEnumChange.Str2Enum(request.getParameter("showtype"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Date time = format.parse(request.getParameter("time"), pos);
        int floorprice = Integer.parseInt(request.getParameter("floorprice"));
        int pricegap = Integer.parseInt(request.getParameter("pricegap"));
        int columngap = Integer.parseInt(request.getParameter("columngap"));
        Show show = new Show(therterid, showtype, name, description, time, floorprice, pricegap, columngap, 1);
        String result = "";
        System.out.println("\n----------publishShow---------------");
        System.out.println(show.getName());
        if (show.getFloorprice() <= 0 || show.getPricegap() < 0 || show.getColumngap() < 0) {
            result = "Invalid input!";
            System.out.println("_______________result: " + result);
            return result;
        }
        //xxx业务逻辑处理
        show.setIfOnsale(1);
        therterManageService.publishShow(show);
        result = "Success!";
        System.out.println("_______________result: " + result);
        return result;
    }

    @RequestMapping(value = "/{userid}/checkIn")
    public String checkIn(@PathVariable String userid) {
        return "therter/therterCheckIn";
    }

    @ResponseBody
    @RequestMapping(value = "/searchOrderById")
    public Map<String, Object> searchOrderById(HttpServletRequest request) {
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

        int orderid = Integer.parseInt(request.getParameter("orderid"));
        String therterid = request.getParameter("therterid");
        Order order = orderManageService.getOrderById(orderid);
        String therteridByOrder = therterManageService.getSingleShow(order.getShowid()).getTherterid();
        System.out.println("therterid: " + therterid);
        System.out.println("therteridByOrder: " + therteridByOrder);

        Map<String, Object> map = new HashMap<>();
        if (therterid.equals(therteridByOrder)) {
            map.put("isOwn", 1);
        } else {
            map.put("isOwn", 0);//不是本场馆的订单
        }
        map.put("order", order);
        map.put("ordertime", format.format(order.getTime()));
        return map;

    }

    @ResponseBody
    @RequestMapping(value = "/confirmCheckIn")
    public String confirmCheckInOrder(HttpServletRequest request) {
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");

        int orderid = Integer.parseInt(request.getParameter("orderid"));
        Order order = orderManageService.getOrderById(orderid);
        String result = "";
        if (therterManageService.checkIn(order)) {
            result = "Success!";
        } else {
            result = "Fail! Please try again.";
        }
        return result;

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
        modelAndView.addObject("therterShowNow", therterManageService.getShowByTherter(userid, TimeType.NOW));
        modelAndView.addObject("therterShowTimeout", therterManageService.getShowByTherter(userid, TimeType.TIMEOUT));
        return modelAndView;
    }

    @RequestMapping(value = "/{userid}/therterOrder", method = RequestMethod.GET)
    public ModelAndView getTherterOrder(@PathVariable String userid) {
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        ModelAndView modelAndView = new ModelAndView("/therter/therterOrder");
//        ALL, PAYED, WAIT, CANCEL, CLOSED, USED
        modelAndView.addObject("therterOrderAll", orderManageService.getOrder(userid, UserType.THERTER, OrderType.ALL));
        modelAndView.addObject("therterOrderPayed", orderManageService.getOrder(userid, UserType.THERTER, OrderType.PAYED));
        modelAndView.addObject("therterOrderWait", orderManageService.getOrder(userid, UserType.THERTER, OrderType.WAIT));
        modelAndView.addObject("therterOrderCancel", orderManageService.getOrder(userid, UserType.THERTER, OrderType.CANCEL));
        modelAndView.addObject("therterOrderClosed", orderManageService.getOrder(userid, UserType.THERTER, OrderType.CLOSED));
        modelAndView.addObject("therterOrderUsed", orderManageService.getOrder(userid, UserType.THERTER, OrderType.USED));
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

    @RequestMapping(value = "/{userid}/buyTickets/{showid}", method = RequestMethod.GET)
    public ModelAndView getTherterBuyTickets(@PathVariable("userid") String userid,@PathVariable("showid") int showid) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        ModelAndView modelAndView = new ModelAndView("/therter/therterBuyTicketT");
        modelAndView.addObject("show", therterManageService.getSingleShow(showid));
        modelAndView.addObject("therter", therterManageService.getTherter(userid, CheckType.CHECKED));
        modelAndView.addObject("seatBoughtList", therterManageService.getSeatsByShow(userid, showid, 1));
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "/modifyInfo", method = RequestMethod.POST)
    public String modifyInfo(HttpServletRequest request) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");

        String name = request.getParameter("name");
        String telnum = request.getParameter("telnum");
        String therterid = request.getParameter("therterid");
        Therter therterBefore = therterManageService.getTherter(therterid, CheckType.CHECKED);
        System.out.println("1" + therterBefore.getName());
        Therter therterModify = new Therter(therterBefore.getTherterid(), therterBefore.getPwd(), therterBefore.getCheck(), therterBefore.getName(), therterBefore.getLocation(), therterBefore.getTelnum(), therterBefore.getSeat(), therterBefore.getRow(), therterBefore.getColumn(), therterBefore.getTid());
        System.out.println("2" + therterModify.getName());
        therterModify.setName(name);
        therterModify.setTelnum(telnum);
        System.out.println("3" + therterBefore.getName());
        System.out.println("4" + therterModify.getName());

        String result = "";
        if (therterManageService.modifyTherter(therterBefore, therterModify)) {
            result = "Success! Wait confirm.";
        } else {
            result = "Fail! Please submit again.";
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/modifyPwd", method = RequestMethod.POST)
    public String modifyPwd(HttpServletRequest request) {
        System.out.println("modify pwd!!!!!!!!!!!!!!!!!!!!!!!");
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        String result = "";
        String prePwd = request.getParameter("prePwd");
        String pwd = request.getParameter("pwd");
        String therterid = request.getParameter("therterid");
        Therter therter = therterManageService.getTherter(therterid, CheckType.CHECKED);
        String prePwdTrue = therter.getPwd();
        if (prePwd.equals(prePwdTrue)) {
            therter.setPwd(pwd);
            if (therterManageService.modifyTherterPwd(therter)) {
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
        PayManageService payManageService = (PayManageService) EJBFactory.getEJB("PayManageServiceImpl", "momotickets.service.PayManageService");
        String result = "";
        String preApwd = request.getParameter("preApwd");
        String apwd = request.getParameter("apwd");
        String therterid = request.getParameter("therterid");
        Account account = payManageService.getAccount(therterid, UserType.THERTER);
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


    @ResponseBody
    @RequestMapping("/buyTicketsWithoutDisc")
    public String buyTicketsTherter(HttpServletRequest request) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        String seatChoose = request.getParameter("seatChoose");
        JSONArray seatChooseArray = JSONArray.fromObject(seatChoose);

        System.out.println("seats in controller: " + seatChooseArray);

        int showid = Integer.parseInt(request.getParameter("showid"));
        double priceTotal = Double.parseDouble(request.getParameter("priceTotal"));

        int amount = seatChooseArray.size();
        int[] rowList = new int[amount];
        int[] columnList = new int[amount];
        List<Seat> seats = new ArrayList<>();
        String therterid = therterManageService.getSingleShow(showid).getTherterid();
        Coupon coupon = null;
        Order order = null;
        Date ordertime = new Date();
        String result = "";


        coupon = null;
        order = new Order("offline", showid, 0, 1, amount, priceTotal, 0, 0, OrderType.PAYED, ordertime);


        //得到Seat列表
        for (int i = 0; i < amount; i++) {
            String[] strings = seatChooseArray.getString(i).split("_");
            rowList[i] = Integer.parseInt(strings[0]);
            columnList[i] = Integer.parseInt(strings[1]);
            Seat seat = therterManageService.getSingleSeat(therterid, showid, rowList[i], columnList[i]);
            Seat newSeat = new Seat(seat.getSeatid(), seat.getRow(), seat.getColumn(), seat.getShowid(), seat.getOrderid(), 1, seat.getSeatprice());
            seats.add(newSeat);
        }


        if (orderManageService.buyTicket(order, seats, coupon)) {
            result = "Success!";
        } else {
            result = "Fail! Please try again!";
        }
        return result;
    }
}

