package com.hana.admin.app.repository;

//import com.hana.app.data.dto.CustDto;
//import com.hana.app.frame.HanaRepository;
import com.hana.admin.app.data.dto.CustDto;
import com.hana.admin.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CustRepository extends HanaRepository<String, CustDto> {
}
