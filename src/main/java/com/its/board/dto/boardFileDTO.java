package com.its.board.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class boardFileDTO {
    private Long id;
    private MultipartFile boardFileName;
    private String originalFileName;
    private String storedFileName;
    private Long boardId;
}
