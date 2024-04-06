package com.hana.app.data.dto;

import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CustDto {
    private String id;
    private String pwd;
    private String name;
//    private List<AddrDto> addrs;
}
