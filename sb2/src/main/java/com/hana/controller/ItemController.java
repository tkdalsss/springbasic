package com.hana.controller;

import com.hana.app.data.dto.ItemDto;
import com.hana.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
public class ItemController {

    final ItemService itemService;

    String dir = "item/";

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        List<ItemDto> itemDtoList = itemService.get();

        model.addAttribute("items", itemDtoList);
        model.addAttribute("center", dir + "center");
        model.addAttribute("left", dir + "left");

        return "index";
    }

    @RequestMapping("/get")
    public String getItem(Model model, @RequestParam("id") String id) throws Exception {
        ItemDto itemDto = itemService.get(Integer.parseInt(id));

        model.addAttribute("item", itemDto);
        model.addAttribute("center", dir + "detail");
        model.addAttribute("left", dir + "left");

        return "index";
    }

}
