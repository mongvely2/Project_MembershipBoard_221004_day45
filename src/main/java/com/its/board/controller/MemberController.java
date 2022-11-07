package com.its.board.controller;

import com.its.board.dto.MemberDTO;
import com.its.board.dto.MemberFileDTO;
import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String memberSaveForm() {
        return "/memberPages/memberSave";
    }

    @PostMapping("/save")
    public String memberSave(@ModelAttribute MemberDTO memberDTO, MemberFileDTO memberFileDTO) throws IOException {
        memberService.memberSave(memberDTO, memberFileDTO);
        return "index";
    }

    @PostMapping("/duplicateCheck")
    public @ResponseBody String emailDuplicateCheck(@RequestParam("inputEmail") String inputEmail) {
        System.out.println("controller_inputEmail = " + inputEmail);
        String checkEmail = memberService.emailDuplicateCheck(inputEmail);
        System.out.println(checkEmail);
        return checkEmail;
    }

}
