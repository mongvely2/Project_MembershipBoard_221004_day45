package com.its.board.service;

import com.its.board.dto.MemberDTO;
import com.its.board.dto.MemberFileDTO;
import com.its.board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void memberSave(MemberDTO memberDTO, MemberFileDTO memberFileDTO) throws IOException {
        if (!memberFileDTO.getMemberProfiles().isEmpty()) {
            MultipartFile memberProfiles = memberFileDTO.getMemberProfiles(); // 1
            String originalFileName = memberProfiles.getOriginalFilename();     // 2
            String storedFileName = System.currentTimeMillis() + "-" + originalFileName;    //3
            memberFileDTO.setOriginalFileName(originalFileName);  //4
            memberFileDTO.setStoredFileName(storedFileName);  //4
            String savePath = "D:\\membershipboard_project_file\\" + storedFileName;   //5
            memberProfiles.transferTo(new File(savePath));  //6
            memberDTO.setFileAttached("Y");
            MemberDTO saveResult = memberRepository.save(memberDTO);
//            Long memberId = memberDTO.getId();
            memberFileDTO.setMemberId(memberDTO.getId());
            System.out.println(memberDTO.getId());
            memberRepository.saveFileName(memberFileDTO);
            System.out.println("memberDTO = " + memberDTO + ", memberFileDTO = " + memberFileDTO);

        } else {
            memberDTO.setFileAttached("N");
            memberRepository.save(memberDTO);
        }
    }

    public String emailDuplicateCheck(String inputEmail) {
        String checkResult = memberRepository.emailDuplicateCheck(inputEmail);
        if (checkResult == null) {
            return "Y";
        } else {
            return "N";
        }
    }
}