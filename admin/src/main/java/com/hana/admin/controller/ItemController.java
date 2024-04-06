package com.hana.admin.controller;

import com.hana.admin.app.data.dto.ItemDto;
import com.hana.admin.app.service.ItemService;
import com.hana.admin.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/item")
@Slf4j
@RequiredArgsConstructor
public class ItemController {

    private final ItemService itemService;

    String dir = "item";

    @Value("${app.dir.imgUploadDir}")
    String imgdir;

    @RequestMapping("/get")
    public String get(Model model) {
        List<ItemDto> list = null;
        try {
            list = itemService.get();
            model.addAttribute("center", dir + "/get");
            model.addAttribute("itemList", list);
        } catch (Exception e) {
            throw new RuntimeException();
        }

        return "index";
    }

    @RequestMapping("/detail")
    public String getDetail(Model model, @RequestParam("id") int id) throws Exception {
        ItemDto itemDto = null;
        try {
            itemDto = itemService.get(id);
            log.info(itemDto.toString() + " 3333");
            model.addAttribute("item", itemDto);
            model.addAttribute("center", dir + "/detail");
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model){
//        model.addAttribute("")
        model.addAttribute("center", dir + "/register");
        return "index";
    }

    @RequestMapping("/addImpl")
    public String addImpl(Model model, ItemDto itemDto) throws Exception {
//        model.addAttribute("center", dir );
        String checkDuplicateImgName = FileUploadUtil.changeDuplicateImageName(itemDto.getImage(), imgdir);
        // 데이터 입력
        itemDto.setImgName(checkDuplicateImgName);
        itemService.add(itemDto);
        // 이미지 저장 (/img)
        // mf, dir
//        FileUploadUtil.saveFile(itemDto.getImage(), imgdir);
//        itemDto.getImage().transferTo(new File(imgdir.split("/")[0] + itemDto.getImgName()));
        log.info(imgdir);
//        log.info(String.valueOf(itemDto.getItemId()));

//        log.info(itemDto.toString());
//        MultipartFile mf = itemDto.getImage();
//        String imgName = mf.getOriginalFilename();

//        ItemDto inputDto = new ItemDto(itemDto.getItemId(), itemDto.getItemName(), itemDto.getItemPrice(), imgName, LocalDate.now(), LocalDate.now());
//        log.info(imgName);
        model.addAttribute("center", dir+"/register");
        log.info("----------------------" + imgdir);

        return "redirect:/item/get";
    }

    @RequestMapping("/updateImpl")
    public String updateImpl(Model model, ItemDto itemDto) throws Exception {
        // 이미지 교체 x or 교체
//        String newImgName = itemDto.getImage().getOriginalFilename();
//        log.info("----------------" + newImgName);
//        if (itemDto.getImage() != null) {
//            // itemDto.getImage().isEmpty()
//            // 새로운 이미지 등록 -> 파일이름이 중복이라면?
//            itemDto.setImgName(itemDto.getImage().getOriginalFilename());
//            FileUploadUtil.saveFile(itemDto.getImage(), imgdir);
//        }
//
//        itemService.modify(itemDto);

        if (itemDto.getImage().isEmpty()) {
            itemService.modify(itemDto);
        } else {
            // 현재 디렉토리 내에서 같은 이름의 파일이 있는지 확인해서 같은 이름이 있다면 item(1).png 형식으로 출력
            String checkDuplicateImgName = FileUploadUtil.changeDuplicateImageName(itemDto.getImage(), imgdir);

            itemDto.setImgName(checkDuplicateImgName);
            itemService.modify(itemDto);

            FileUploadUtil.saveFileChangingName(itemDto.getImage(), imgdir, checkDuplicateImgName);
        }

        // 이미지 이름이 중복이지만 item(2).jpg 의 형식으로 처리하고 싶음
        // 일단은 FileUploadUtil 에서 중복 이름의 이미지가 있는지 확인해야 하고
        // 이름 바꿔서 dir 에 넣어준다음 itemDto 에도 item(2).jpg 로 넣어주어야 함.

        return "redirect:/item/detail?id="+itemDto.getItemId();
    }

    @RequestMapping("/delete")
    public String deleteItem(Model model, @RequestParam("id") int id) throws Exception {
        ItemDto checkDto = itemService.get(id);
        if (checkDto == null) {
            throw new NullPointerException();
        }
        log.info("Delete : " + checkDto);
        itemService.del(id);

//        model.addAttribute("center", dir+"/get");

        return "redirect:/item/get";
    }

}
