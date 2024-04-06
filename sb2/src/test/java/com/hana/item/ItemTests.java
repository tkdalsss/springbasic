package com.hana.item;

import com.hana.app.data.dto.ItemDto;
import com.hana.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;

@SpringBootTest
@Slf4j
class ItemTests {

    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        try {
            ItemDto itemDto = new ItemDto(1, "Pants", 30000, "a.jpg", LocalDate.now(), LocalDate.now());

            // select
            itemService.get();
            // insert
            ItemDto newItemDto = new ItemDto(0, "Outer", 35000, "b.jpg", LocalDate.now(), LocalDate.now());
            itemService.add(newItemDto);
            // delete
            itemService.del(2);
            // update
            itemService.modify(itemDto);
//            log.info(itemService.get(1).toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
