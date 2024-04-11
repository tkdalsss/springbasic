package com.hana.admin.controller;

import com.hana.admin.app.data.msg.Msg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MsgController {

    final SimpMessagingTemplate template;

    @MessageMapping("/receiveall")
    public void receiveall(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        log.info(msg.toString());
        template.convertAndSend("/send", msg);
    }

    @MessageMapping("/receiveme")
    public void receiveme(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        log.info(msg.toString());
        String id = msg.getSendid();
        template.convertAndSend("/send/" + id, msg);
    }

    @MessageMapping("/receiveto")
    public void receiveto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        String id = msg.getSendid();
        String target = msg.getReceiveid();
        log.info("------------------");
        log.info(target);

        template.convertAndSend("/sent/to/" + target, msg);
    }
}
