package com.hana.admin;

import com.hana.admin.app.data.dto.AdminDto;
import com.hana.admin.app.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class SelectTests {

    @Autowired
    AdminService adminService;

    @Test
    void contextLoads() {
        List<AdminDto> list = null;
        try {
            list = adminService.get();
            list.forEach(a -> {
                log.info(a.toString());
            });
            log.info("------- OK -------");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
