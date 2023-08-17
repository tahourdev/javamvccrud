package com.tahourdev.mvccrud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tahourdev.mvccrud.model.Member;
import com.tahourdev.mvccrud.repo.MemberRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class MemberService {

    @Autowired
    MemberRepository memberRepo;

    public List<Member> getAllMember() {
        List<Member> memberList = new ArrayList<>();
        memberRepo.findAll().forEach(member -> memberList.add(member));

        return memberList;
    }

    public Member getMemberById(Long id) {
        return memberRepo.findById(id).get();
    }

    public boolean saveOrUpdateMember(Member member) {
        Member updatedMember = memberRepo.save(member);

        if (memberRepo.findById(updatedMember.getId()) != null) {
            return true;
            
        }

        System.out.println("this work");

        return false;
    }

    public boolean deleteMember(Long id) {
        memberRepo.deleteById(id);

        if (memberRepo.findById(id) != null) {
            return true;
        }

        return false;
    }

    public Member getMemberByEmail(String email) {
        return memberRepo.findByEmail(email);
    }

}

