package com.project.baguel.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;
import com.project.baguel.model.MemberDTO;

@Service
public class MUpdateMember implements IMemberService {

	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> MUpdateMember");
		Map<String, Object> map = model.asMap();
		
		MemberDTO memberDTO = (MemberDTO)map.get("memberDTO");
		String userId = memberDTO.getUserId();
		String userPw = memberDTO.getUserPw();
		String userName = memberDTO.getUserName();
		String userNick = memberDTO.getUserNick();
		String userEmail = memberDTO.getUserEmail();
		memberRepository.updateMember(userId, userPw, userName, userNick, userEmail);
	}

}
