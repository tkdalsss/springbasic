package com.hana.admin.app.service;

//import com.hana.app.data.dto.AddrDto;
//import com.hana.app.frame.HanaService;
//import com.hana.app.repository.AddrRepository;
import com.hana.admin.app.data.dto.AddrDto;
import com.hana.admin.app.frame.HanaService;
import com.hana.admin.app.repository.AddrRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AddrService implements HanaService<Long, AddrDto> {

    final AddrRepository addrRepository;

    @Override
    public int add(AddrDto addrDto) throws Exception {
        return addrRepository.insert(addrDto);
    }

    @Override
    public int del(Long aLong) throws Exception {
        return addrRepository.delete(aLong);
    }

    @Override
    public int modify(AddrDto addrDto) throws Exception {
        return addrRepository.update(addrDto);
    }

    @Override
    public AddrDto get(Long aLong) throws Exception {
        return addrRepository.selectOne(aLong);
    }

    @Override
    public List<AddrDto> get() throws Exception {
        return addrRepository.select();
    }

    public List<AddrDto> getCustAddr(String id) throws Exception {
        return addrRepository.getAddrByCustId(id);
    }
}
