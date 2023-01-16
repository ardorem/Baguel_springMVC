package com.project.baguel.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;

@Service
public class MDeactiveMember implements IMemberService {

	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> MDeactiveMember");
		Map<String, Object> map = model.asMap();
		String userId = String.valueOf(map.get("userId"));
		memberRepository.deactiveMember(userId);
	}

}
