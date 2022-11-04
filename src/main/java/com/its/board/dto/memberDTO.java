package com.its.board.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class memberDTO {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private String memberMobile;


}
