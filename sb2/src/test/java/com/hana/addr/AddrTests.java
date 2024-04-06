package com.hana.addr;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.service.AddrService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class AddrTests {

    @Autowired
    AddrService addrService;

    @Test
    void contextLoads() {
        try {
            AddrDto addrDto = new AddrDto(0, "집42", "서울시 성동구", "id12");
            addrService.add(addrDto);
            addrService.get();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
