package com.hana.admin.app.repository;

//import com.hana.app.data.dto.AddrDto;
//import com.hana.app.frame.HanaRepository;
import com.hana.admin.app.data.dto.AddrDto;
import com.hana.admin.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AddrRepository extends HanaRepository<Long, AddrDto> {
    public List<AddrDto> getAddrByCustId(String custId);
}
