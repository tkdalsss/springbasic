package com.hana.cust;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
public class SelectTests {

    @Autowired // test 에서는 RequiredArgsConstructor x
    CustService custService;

    @Test
    public void contextLoads() {
//        CustDto custDto = CustDto.builder().id("id75").pwd("pwd77").name("이말숙").build();
        List<CustDto> list = new ArrayList<>();
        try {
//            custService.add(custDto);
            list = custService.get();
            list.stream().forEach(c -> {
                log.info(c.toString());
            });
            log.info("------ OK ------");
        } catch (Exception e) {
            log.info("------- Fail -------");
            if (e instanceof SQLException){
                log.info("------ System Trouble EX0001 ------");
            } else if (e instanceof DuplicateKeyException) {
                log.info("------ ID Duplicated EX0002 ------");
            } else {
                log.info("------ Sorry EX0003 ------");
            }
            e.printStackTrace();
        }
    }
}
