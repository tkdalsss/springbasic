package com.hana.admin.scheduler;

import com.hana.admin.app.data.msg.AdminMsg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
@Slf4j
@RequiredArgsConstructor
public class Scheduler {

    private final SimpMessageSendingOperations simpMessageSendingOperations; // web socket 으로 객체를 전달

    @Scheduled(cron = "*/3 * * * * *")
    public void cronJobDailyUpdate() {
//        log.info("-------------------------------");
//        log.info("사용자 로그인 정보를 조회하여 로그를 기록");
//        log.info("-------------------------------");
        Random r = new Random();
        int content1 = r.nextInt(100) + 1;
        int content2 = r.nextInt(1000) + 1;
        int content3 = r.nextInt(500) + 1;
        int content4 = r.nextInt(10) + 1;
        AdminMsg adminMsg = new AdminMsg(content1, content2, content3, content4);
//        adminMsg.setContent1(content1);
//        adminMsg.setContent2(content2);
//        adminMsg.setContent3(content3);
//        adminMsg.setContent4(content4);
        simpMessageSendingOperations.convertAndSend("/send2", adminMsg);
    }

    @Scheduled(cron = "1 0 0 1,8,15,22 * *")
    public void cronJobWeeklyUpdate() {

    }
}
