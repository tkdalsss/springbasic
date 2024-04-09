package com.hana.weather;

import com.hana.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

@SpringBootTest
@Slf4j
class Test {
    @org.junit.jupiter.api.Test
    void contextLoads() throws IOException, ParseException {
        String key = "byn7EKhuMH15jiFlXFuY3tXV76KZ818WonxT%2B7yGH5U3eDWy2oosNxm1YrjMZAk%2F0VghaPtumJrZBZFXQm91KA%3D%3D";
        String loc = "109";
        JSONObject jsonObject = (JSONObject) WeatherUtil.getWeather(loc, key);
        log.info("====== LOG ======");
        log.info(jsonObject.toString());
    }
}
