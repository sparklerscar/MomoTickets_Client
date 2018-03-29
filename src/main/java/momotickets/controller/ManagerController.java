package momotickets.controller;

import momotickets.enumtype.CheckType;
import momotickets.enumtype.StrEnumChange;
import momotickets.enumtype.TimeType;
import momotickets.factory.EJBFactory;
import momotickets.model.Show;
import momotickets.model.Therter;
import momotickets.service.PayManageService;
import momotickets.service.TherterManageService;
import momotickets.service.UserManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/ticketManager")
public class ManagerController {
    private static final long serialVersionUID = 1L;

    @RequestMapping("/{manager}/checkTherter")
    public ModelAndView checkTherterRegisterOrModify(@PathVariable("manager") String managerid) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        List<Therter> thertersR = therterManageService.getTherterCheck(CheckType.REGISTER);
        List<Therter> thertersM = therterManageService.getTherterCheck(CheckType.CHANGE);
        ModelAndView modelAndView = new ModelAndView("/manager/managerCheckTherter");
        modelAndView.addObject("thertersR", thertersR);
        modelAndView.addObject("thertersM", thertersM);
        return modelAndView;
    }

    @RequestMapping("/{manager}/settleShow")
    public ModelAndView settleOrderOfShow(@PathVariable("manager") String managerid) {
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        List<Show> showListY = therterManageService.getShowSettle(1);
        List<Show> showListN = therterManageService.getShowSettle(0);
        ModelAndView modelAndView = new ModelAndView("/manager/managerShow");
        modelAndView.addObject("showListY", showListY);
        modelAndView.addObject("showListN", showListN);
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping("/therterRegisterOrModifyCheck")
    public String checkTherterRegisterOrModify(HttpServletRequest request) {
        UserManageService userManageService = (UserManageService) EJBFactory.getEJB("UserManageServiceBean", "momotickets.service.UserManageService");
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        StrEnumChange strEnumChange = new StrEnumChange();
        String therterid = request.getParameter("therterid");
        int ifPassedInt = Integer.parseInt(request.getParameter("ifPassed"));
        Boolean ifPassed = false;
        if (ifPassedInt == 1) {
            ifPassed = true;
        }
        CheckType checkType = (CheckType) strEnumChange.Str2Enum(request.getParameter("checkType"));
        String result = "";

        Therter therterBefore = null;
        Therter therterModify = null;
        if (checkType.equals(CheckType.CHANGE)) {
            therterModify = therterManageService.getTherter(therterid, checkType);
            if (userManageService.checkTherterInfo(therterModify, ifPassed, checkType)) {
                result = "Success!";
            } else {
                result = "Fail! Please try again!";
            }
        } else {//register
            therterBefore = therterManageService.getTherter(therterid, checkType);
            if (userManageService.checkTherterInfo(therterBefore, ifPassed, checkType)) {
                result = "Success!";
            } else {
                result = "Fail! Please try again!";
            }
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/settleSingleShowById")
    public String settleShowById(HttpServletRequest request) {
        PayManageService payManageService = (PayManageService) EJBFactory.getEJB("PayManageServiceImpl", "momotickets.service.PayManageService");
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        int showid = Integer.parseInt(request.getParameter("showid"));
        String result = "";
        if(payManageService.handleSettle(showid)){
            result = "Success!";
        } else {
            result = "Fail! Please try again!";
        }
        return result;
    }
}
