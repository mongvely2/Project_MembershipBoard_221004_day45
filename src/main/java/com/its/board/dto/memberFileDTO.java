package com.its.board.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class memberFileDTO {
    private Long id;
    private MultipartFile memberProfiles;
    private String memberOriginalFileName;
    private String memberStoredFileName;
    private Long memberId;
}
