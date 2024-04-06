package com.hana.controller;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.AddrService;
import com.hana.app.service.CustService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/myPage")
@RequiredArgsConstructor
@Slf4j
public class MyPageController {

    private final CustService custService;
    private final AddrService addrService;

    String dir = "myPage/";

    @RequestMapping("/{id}")
    public String myPageMain(Model model, @PathVariable("id") String id) {
        log.info("TEST");
        CustDto custDto = null;
//        List<AddrDto> addrList = null;
        try {
            custDto = custService.get(id);
//            addrList = addrService.get();
        } catch (Exception e) {
            throw new RuntimeException();
        }
        model.addAttribute("cust", custDto);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

//    @RequestMapping("/addAddr")
//    public String addAddr(AddrDto addrDto) {
//        log.info(addrDto.toString());
//        try {
//            addrService.add(addrDto);
//
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//        return "redirect:/myPage/" + addrDto.getCustId();
//    }
//    public Object addAddr(AddrDto addrDto) {
//        return addrDto;
//    }

}
