package com.its.board.service;

import com.its.board.commons.PagingConst;
import com.its.board.dto.*;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public List<BoardDTO> boardList() {
        return boardRepository.boardList();
    }

    public void save(BoardDTO boardDTO, BoardFileDTO boardFileDTO) throws IOException {
        if (!boardFileDTO.getBoardFileName().isEmpty()) {
            MultipartFile boardFileName = boardFileDTO.getBoardFileName();  //1
            String originalFileName = boardFileName.getOriginalFilename();  //2
            String storedFileName = System.currentTimeMillis() + "-" + originalFileName;    //3
            boardFileDTO.setOriginalFileName(originalFileName);     //4
            boardFileDTO.setStoredFileName(storedFileName);     //4
            String savePath = "D:\\miniproject_board_file\\" + storedFileName;  //5
            boardFileName.transferTo(new File(savePath));   //6
            boardDTO.setFileAttached("Y");
            BoardDTO saveResult = boardRepository.save(boardDTO);
            boardFileDTO.setBoardId(boardDTO.getId());
            boardRepository.saveFileName(boardFileDTO);

        } else {
            boardDTO.setFileAttached("N");
            boardRepository.save(boardDTO);
        }
    }

    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page-1) * PagingConst.PAGE_LIMIT;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", PagingConst.PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParams);
        return pagingList;
    }

    public PageDTO pagingParam(int page) {
        int boardCount = boardRepository.boardCount();
        // 전체 페이지 갯수 계산 _ ceil -> 올림처리 함수, double -> 소수점까지 표현해주는 타입이기에 해당 타입으로 형변환 해줌
        int maxPage = (int) (Math.ceil((double) boardCount / PagingConst.PAGE_LIMIT));
        // 시작 페이지 값 계산(1, 4, 7, 10, ~~~)
        int startPage = (((int)(Math.ceil((double) page / PagingConst.BLOCK_LIMIT)))-1) * PagingConst.BLOCK_LIMIT+1;
        // 끝 페이지 값 계산(3,6,9,12,~~~)
        int endPage = startPage + PagingConst.BLOCK_LIMIT-1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }
}























