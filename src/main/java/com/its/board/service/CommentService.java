package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.CommentDTO;
import com.its.board.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public void commentSave(CommentDTO commentDTO) {
        commentRepository.commentSave(commentDTO);
    }

    public List<CommentDTO> commentList(Long boardId) {
       return commentRepository.commentList(boardId);
    }

    public List<CommentDTO> commentList_Up(BoardDTO boardDTO) {
        return commentRepository.commentList_Up(boardDTO);
    }
}
