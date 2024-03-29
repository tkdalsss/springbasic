package com.hana.admin.controller;

import com.hana.admin.app.data.dto.CustDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
public class CustController {

    String dir = "cust/";

    @RequestMapping("/get")
    public String get(Model model){
        List<CustDto> list = new ArrayList<>();
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));
        list.add(new CustDto("id01", "pwd01", "james1"));

        model.addAttribute("custs", list);
        model.addAttribute("center", dir+"get");
        return "index";
    }
}
