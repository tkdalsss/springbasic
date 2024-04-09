package com.hana.admin.controller;

import com.hana.admin.app.data.dto.CustDto;
import com.hana.admin.app.repository.CustRepository;
import com.hana.admin.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.DispatcherServlet;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
@RequiredArgsConstructor
@Slf4j
public class CustController {

    private final CustService custService;

    String dir = "cust/";

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", dir + "register");
        return "index";
    }

    @RequestMapping("/addImpl")
    public String addCust(Model model, CustDto custDto) {
//        CustDto checkDto = null;
        try {
            if (custService.get(custDto.getId()) != null) {
                log.info("중복 회원");
                throw new DuplicateKeyException("중복");
            }
            custService.add(custDto);
            log.info(custDto.getId() + " 회원 등록 완료");
            log.info("===========");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/cust/get";
    }

    @RequestMapping("/get")
    public String get(Model model, HttpSession session){
        List<CustDto> list = null;
        try {
//            log.info(String.valueOf(checkValidateAccess(session.getAttribute("author").toString())));
            if (!checkValidateAccess(session.getAttribute("author").toString())) throw new RuntimeException();
            list = custService.get();
            model.addAttribute("custs", list);
            model.addAttribute("center", dir+"get");
        } catch (Exception e) {
            log.info("Data doesn't find");
            throw new RuntimeException("ER0001");
        }

        return "index";
    }

    @RequestMapping("/get/{id}")
    public String getCustDetail(@PathVariable("id") String id, Model model, HttpSession session) {
        CustDto custDto = null;
        try {
            if (!checkValidateAccess(session.getAttribute("author").toString())) throw new RuntimeException();
            custDto = custService.get(id);
            model.addAttribute("cust", custDto);
            model.addAttribute("center", dir + "detail");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @RequestMapping("/update")
    public String updateCustInfo(CustDto custDto, HttpSession session) {
        try {
            if (!checkValidateAccess(session.getAttribute("author").toString())) throw new RuntimeException();
            custService.modify(custDto);
            log.info(custDto.toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/cust/get";
    }

    @RequestMapping("/delete")
    public String custDelete(@RequestParam("id") String id) {
        try {
            custService.del(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/cust/get";
    }

    @ResponseBody
    @RequestMapping("/checkId")
    public Object checkId(@RequestParam("id") String id) throws Exception {
        boolean result = true;
        CustDto custDto = custService.get(id);
        if (custDto != null) result = false;
        return result;
    }

//    DispatcherServlet

    private static boolean checkValidateAccess(String value){
        log.info(value);
        return value.equals("ok");
    }
}
