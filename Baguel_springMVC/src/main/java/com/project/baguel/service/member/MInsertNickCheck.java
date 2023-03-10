package com.project.baguel.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;
import com.project.baguel.model.MemberDTO;
@Service
public class MInsertNickCheck implements IMemberService {
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> MInsertNickCheck");
		
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		String userNick = memberDTO.getUserNick();
		System.out.println(">> user try to register NickName : " + userNick + " ***");
		String dbNick = memberRepository.insertIdCheck(userNick);
		int nickResult;
		if(dbNick == null) {
			nickResult = MEMBER_NOEXISTENT;
		} else {
			nickResult = MEMBER_EXISTENT;
		}
		model.addAttribute("nickResult", nickResult);
	}

}
