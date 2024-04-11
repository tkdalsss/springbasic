package com.hana.admin.app.data.msg;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Msg {
    private String sendid;
    private String receiveid;
    private String content1;
}
