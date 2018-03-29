package momotickets.controller;

import momotickets.enumtype.CheckType;
import momotickets.enumtype.OrderType;
import momotickets.enumtype.TimeType;
import momotickets.factory.EJBFactory;
import momotickets.model.*;
import momotickets.service.OrderManageService;
import momotickets.service.TherterManageService;
import momotickets.service.UserManageService;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/show")
public class ShowController {
    private static final long serialVersionUID = 1L;

    @RequestMapping(value = "/homepage", method = RequestMethod.GET)
    public ModelAndView getShowHomepage() {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        ModelAndView modelAndView = new ModelAndView("/show/showHomepage");
        modelAndView.addObject("showList", therterManageService.getShow(TimeType.NOW));
        return modelAndView;
    }

    @RequestMapping(value = "/{showid}/detail", method = RequestMethod.GET)
    public ModelAndView getDetailShow(@PathVariable("showid") int showid) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        ModelAndView modelAndView = new ModelAndView("/show/showDetail");
        String therterid = therterManageService.getSingleShow(showid).getTherterid();
        modelAndView.addObject("show", therterManageService.getSingleShow(showid));
        modelAndView.addObject("therter", therterManageService.getTherter(therterid, CheckType.CHECKED));
        return modelAndView;
    }

    @RequestMapping(value = "/{showid}/buyTickets", method = RequestMethod.GET)
    public ModelAndView getBuyTicketsShow(@PathVariable("showid") int showid) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        ModelAndView modelAndView = new ModelAndView("/show/buyTickets");
        String therterid = therterManageService.getSingleShow(showid).getTherterid();
        modelAndView.addObject("show", therterManageService.getSingleShow(showid));
        modelAndView.addObject("therter", therterManageService.getTherter(therterid, CheckType.CHECKED));
        modelAndView.addObject("discounts", therterManageService.getDiscount(therterid));
        modelAndView.addObject("coupons", therterManageService.getCoupon(therterid));
        modelAndView.addObject("seatBoughtList", therterManageService.getSeatsByShow(therterid, showid, 1));
        System.out.print("seatBoughtList.size: " + therterManageService.getSeatsByShow(therterid, showid, 1).size());
        return modelAndView;
    }

    @RequestMapping(value = "/{showid}/buyNotChoose", method = RequestMethod.GET)
    public ModelAndView getBuyNotChoose(@PathVariable("showid") int showid) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        ModelAndView modelAndView = new ModelAndView("/show/buyNotChoose");
        String therterid = therterManageService.getSingleShow(showid).getTherterid();
        modelAndView.addObject("show", therterManageService.getSingleShow(showid));
        modelAndView.addObject("therter", therterManageService.getTherter(therterid, CheckType.CHECKED));
        modelAndView.addObject("discounts", therterManageService.getDiscount(therterid));
        modelAndView.addObject("coupons", therterManageService.getCoupon(therterid));
        modelAndView.addObject("seatRemainList", therterManageService.getSeatsByShow(therterid, showid, 0));
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping("/redeemCoupon")
    public String redeemCoupon(HttpServletRequest request) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        UserManageService userManageService = (UserManageService) EJBFactory.getEJB("UserManageServiceBean", "momotickets.service.UserManageService");
        String memberid = request.getParameter("memberid");
        int couponid = Integer.parseInt(request.getParameter("couponid"));
        Coupon coupon = therterManageService.getSingleCoupon(couponid);
        Member member = userManageService.getMember(memberid);
        if (member.getPoint() >= coupon.getPoint()) {
            if (userManageService.redeemCoupon(memberid, coupon)) {
                return "Success!";
            } else {
                return "Fail! Please try again!";
            }

        } else {
            return "Point not enough!";
        }
    }

    @ResponseBody
    @RequestMapping("/buyTicketsChooseSeat")
    public String buyTicketsChoose(HttpServletRequest request) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        String seatChoose = request.getParameter("seatChoose");
        JSONArray seatChooseArray = JSONArray.fromObject(seatChoose);

        System.out.println("seats in controller: " + seatChooseArray);

        String memberid = request.getParameter("memberid");
        int showid = Integer.parseInt(request.getParameter("showid"));
        double priceTotal = Double.parseDouble(request.getParameter("priceTotal"));
        int couponid = Integer.parseInt(request.getParameter("couponid"));
        double discReduce = Double.parseDouble(request.getParameter("discReduce"));
        int amount = seatChooseArray.size();
        int[] rowList = new int[amount];
        int[] columnList = new int[amount];
        List<Seat> seats = new ArrayList<>();
        String therterid = therterManageService.getSingleShow(showid).getTherterid();
        Coupon coupon = null;
        Order order = null;
        Date ordertime = new Date();
        String result = "";

        if (couponid != 0) {
            coupon = therterManageService.getSingleCoupon(couponid);
            order = new Order(memberid, showid, 1, 1, amount, priceTotal, discReduce, coupon.getReduceprice(), OrderType.WAIT, ordertime);

        } else {
            coupon = null;
            order = new Order(memberid, showid, 1, 1, amount, priceTotal, discReduce, 0, OrderType.WAIT, ordertime);
        }

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

    @ResponseBody
    @RequestMapping("/buyTicketsWithoutChoosing")
    public String buyTicketsWithoutChoosingseat(HttpServletRequest request) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        OrderManageService orderManageService = (OrderManageService) EJBFactory.getEJB("OrderManageServiceImpl", "momotickets.service.OrderManageService");
        String memberid = request.getParameter("memberid");
        int showid = Integer.parseInt(request.getParameter("showid"));
        double priceTotal = Double.parseDouble(request.getParameter("priceTotal"));
        int couponid = Integer.parseInt(request.getParameter("couponid"));
        double discReduce = Double.parseDouble(request.getParameter("discReduce"));
        int amount = Integer.parseInt(request.getParameter("amount"));

        String therterid = therterManageService.getSingleShow(showid).getTherterid();
        Coupon coupon = null;
        Order order = null;
        Date ordertime = new Date();
        String result = "";

        if (couponid != 0) {
            coupon = therterManageService.getSingleCoupon(couponid);
            order = new Order(memberid, showid, 1, 0, amount, priceTotal, discReduce, coupon.getReduceprice(), OrderType.WAIT, ordertime);

        } else {
            coupon = null;
            order = new Order(memberid, showid, 1, 0, amount, priceTotal, discReduce, 0, OrderType.WAIT, ordertime);
        }

        if (orderManageService.buyTicket(order, null, coupon)) {
            result = "Success!";
        } else {
            result = "Fail! Please try again!";
        }

        return result;
    }


}
