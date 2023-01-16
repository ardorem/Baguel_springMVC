package com.project.baguel.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;
import com.project.baguel.model.MemberDTO;
@Service
public class MInsertIdCheck implements IMemberService {
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> MInsertIdCheck");
		
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		String userId = memberDTO.getUserId();
		String dbId = memberRepository.insertIdCheck(userId);
		int idResult;
		if(dbId == null) {
			idResult = MEMBER_NOEXISTENT;
		} else {
			idResult = MEMBER_EXISTENT;
		}
		model.addAttribute("idResult", idResult);
	}

}
