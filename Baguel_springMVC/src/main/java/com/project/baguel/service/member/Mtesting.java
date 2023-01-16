package com.project.baguel.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;
import com.project.baguel.model.BoardDTO;
import com.project.baguel.model.MemberDTO;

@Service
public class Mtesting implements IMemberService {
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println("Mtesting");
		
		Map<String, Object> map = model.asMap();
		String memnum = String.valueOf(map.get("memnum"));
		System.out.println("Mtesting memnum is " + memnum);
		
		System.out.println(memberRepository);
//		memberRepository.testing0();
		System.out.println("after testing0");
		
//		MemberDTO memberDTO = memberRepository.testing(memnum);
		System.out.println("after DAO");
//		model.addAttribute("member", memberDTO);
		System.out.println("goodbye from sevice");
	}

}
