package com.its.board.controller;

import com.its.board.dto.MemberDTO;
import com.its.board.dto.MemberFileDTO;
import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Member;

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
        return "memberPages/memberLogin";
    }

    @PostMapping("/duplicateCheck")
    public @ResponseBody String emailDuplicateCheck(@RequestParam("inputEmail") String inputEmail) {
        System.out.println("controller_inputEmail = " + inputEmail);
        String checkEmail = memberService.emailDuplicateCheck(inputEmail);
        System.out.println(checkEmail);
        return checkEmail;
    }

    @GetMapping("/login")
    public String login() {
        return "/memberPages/memberLogin";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
        boolean loginResult = memberService.login(memberDTO);
        if (loginResult) {
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            model.addAttribute("modelEmail", memberDTO.getMemberEmail());
            return "redirect:/board/paging";
        } else {
            return "memberPages/memberLogin";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @GetMapping("/myPage")
    public String myPage() {
        return "/memberPages/memberMyPage";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model) {
        String memberEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.updateLogin(memberEmail);
        model.addAttribute("member", memberDTO);
        return "memberPages/memberUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO, Model model) {
        boolean result = memberService.update(memberDTO);
//        model.addAttribute("result", result);
        if (result) {
            return "memberPages/memberMyPage";
        } else {
            return "index";
        }

    }

}
