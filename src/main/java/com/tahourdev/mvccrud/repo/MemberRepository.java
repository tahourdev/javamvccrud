package com.tahourdev.mvccrud.repo;

import org.springframework.data.jpa.repository.JpaRepository;
// import org.springframework.stereotype.Repository;

import com.tahourdev.mvccrud.model.Member;

// @Repository
public interface MemberRepository extends JpaRepository<Member, Long> {    
    Member findByEmail(String email);
}
