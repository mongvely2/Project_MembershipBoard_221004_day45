package com.its.board.repository;

import com.its.board.dto.MemberDTO;
import com.its.board.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void saveFileName(MemberFileDTO memberFileDTO) {
        sql.insert("Member.saveFileName", memberFileDTO);
    }

    public MemberDTO save(MemberDTO memberDTO) {
        sql.insert("Member.save", memberDTO);
        return memberDTO;
    }

    public String emailDuplicateCheck(String inputEmail) {
        return sql.selectOne("Member.duplicateCheck", inputEmail);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public MemberDTO updateLogin(String memberEmail) {
        return sql.selectOne("Member.updateLogin", memberEmail);
    }

    public int update(MemberDTO memberDTO) {
        return sql.update("Member.update", memberDTO);
    }

    public List<MemberDTO> memberList() {
        return sql.selectList("Member.memberList");
    }

    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }
}






















