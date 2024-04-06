package com.hana.admin.app.repository;

import com.hana.admin.app.data.dto.AdminDto;
import com.hana.admin.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdminRepository extends HanaRepository<String, AdminDto> {
}
