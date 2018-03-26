package momotickets.controller;


import momotickets.enumtype.CheckType;
import momotickets.enumtype.ReturnType;
import momotickets.enumtype.StrEnumChange;
import momotickets.enumtype.UserType;
import momotickets.factory.EJBFactory;
import momotickets.model.Therter;
import momotickets.service.PayManageService;
import momotickets.service.TherterManageService;
import momotickets.service.UserManageService;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by sparkler on 2018/3/9.
 */
@Controller
@RequestMapping(value = "/")
public class MainController {
    private static final long serialVersionUID = 1L;

    //记得在web.xml中设置spring
    @RequestMapping("")
    public String getIndex() {
        return "index";
    }

    @RequestMapping("/register/member")
    public String getRegisterMember() {
//        System.out.println("=================================================================");
        return "user/register";
    }

    @RequestMapping("/register/therter")
    public String getRegisterTherter() {
        return "user/registerTherter";
    }

    @RequestMapping("/login")
    public String getLogin() {
        return "user/login";
    }

    @RequestMapping("/homepage")
    public String getHomepage() {
        return "homepage";
    }

    @RequestMapping("/member/memberInfo")
    public String getMemberInfo() {
        return "/member/memberInfo";
    }

    @RequestMapping("/therter/therterInfo")
    public String getTherterInfo() {
        return "/therter/therterInfo";
    }


    @RequestMapping(value = "/register/member", method = RequestMethod.POST)
    public String doRegist(@RequestParam("email") String email,
                           @RequestParam("pwd1") String pwd1,
                           @RequestParam("pwd2") String pwd2,
                           @RequestParam("nickname") String nickname,
                           ModelMap model,
                           HttpServletRequest request) {
        // TODO Auto-generated method stub
        UserManageService userManageService = (UserManageService) EJBFactory.getEJB("UserManageServiceBean", "momotickets.service.UserManageService");
//        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        String message = "";
        boolean result = false;
        if (pwd1.equals(pwd2)) {
            result = userManageService.register(email, nickname, pwd1);
            System.out.println("******************************************\nmember register result : " + result);
            if (result) {
                return "/login";
            } else {
                message += "Please try again!<br>";
                model.addAttribute("mess", message);
                return "ErrorMessage";
            }
        } else {
            message += "Password not match!<br>";
            model.addAttribute("mess", message);
            return "ErrorMessage";
        }
    }

    @RequestMapping(value = "/register/therter", method = RequestMethod.POST)
    public String doRegistT(@RequestParam("name") String name,
                            @RequestParam("location") String location,
                            @RequestParam("telnum") String telnum,
                            @RequestParam("row") String row,
                            @RequestParam("column") String column,
                            @RequestParam("pwd1Therter") String pwd1Therter,
                            @RequestParam("pwd2Therter") String pwd2Therter,
                            ModelMap model,
                            HttpServletRequest request) {
        // TODO Auto-generated method stub
//        UserManageService userManageService = (UserManageService) EJBFactory.getEJB("UserManageServiceBean", "momotickets.service.UserManageService");
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
//        StrEnumChange strEnumChange = new StrEnumChange();
//        UserType userTypeE = (UserType) strEnumChange.Str2Enum(usertype);
        String message = "";
        boolean result = false;
//        if (userTypeE.equals(UserType.MEMBER)) {
//            if (pwd1.equals(pwd2)) {
//                result = userManageService.register(email, nickname, pwd1);
//                System.out.println("******************************************\nmember register result : " + result);
//            } else {
//                message += "Password not match!<br>";
//                model.addAttribute("mess", message);
//                return "ErrorMessage";
//            }
//        } else if (userTypeE.equals(UserType.THERTER)) {
        if (pwd1Therter.equals(pwd2Therter)) {
            Therter therter = new Therter();
            therter.setCheck(CheckType.REGISTER);
            therter.setName(name);
            therter.setPwd(pwd1Therter);
            therter.setLocation(location);
            therter.setTelnum(telnum);
            therter.setSeat(Integer.valueOf(row) * Integer.valueOf(column));
            therter.setRow(Integer.valueOf(row));
            therter.setColumn(Integer.valueOf(column));
            result = therterManageService.registerTherter(therter);
            System.out.println("******************************************\ntherter register result : " + result);
            if (result == true) {
                return "/login";
            } else {
                message += "Please try again!<br>";
                model.addAttribute("mess", message);
                return "ErrorMessage";
            }
        } else {
            message += "Password not match!<br>";
            model.addAttribute("mess", message);
            return "ErrorMessage";
        }
    }


    //    @ResponseBody是作用在方法上的，@ResponseBody 表示该方法的返回结果直接写入 HTTP response body 中，
// 一般在异步获取数据时使用【也就是AJAX】，
// 在使用 @RequestMapping后，返回值通常解析为跳转路径，
// 但是加上 @ResponseBody 后返回结果不会被解析为跳转路径，而是直接写入 HTTP response body 中。
// 比如异步获取 json 数据，加上 @ResponseBody 后，会直接返回 json 数据。
// @RequestBody 将 HTTP 请求正文插入方法中，使用适合的 HttpMessageConverter 将请求体写入某个对象。
//    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String doLogin(@RequestParam("usertype") String usertype,
                          @RequestParam("userid") String userid,
                          @RequestParam("pwd") String pwd,
                          HttpServletRequest request,
                          HttpServletResponse response) {
        UserManageService userManageService = (UserManageService) EJBFactory.getEJB("UserManageServiceBean", "momotickets.service.UserManageService");
        TherterManageService therterManageService = (TherterManageService) EJBFactory.getEJB("TherterManageServiceImpl", "momotickets.service.TherterManageService");
        StrEnumChange strEnumChange = new StrEnumChange();
        HttpSession session = null;
//        	ServletContext context = getServletContext();
        UserType userTypeE = (UserType) strEnumChange.Str2Enum(usertype);
        System.out.println("******************************************\nuser type: " + usertype);
        ReturnType returnType = userManageService.login(userid, userTypeE, pwd);
        System.out.println("******************************************\nreturn type: " + returnType);
        if (returnType.equals(ReturnType.SUCCESS)) {
            session = request.getSession(true);
            if (userTypeE.equals(UserType.MEMBER)) {
                session.setAttribute("member", userManageService.getMember(userid));
//                	context.getRequestDispatcher("/view/user/RegUser.jsp").forward(request, response);
                return "redirect:member/" + userid + "/memberInfo";
            } else if (userTypeE.equals(UserType.THERTER)) {
                session.setAttribute("therter", therterManageService.getTherter(userid, CheckType.CHECKED));
                return "redirect:/therter/" + userid + "/therterInfo";
            } else {
                session.setAttribute("manager", userManageService.getManager(userid));
                return "redirect:/manage";
            }
            //	model.addAttribute("user", user);
            //	context.getRequestDispatcher("/view/user/RegUser.jsp").forward(request, response);
        }
        //alert提醒
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print("<script>alert('" + returnType + "');" +
                    "window.location.href='/login';</script>");
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
//        finally {
//            IOUtils.closeQuietly(out);
//        }
        return "user/login";
//        return returnType;
    }




}

