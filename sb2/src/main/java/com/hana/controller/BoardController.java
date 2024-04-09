package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.BoardService;
import com.hana.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    String dir = "board/";

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addImpl")
    public String addBoard(Model model, BoardDto boardDto, HttpSession session) throws Exception {
//        session.getAttribute()
        boardDto.setCustId(session.getAttribute("id").toString());
        boardService.add(boardDto);
        return "redirect:/board/get";
    }

    @RequestMapping("/get")
    public String getBoard(Model model) throws Exception {
        List<BoardDto> boardDtoList = boardService.get();
        model.addAttribute("boardList", boardDtoList);
        model.addAttribute("center", dir + "get");
        return "index";
    }

    @RequestMapping("/detail")
    public String boardDetail(Model model, @RequestParam("id") int id, HttpSession session) throws Exception {
        BoardDto boardDto = boardService.get(id);

        if(session != null && !session.getAttribute("id").toString().equals(boardDto.getCustId())) {
            boardService.updateCnt(id);
        }

        model.addAttribute("board", boardDto);
        model.addAttribute("center", dir + "detail");

        return "index";
    }

    @RequestMapping("/updateImpl")
    public String updateBoard(Model model, BoardDto boardDto, HttpSession session) throws Exception {
        BoardDto originalBoardDto = boardService.get(boardDto.getBoardId());

        originalBoardDto.setBoardTitle(boardDto.getBoardTitle());
        originalBoardDto.setBoardContent(boardDto.getBoardContent());
        originalBoardDto.setBoardUpdate(LocalDateTime.now());

        boardService.modify(originalBoardDto);

        return "redirect:/board/get";
    }

    @RequestMapping("/delete")
    public String deleteBoard(Model model, @RequestParam("id") int id) throws Exception {
        boardService.del(id);
        return "redirect:/board/get";
    }
}
