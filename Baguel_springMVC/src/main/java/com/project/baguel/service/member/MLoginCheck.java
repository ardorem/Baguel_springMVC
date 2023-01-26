package com.project.baguel.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;
@Service
public class MLoginCheck implements IMemberService {
	
	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> MLoginCheck");
		
		Map<String, Object> map = model.asMap();
		String userId = String.valueOf(map.get("userId"));
		String userPw = String.valueOf(map.get("userPw"));
		String dbPw = memberRepository.userCheck(userId);
		System.out.println(dbPw);
		if(dbPw != null) {
			if(dbPw.equals(userPw)) {
				model.addAttribute("result", MEMBER_LOGIN_SUCCESS);
			} else {
				model.addAttribute("result", MEMBER_LOGIN_PW_NO_GOOD);
			}
		} else {
			model.addAttribute("result", MEMBER_LOGIN_IS_NOT);
		}
		
	}

}
