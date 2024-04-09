package com.hana.controller;

import com.github.pagehelper.PageInfo;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/cust")
@RequiredArgsConstructor
public class CustController {

    private final CustService custService;

    String dir = "cust/";

    @RequestMapping("/")
    public String custMain(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center",  dir + "center");
        return "index";
    }

    @RequestMapping("/add")
    public String addCust(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addImpl")
    public String addImpl(Model model, CustDto custDto, HttpSession session) {
//        CustDto addCustDto = null;
        try {
            custService.add(custDto);
            session.setAttribute("id", custDto.getId());
        } catch(Exception e) {
            throw new RuntimeException(e);
        }
//        model.addAttribute("center", "center");
        return "redirect:/cust/detail?id=" + custDto.getId();
    }

    @RequestMapping("/detail")
    public String addImpl(Model model, @RequestParam("id") String id) {
        CustDto custDto = null;
        try {
            custDto = custService.get(id);
            model.addAttribute("cust", custDto);
            model.addAttribute("left", dir + "left");
            model.addAttribute("center", dir + "detail");
        } catch(Exception e) {
            throw new RuntimeException(e);
        }
//        model.addAttribute("center", "center");
        return "index";
    }

    @RequestMapping("/get")
    public String getCustList(Model model) {
        List<CustDto> custList = null;
        try {
            custList = custService.get();
            model.addAttribute("custs", custList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "get");

        return "index";
    }

    @RequestMapping("/allpage")
    public String allpage(Model model, @RequestParam("pageNo") int pageNo) {
        PageInfo<CustDto> p;
        try {
            p = new PageInfo<>(custService.getPage(pageNo), 5);
            model.addAttribute("cpage", p);
            model.addAttribute("target", "/cust/");
            model.addAttribute("left", "left");
            model.addAttribute("center", dir + "allpage");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

}
