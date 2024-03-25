package com.hana.app.data;

import lombok.*;

import java.time.LocalDate;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class CustDto {
    private String id;
    private String pwd;
    private String name;
    private LocalDate regdate;
}
