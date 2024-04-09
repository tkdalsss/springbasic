package com.hana.comment;

import com.hana.app.data.dto.CommentDto;
import com.hana.app.service.CommentService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class InsertTests {
    @Autowired
    CommentService commentService;

    @Test
    public void contextLoads() {
        CommentDto commentDto = CommentDto.builder().custId("id04").commentContent("댓글").boardId(3).build();

        try {
            commentService.add(commentDto);
            log.info("-------- ok ----------");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
