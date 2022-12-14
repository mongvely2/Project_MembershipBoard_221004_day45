package com.its.board.repository;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void commentSave(CommentDTO commentDTO) {
        sql.insert("Comment.commentSave", commentDTO);
    }

    public List<CommentDTO> commentList(Long boardId) {
        return sql.selectList("Comment.commentList", boardId);
    }

    public List<CommentDTO> commentList_Up(BoardDTO boardDTO) {
        return sql.selectList("Comment.commentList_Up", boardDTO);
    }
}
