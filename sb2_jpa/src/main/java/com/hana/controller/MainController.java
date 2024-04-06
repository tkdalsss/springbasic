package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Random;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    private final CustService custService;

    @RequestMapping("/")
    public String main() {
        Random r = new Random();
        int num = r.nextInt(100) + 1;
        log.info(num + "");
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

        CustDto custDto = null;
        try {
            custDto = custService.get(id);
            if (custDto == null) {
                throw new Exception();
            }
            if (!custDto.getPwd().equals(pwd)) {
                log.info("Login Failed...");
                model.addAttribute("center", "loginFail");
                throw new Exception();
            }
            log.info("Login Success!");
//                session.setMaxInactiveInterval(1000);
            session.setAttribute("id", id);

        } catch (Exception e) {
            model.addAttribute("center", "loginFail");
        }
        return "index";
    }

    @RequestMapping("/logout")
    public String logOut(Model model, HttpSession session) {
        // Single-Sign on
        if (session != null) session.invalidate();
        log.info("LogOut...");
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

        try {
            custService.add(custDto);
            session.setAttribute("id", custDto.getId());
        } catch (Exception e) {
            model.addAttribute("center", "registerfail");
        }

        model.addAttribute("center", "center");
        return "index";
    }

}
