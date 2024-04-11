package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.BoardService;
import com.hana.app.service.CustService;
import com.hana.util.WeatherUtil;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;
import java.util.Random;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    private final CustService custService;
    private final BoardService boardService;

    @Value("${app.key.wkey}")
    String wkey;

    @Value("${app.key.owkey}")
    String owkey;

    @RequestMapping("/")
    public String main(Model model) {
        List<BoardDto> list = null;

        try {
            list = boardService.getRank();
            model.addAttribute("ranks", list);
        } catch (Exception e) {
            throw new RuntimeException();
        }

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
//                model.addAttribute("center", "loginFail");
                throw new Exception();
            }
            log.info("Login Success!");
//                session.setMaxInactiveInterval(1000);
            session.setAttribute("id", id);

        } catch (Exception e) {
            model.addAttribute("errorMsg", "ID 또는 PW가 일치하지 않습니다.");
            model.addAttribute("center", "login");
        }
        return "redirect:/";
    }

    @RequestMapping("/logout")
    public String logOut(Model model, HttpSession session) {
        // Single-Sign on
        if (session != null) session.invalidate();
        log.info("LogOut...");
        return "redirect:/";
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

    @ResponseBody
    @RequestMapping("/registerIdCheck")
    public Object checkDuplicateId(Model model, @RequestParam("id") String id) throws Exception {
        String result = "0";
        CustDto custDto = custService.get(id);
        if (custDto == null) {
            result = "1";
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/wh")
    public Object wh(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather("109", wkey);
    }

    @RequestMapping("/openWeatherMap")
    public String owm(Model model) {
        model.addAttribute("center", "openWeatherMap");
        return "index";
    }

    @ResponseBody
    @RequestMapping("/owm")
    public Object owm(@RequestParam("loc") String loc) throws IOException, ParseException {
        return WeatherUtil.getWeather2(loc, owkey);
    }

}
