package com.hana.admin.app.repository;

//import com.hana.app.data.dto.ItemDto;
//import com.hana.app.frame.HanaRepository;
import com.hana.admin.app.data.dto.ItemDto;
import com.hana.admin.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ItemRepository extends HanaRepository<Integer, ItemDto> {

}
