package com.hana.controller;

import com.hana.app.data.dto.*;
import com.hana.app.service.AddrService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.Response;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.temporal.ChronoField;
import java.util.*;

@RestController
@RequiredArgsConstructor
@Slf4j
public class AjaxImplController {

    private final AddrService addrService;

    @RequestMapping("/getServerTime")
    public Object getServerTime() {
        Date date = new Date();
        return date;
    }

    @RequestMapping("/getData")
    public Object getData() {
        List<String> list = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            Random random = new Random();
            String tmp = "casetify" + String.valueOf(random.nextInt(1, 100) + 1);
            list.add(tmp);
        }
        return list;
    }

    @RequestMapping("/geo/getdata")
    public Object getGeoData() {
        List<ShopDto> list = new ArrayList<>();
        list.add(new ShopDto(100, "순대국", "a.jpg", 37.5547611, 127.0654625));
        list.add(new ShopDto(101, "파스타", "b.jpg", 37.5347611, 127.0654625));
        list.add(new ShopDto(102, "햄버거", "c.jpg", 37.5147611, 127.0654625));
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

    @RequestMapping("/chart2")
    public Object chartData() {
        JSONArray ja = new JSONArray();

        List<Chart2Dto> list = new ArrayList<>();
        list.add(new Chart2Dto("S001",10,20,30,20,10,5));
        list.add(new Chart2Dto("S002",13,23,33,23,13,8));
        list.add(new Chart2Dto("S003",11,21,31,21,11,6));
        list.add(new Chart2Dto("S004",18,28,38,28,18,13));

        list.stream().forEach(c -> {
            JSONObject jo = new JSONObject();
            // [{name, data:[]}]
            jo.put("name", c.getName());
            jo.put("data", c.getM());
            ja.add(jo);
        });

//        for (Chart2Dto c : list) {
//            JSONObject jo = new JSONObject();
//            // [{name, data:[]}]
//            jo.put("name", c.getName());
//            jo.put("data", c.getM());
//            ja.add(jo);
//        }

        return ja;
    }

    @RequestMapping("/chart4")
    public Object chart4(@RequestParam("gender") String gender) {
        JSONArray ja = new JSONArray();

        List<Chart2Dto> list = new ArrayList<>();
        list.add(new Chart2Dto("f",30,10,10,10,20,20));
        list.add(new Chart2Dto("m",40,10,10,10,10,20));

        list.stream().filter(c -> c.getName().equals(gender))
                .forEach(c -> {
//                    JSONObject jo = new JSONObject();
//                    jo.put("Samsung", c.getM1());
//                    JSONArray ja2 = new JSONArray();
//                    ja2.add(c.getM());
                    c.getM().stream().forEach(n -> {
                        JSONArray ja2 = new JSONArray();
                        ja2.add("OTT");
                        ja2.add(n);
                        ja.add(ja2);
                    });
                });

        JSONObject jo = new JSONObject();
        jo.put("data", ja);
        jo.put("title", gender);

        return jo;
    }

    @RequestMapping("/chart/getChart3data1")
    public Object chart3Data1() {
        List<Chart3Dto1> list = new ArrayList<>();

        list.add(new Chart3Dto1("Installation & Developers",
                Arrays.asList(43934, 48656, 65165, 81827, 112143, 142383, 171533, 165174, 155157, 161454, 154610)));
        list.add(new Chart3Dto1("Manufacturing",
                Arrays.asList(24916, 37941, 29742, 29851, 32490, 30282, 38121, 36885, 33726, 34243, 31050)));
        list.add(new Chart3Dto1("Sales & Distribution",
                Arrays.asList(11744, 30000, 16005, 19771, 20185, 24377, 32147, 30912, 29243, 29213, 25663)));
        list.add(new Chart3Dto1("Operations & Maintenance",
                Arrays.asList(null, null, null, null, null, null, null, null, 11164, 11218, 10077)));
        list.add(new Chart3Dto1("Other",
                Arrays.asList(21908, 5548, 8105, 11248, 8989, 11816, 18274, 17300, 13053, 11906, 10073)));

        return list;
    }

    @RequestMapping("/getAddr/{id}")
    public List<AddrDto> getCustAddrList(@PathVariable("id") String id) throws Exception {
        return addrService.getCustAddr(id);
//        return addrService.get();
    }

    @RequestMapping("/myPage/addAddr")
    public ResponseEntity<String> addAddr(@RequestBody AddrDto addrDto, HttpServletResponse response) throws Exception {
        log.info(addrDto.toString());
        try {
            addrService.add(addrDto);
            response.setHeader("Location",addrDto.getCustId() );
            return new ResponseEntity<String>(HttpStatus.FOUND);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

//    @RequestMapping("/chart/getChart3data2")
//    public Object chart3Data2() {
//        List<Chart3Dto2> list = new ArrayList<>();
//
//        list.add(new Chart3Dto2("China",
//                Arrays.asList(2.5, 2.6, 2.7, 2.9, 3.1, 3.4, 3.5, 3.5, 3.4, 3.4, 3.4,
//                        3.5, 3.9, 4.5, 5.2, 5.9, 6.5, 7, 7.5, 7.9, 8.6, 9.5, 9.8,
//                        10, 10, 9.8, 9.7, 9.9, 10.3, 10.5, 10.7, 10.9)));
//        list.add(new Chart3Dto1("Manufacturing",
//                Arrays.asList(24916, 37941, 29742, 29851, 32490, 30282, 38121, 36885, 33726, 34243, 31050)));
//        list.add(new Chart3Dto1("Sales & Distribution",
//                Arrays.asList(11744, 30000, 16005, 19771, 20185, 24377, 32147, 30912, 29243, 29213, 25663)));
//        list.add(new Chart3Dto1("Operations & Maintenance",
//                Arrays.asList(null, null, null, null, null, null, null, null, 11164, 11218, 10077)));
//        list.add(new Chart3Dto1("Other",
//                Arrays.asList(21908, 5548, 8105, 11248, 8989, 11816, 18274, 17300, 13053, 11906, 10073)));
//
//        return list;
//    }
}
