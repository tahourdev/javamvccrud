package com.tahourdev.mvccrud.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tahourdev.mvccrud.model.Member;
import com.tahourdev.mvccrud.service.MemberService;

@Controller
public class MemberController {

    @Autowired
    MemberService memberService;

    @GetMapping({"/", "/viewMemberList"})
    public String viewMemberList(@ModelAttribute("message") String message, Model model) {
        // model.addAttribute("memberList", memberService.getAllMember());
        List<Member> memberList = memberService.getAllMember();
    
        // Sort memberList by ID in ascending order
        Collections.sort(memberList, Comparator.comparing(Member::getId));
    
        model.addAttribute("memberList", memberList);
        model.addAttribute("message", message);


       

        return "ViewMemberList";
    }

    @GetMapping("/addMember")
    public String addMember(@ModelAttribute("message") String message,
                            @ModelAttribute("member") Member member, Model model) {
        model.addAttribute("message", message);
        if (member == null) {
            model.addAttribute("member", new Member());
        }
        model.addAttribute("error", "Email is already have!");
        return "AddMember";
    }

    @PostMapping("/saveMember")
    public String saveMember(Member member, RedirectAttributes redirectAttributes, Model model) {
        if (isEmailAlreadyExists(member.getEmail())) {
            redirectAttributes.addFlashAttribute("message", "Email already exists");
            model.addAttribute("error", "Email is already have!");
            
            redirectAttributes.addFlashAttribute("member", member); // Keep user input
            return "redirect:/addMember";
        }

        if (memberService.saveOrUpdateMember(member)) {
            redirectAttributes.addFlashAttribute("message", "Save Success");
            return "redirect:/viewMemberList";
        }

        redirectAttributes.addFlashAttribute("message", "Save Failure");
        redirectAttributes.addFlashAttribute("member", member); // Keep user input
        return "redirect:/addMember";
    }

    // Check if the email already exists in the database
    private boolean isEmailAlreadyExists(String email) {
        return memberService.getMemberByEmail(email) != null;
    }

    @GetMapping("/editMember/{id}")
    public String editMember(@PathVariable Long id, Model model) {
        model.addAttribute("member", memberService.getMemberById(id));

        return "EditMember";
    }

    @PostMapping("/editSaveMember")
    public String editSaveMember(Member member, RedirectAttributes redirectAttributes) {
        if (memberService.saveOrUpdateMember(member)) {
            redirectAttributes.addFlashAttribute("message", "Edit Success");
            return "redirect:/viewMemberList";
        }

        redirectAttributes.addFlashAttribute("message", "Edit Failure");
        return "redirect:/editMember/" + member.getId();
    }

    @GetMapping("/deleteMember/{id}")
    public String deleteMember(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (memberService.deleteMember(id)) {
            redirectAttributes.addFlashAttribute("message", "Delete Success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Delete Failure");
        }

        return "redirect:/viewMemberList";
    }
}