package momotickets.controller;


import momotickets.factory.EJBFactory;
import momotickets.model.Member;
import momotickets.service.StatisticsManageService;
import momotickets.service.TherterManageService;
import momotickets.service.UserManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by sparkler on 2018/3/9.
 */
@Controller
@RequestMapping(value = "/ticketManager")
public class StatisticsController {
    private static final long serialVersionUID = 1L;

    @RequestMapping(value = "/{managerid}/statistics")
    public ModelAndView getStatistics(@PathVariable("managerid") String managerid) {
        StatisticsManageService statisticsManageService = (StatisticsManageService) EJBFactory.getEJB("StatisticsManageServiceImpl", "momotickets.service.StatisticsManageService");

        List<Member> memberList = statisticsManageService.getAllMember();
        int[] viplevel = {0, 1, 2, 3, 4};
        int[] levelNum = {0, 0, 0, 0, 0};
        for (int i = 0; i < memberList.size(); i++) {
            for (int j = 0; j < 5; j++) {
                if (memberList.get(i).getViplevel() == viplevel[j]) {
                    levelNum[j] += 1;
                }
            }
        }
        Map map = statisticsManageService.getTotalOfShow();
        List showName = (List) map.get("showName");
        List totalMoney = (List) map.get("totalMoney");

        ModelAndView modelAndView = new ModelAndView("/manager/managerStatistics");
        modelAndView.addObject("viplevel", viplevel);
        modelAndView.addObject("levelNum", levelNum);
        modelAndView.addObject("showName", showName);
        modelAndView.addObject("totalMoney", totalMoney);

        return modelAndView;
    }

}

