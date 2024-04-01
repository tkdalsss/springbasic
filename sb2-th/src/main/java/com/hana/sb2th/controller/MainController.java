package com.hana.sb2th.controller;

import com.hana.sb2th.app.data.dto.CustDto;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
public class MainController {

    @RequestMapping("/")
    public String main() {
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginImpl(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session) {
        log.info("-----------------------");
        log.info(id + " " + pwd);
        if (id.equals("qqq") && pwd.equals("111")) {
            log.info("Login Success!");
            session.setMaxInactiveInterval(1000);
            session.setAttribute("id", id);
//            session.setAttribute("pwd", pwd);
//            model.addAttribute("center", "center");
        } else {
            log.info("Login Failed...");
            model.addAttribute("center", "loginFail");
        }
        return "index";
    }

    @RequestMapping("/logout")
    public String logOut(Model model, HttpSession session) {
        // Single-Sign on
        if (session != null) session.invalidate();
        log.info("LogOut...");
//        model.addAttribute("center", "center");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/registerImpl")
    public String registerImpl(Model model, CustDto custDto, HttpSession session) {
        log.info("-------- register ---------");
        log.info(custDto.getId() + ' ' + custDto.getPwd() + ' ' + custDto.getName() + ' ');
        session.setAttribute("id", custDto.getId());
        model.addAttribute("center", "center");
        return "index";
    }




}
