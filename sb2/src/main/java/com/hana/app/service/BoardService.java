package com.hana.app.service;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService implements HanaService<Integer, BoardDto> {

    private final BoardRepository boardRepository;

    @Override
    public int add(BoardDto boardDto) throws Exception {
        return boardRepository.insert(boardDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return boardRepository.delete(integer);
    }

    @Override
    public int modify(BoardDto boardDto) throws Exception {
        return boardRepository.update(boardDto);
    }

    @Override
    public BoardDto get(Integer integer) throws Exception {
        return boardRepository.selectOne(integer);
    }

    @Override
    public List<BoardDto> get() throws Exception {
        return boardRepository.select();
    }

    public void updateCnt(int id) throws Exception {
        boardRepository.updateBoardCnt(id);
    }

    public List<BoardDto> getByCustId(String custId) throws Exception {
        return boardRepository.getByCustId(custId);
    }

    public List<BoardDto> getRank() throws Exception {
        return boardRepository.getRank();
    }
}
