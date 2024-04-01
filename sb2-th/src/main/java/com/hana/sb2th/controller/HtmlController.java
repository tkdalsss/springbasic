package com.hana.sb2th.controller;

import com.hana.sb2th.app.data.dto.CustDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/html")
public class HtmlController {

    String dir = "html/";

    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/html1")
    public String html1(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "html1");
        return "index";
    }

    @RequestMapping("/html2")
    public String html2(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "html2");
        return "index";
    }

    @RequestMapping("/html3")
    public String html3(Model model) {
        List<CustDto> list = new ArrayList<>();
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id02", "pwd02", "james2"));
        list.add(new CustDto("id03", "pwd03", "james3"));
        list.add(new CustDto("id04", "pwd04", "james4"));
        list.add(new CustDto("id05", "pwd05", "james5"));

        model.addAttribute("custs", list);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "html3");
        return "index";
    }

    @RequestMapping("/html3/get")
    public String get(Model model, @RequestParam("id") String id) {
        CustDto c = CustDto.builder().id(id).pwd("pwdxx").name("jamesx").build();
        model.addAttribute("cust", c);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "get");
        return "index";
    }
}
