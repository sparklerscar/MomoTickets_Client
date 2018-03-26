package momotickets.controller;


import momotickets.enumtype.StrEnumChange;
import momotickets.enumtype.TimeType;
import momotickets.enumtype.UserType;
import momotickets.factory.EJBFactory;
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
public class UserController {
    private static final long serialVersionUID = 1L;

    @RequestMapping(value = "/{userid}/memberInfo", method = RequestMethod.GET)
    public ModelAndView getMemberInfo(@PathVariable String userid,
                                      HttpSession session) {
        UserManageService userManageService = (UserManageService) EJBFactory.getEJB("UserManageServiceBean", "momotickets.service.UserManageService");
        PayManageService payManageService = (PayManageService) EJBFactory.getEJB("PayManageServiceImpl", "momotickets.service.PayManageService");
        //        StrEnumChange strEnumChange = new StrEnumChange();
        ModelAndView modelAndView = new ModelAndView("/member/memberInfo");
        modelAndView.addObject("member", userManageService.getMember(userid));
        modelAndView.addObject("account", payManageService.getAccount(userid,UserType.MEMBER));
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
}

