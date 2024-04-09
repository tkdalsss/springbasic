package com.hana.app.repository;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BoardRepository extends HanaRepository<Integer, BoardDto> {
    void updateBoardCnt(int id);
    List<BoardDto> getByCustId(String custId);
    List<BoardDto> getRank() throws Exception;
}
