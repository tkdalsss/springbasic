package com.hana.admin.app.service;

//import com.hana.app.data.dto.CustDto;
//import com.hana.app.frame.HanaService;
//import com.hana.app.repository.CustRepository;
import com.hana.admin.app.data.dto.CustDto;
import com.hana.admin.app.frame.HanaService;
import com.hana.admin.app.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustService implements HanaService<String, CustDto> {

    private final CustRepository custRepository;

    @Override
    public int add(CustDto custDto) throws DuplicateKeyException, Exception {
        return custRepository.insert(custDto);
    }

    @Override
    public int del(String s) throws Exception {
        return custRepository.delete(s);
    }

    @Override
    public int modify(CustDto custDto) throws Exception {
        return custRepository.update(custDto);
    }

    @Override
    public CustDto get(String s) throws Exception {
        return custRepository.selectOne(s);
    }

    @Override
    public List<CustDto> get() throws Exception {
        return custRepository.select();
    }
}
