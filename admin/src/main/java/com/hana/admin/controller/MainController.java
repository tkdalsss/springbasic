package com.hana.admin.controller;

import com.hana.admin.app.data.dto.AdminDto;
import com.hana.admin.app.service.AdminService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {

    private final AdminService adminService;

    @Value("${app.url.server-url}")
    String serverUrl;

    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("chartUrl", serverUrl);
        return "index";
    }

    @RequestMapping("/websocket")
    public String webSocket(Model model) {
        model.addAttribute("serverUrl", serverUrl);
        model.addAttribute("center", "websocket");
        return "index";
    }

    @RequestMapping("/loginImpl")
    public String adminLogin(Model model, AdminDto adminDto, HttpSession session) {
        AdminDto checkDto = null;
        try {
            checkDto = adminService.get(adminDto.getId());
            if (checkDto == null) throw new Exception();
            if (!adminDto.getPwd().equals(checkDto.getPwd())) throw new Exception();
            log.info("Login Success...");
            session.setAttribute("admin", checkDto);

            // oadmin, sadmin -> cust, item
            if (checkDto.getRole().getRoleName().equals("superadmin") || checkDto.getRole().getRoleName().equals("opadmin")) {
                session.setAttribute("author", "ok");
            }

        } catch (Exception e) {
            log.info("Login Failed....");
            throw new RuntimeException(e);
        }
        return "redirect:/";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
}
