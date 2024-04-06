package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/html")
@RequiredArgsConstructor
public class HtmlController {

    private final CustService custService;

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
        List<CustDto> list = null;
//        list.add(new CustDto("id01", "pwd01", "james1"));
//        list.add(new CustDto("id02", "pwd02", "james2"));
//        list.add(new CustDto("id03", "pwd03", "james3"));
//        list.add(new CustDto("id04", "pwd04", "james4"));
//        list.add(new CustDto("id05", "pwd05", "james5"));

        try {
            list = custService.get();
            if (list == null) {
                throw new Exception();
            }
            model.addAttribute("custs", list);
            model.addAttribute("left", dir + "left");
            model.addAttribute("center", dir + "html3");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

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
