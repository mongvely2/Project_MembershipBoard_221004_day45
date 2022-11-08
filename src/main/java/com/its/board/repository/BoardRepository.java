package com.its.board.repository;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public BoardDTO save(BoardDTO boardDTO) {
        sql.insert("Board.save", boardDTO);
        return boardDTO;
    }

    public void saveFileName(BoardFileDTO boardFileDTO) {
        sql.insert("Board.saveFileName", boardFileDTO);
    }

    public List<BoardDTO> boardList() {
        return sql.selectList("Board.boardList");
    }


    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.pagingList", pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("Board.boardCount");
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    public BoardDTO findById(Long id) {
        BoardDTO boardDTO = sql.selectOne("Board.findById", id);
        if (boardDTO.getFileAttached() == "Y") {
            return sql.selectOne("Board.findByIdFile", id);
        } else {
            return boardDTO;
        }
    }
}
