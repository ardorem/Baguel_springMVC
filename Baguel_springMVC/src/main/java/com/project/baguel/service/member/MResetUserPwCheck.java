package com.project.baguel.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;
import com.project.baguel.model.MemberDTO;
@Service
public class MResetUserPwCheck implements IMemberService {

	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> MResetUserPw");
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		String userId = memberDTO.getUserId();
		String userName = memberDTO.getUserName();
		String userEmail = memberDTO.getUserEmail();
		String dbUserId = memberRepository.resetUserPwCheck(userId, userName, userEmail);
		int result;
		if(dbUserId == null) {
			result = MEMBER_NOEXISTENT;
		} else {
			result = MEMBER_EXISTENT;
		}
		model.addAttribute("result", result);
	}

}
