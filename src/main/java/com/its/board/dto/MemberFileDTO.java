package com.its.board.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberFileDTO {
    private Long id;
    private MultipartFile memberProfiles;
    private String originalFileName;
    private String storedFileName;
    private Long memberId;
}
