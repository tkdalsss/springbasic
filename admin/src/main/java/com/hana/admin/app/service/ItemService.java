package com.hana.admin.app.service;

//import com.hana.app.data.dto.ItemDto;
//import com.hana.app.frame.HanaService;
//import com.hana.app.repository.ItemRepository;
import com.hana.admin.app.data.dto.ItemDto;
import com.hana.admin.app.frame.HanaService;
import com.hana.admin.app.repository.ItemRepository;
import com.hana.admin.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService implements HanaService<Integer, ItemDto> {

    private final ItemRepository itemRepository;

    @Value("${app.dir.imgUploadDir}")
    String imgdir;

    @Override
    public int add(ItemDto itemDto) throws Exception {
        int result = 0;
        result = itemRepository.insert(itemDto);
        FileUploadUtil.saveFileChangingName(itemDto.getImage(), imgdir, itemDto.getImgName());
        return result;
    }

    @Override
    public int del(Integer i) throws Exception {
        return itemRepository.delete(i);
    }

    @Override
    public int modify(ItemDto itemDto) throws Exception {
        if (itemDto.getImage().isEmpty()) {
            return itemRepository.update(itemDto);
        } else {
            // 현재 디렉토리 내에서 같은 이름의 파일이 있는지 확인해서 같은 이름이 있다면 item(1).png 형식으로 출력
            String checkDuplicateImgName = FileUploadUtil.changeDuplicateImageName(itemDto.getImage(), imgdir);

            itemDto.setImgName(checkDuplicateImgName);
            int u = itemRepository.update(itemDto);

            FileUploadUtil.saveFileChangingName(itemDto.getImage(), imgdir, checkDuplicateImgName);
            return u;
        }
//        return itemRepository.update(itemDto);
    }

    @Override
    public ItemDto get(Integer i) throws Exception {
        return itemRepository.selectOne(i);
    }

    @Override
    public List<ItemDto> get() throws Exception {
        return itemRepository.select();
    }
}
