package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.BoardFileDTO;
import com.its.board.dto.CommentDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import com.its.board.service.CommentService;
//import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/save")
    public String save() {
        return "/boardPages/boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO, BoardFileDTO boardFileDTO) throws IOException {
//        System.out.println("boardDTO = " + boardDTO + ", boardFileDTO = " + boardFileDTO);
        boardService.save(boardDTO, boardFileDTO);
        return "redirect:/board/paging";
    }

//    @GetMapping
//    public String findById(@RequestParam("id") Long id, Model model,
//                           @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
//        boardService.updateHits(id);
//        BoardDTO boardDTO = boardService.findById(id);
//        model.addAttribute("board", boardDTO);
//        model.addAttribute("page", page);
//        return "boardPages/boardDetail";
//    }
    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        boardService.updateHits(id);
        Map boardDetail = boardService.boardDetail(id);
        model.addAttribute("board", boardDetail.get("findBoard"));
        model.addAttribute("boardFile", boardDetail.get("findBoardFile"));
        model.addAttribute("page", page);
//        댓글창 보이기
        List<CommentDTO> commentDTOList = commentService.commentList(id);
        model.addAttribute("commentList", commentDTOList);

        return "boardPages/boardDetail";
    }

    @GetMapping("/list")
    public String boardList(Model model) {
        List<BoardDTO> boardList = boardService.boardList();
        model.addAttribute("boardList", boardList);
        return "/boardPages/boardList";
    }

    @GetMapping("/paging")
    public String pagingList(Model model,
                             @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        List<BoardDTO> pagingList = boardService.pagingList(page);
        PageDTO pageDTO = boardService.pagingParam(page);
        model.addAttribute("boardList", pagingList);
        model.addAttribute("paging", pageDTO);
        return "boardPages/boardPaging";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.updateForm(id);
        model.addAttribute("result", boardDTO);
        return "boardPages/boardUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
        Map boardDetail = boardService.boardDetail(boardDTO.getId());
        model.addAttribute("board", boardDetail.get("findBoard"));
        model.addAttribute("boardFile", boardDetail.get("findBoardFile"));
//        댓글보이기
        List<CommentDTO> commentDTOList = commentService.commentList_Up(boardDTO);
        model.addAttribute("commentList", commentDTOList);
        return "boardPages/boardDetail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/paging";
    }

    @GetMapping("/search")
    public String search(@RequestParam("type") String type,
                         @RequestParam("q") String q, Model model) {
        List<BoardDTO> searchList = boardService.search(type, q);
        model.addAttribute("boardList", searchList);
        return "boardPages/boardList";

    }


}























