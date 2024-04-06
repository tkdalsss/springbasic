package com.hana.admin.app.data.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RoleDto {
    private int roleId;
    private String roleName;
}
