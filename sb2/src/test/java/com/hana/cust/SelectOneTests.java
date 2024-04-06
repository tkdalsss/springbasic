package com.hana.cust;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
public class SelectOneTests {

    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
        try {
            CustDto custDto = null;
            custDto = custService.get("id03");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
