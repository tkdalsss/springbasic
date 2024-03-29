package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RestController
public class AjaxImplController {

    @RequestMapping("/getServerTime")
    public Object getServerTime() {
        Date date = new Date();
        return date;
    }

    @RequestMapping("/getData")
    public Object getData(){
        List<String> list = new ArrayList<>();
        for (int i = 0; i<10; i++){
            Random random = new Random();
            String tmp = "casetify" + String.valueOf(random.nextInt(1, 100) + 1);
            list.add(tmp);
        }
        return list;
    }



    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("id") String id) {
        String result = "1";
        if (id.equals("qqq")) {
            // db에 이미 있음
            result = "0";
        }
        return result;
    }
}
