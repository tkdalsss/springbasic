package com.hana.admin.app.data.msg;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Msg {
    private String sendid;
    private String receiveid;
    private String content1;
    private LocalDateTime time;
}
