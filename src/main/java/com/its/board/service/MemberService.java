package com.its.board.service;

import com.its.board.dto.MemberDTO;
import com.its.board.dto.MemberFileDTO;
import com.its.board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

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
            String savePath = "D:\\miniproject_profiles_file\\" + storedFileName;   //5
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

    public boolean login(MemberDTO memberDTO) {
        MemberDTO result = memberRepository.login(memberDTO);
        if (result != null) {
            return true;
        } else {
            return false;
        }
    }

    public MemberDTO updateLogin(String memberEmail) {
        return memberRepository.updateLogin(memberEmail);
    }

    public boolean update(MemberDTO memberDTO) {
        int result = memberRepository.update(memberDTO);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<MemberDTO> memberList() {
        return memberRepository.memberList();
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }
}
