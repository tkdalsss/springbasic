package com.hana.admin.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddrDto {
    private long addrId;
    private String addrName;
    private String addrDetail;
    private String custId;
}
