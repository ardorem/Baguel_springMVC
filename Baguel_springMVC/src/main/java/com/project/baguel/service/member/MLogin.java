package com.project.baguel.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;
import com.project.baguel.model.MemberDTO;
@Service
public class MLogin implements IMemberService {

	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> MLogin");
		Map<String, Object> map = model.asMap();
		String userId = String.valueOf(map.get("userId"));
		MemberDTO loginMember = memberRepository.getMember(userId);
		model.addAttribute("loginMember", loginMember);
	}

}
