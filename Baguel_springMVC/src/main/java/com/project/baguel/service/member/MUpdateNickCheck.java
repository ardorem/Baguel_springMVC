package com.project.baguel.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;
import com.project.baguel.model.MemberDTO;

@Service
public class MUpdateNickCheck implements IMemberService {

	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> MUpdateNickCheck");
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO)map.get("memberDTO");
		String userId = memberDTO.getUserId();
		String userNick = memberDTO.getUserNick();
		String dbNick = memberRepository.updateNickCheck(userId, userNick);
		int nickResult;
		if(dbNick == null) {
			nickResult = MEMBER_NOEXISTENT;
		} else {
			nickResult = MEMBER_EXISTENT;
		}
		model.addAttribute("nickResult", nickResult);
	}

}
