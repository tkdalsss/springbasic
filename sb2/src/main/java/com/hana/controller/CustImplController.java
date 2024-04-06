package com.hana.controller;

import com.hana.app.service.CustService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class CustImplController {

    private final CustService custService;

    @RequestMapping("/cust/checkId")
    public boolean custCheckId(@RequestParam("id") String id) throws Exception {
        return custService.get(id) != null;
    }
}
