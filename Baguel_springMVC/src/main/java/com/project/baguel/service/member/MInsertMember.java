package com.project.baguel.service.member;

import java.sql.Timestamp;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;
import com.project.baguel.model.MemberDTO;

@Service
public class MInsertMember implements IMemberService {

	@Autowired
	IMemberRepository memberRepository;
	
	@Override 
	public void execute(Model model) {
		System.out.println(">> MInsertMember");
		Map<String, Object> map = model.asMap();
		
		MemberDTO memberDTO = (MemberDTO)map.get("memberDTO");
		String userId = memberDTO.getUserId();
		String userPw = memberDTO.getUserPw();
		String userName = memberDTO.getUserName();
		String userNick = memberDTO.getUserNick();
		String userEmail = memberDTO.getUserEmail();
		Timestamp joinDate = new Timestamp(System.currentTimeMillis());
		System.out.println(">> User registration was successful ***");
		System.out.println("userId : " + userId);
		System.out.println("userPw : " + userPw);
		System.out.println("userNick : " + userNick);
		memberRepository.insertMember(userId, userPw, userName, userNick, userEmail, joinDate);
	}

}
