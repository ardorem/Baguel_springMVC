package com.project.baguel.service.member;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMemberRepository;
import com.project.baguel.model.MemberDTO;
@Service
public class MResetUserPw implements IMemberService {

	@Autowired
	IMemberRepository memberRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> MResetUserPw");
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		String userId = memberDTO.getUserId();
		
    String upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String lowerCase = "abcdefghijklmnopqrstuvwxyz";
    String numbers = "0123456789";
    String specialChar = "!@#$%^*+=-";
    int upperCaseLength = upperCase.length();
    int lowerCaseLength = lowerCase.length();
    int numbersLength = numbers.length();
    int specialCharLenth = specialChar.length();
    
    Random random = new Random();

    StringBuffer randomPw = new StringBuffer();
    for (int i = 0; i < 11; i++) {
    	int numVar = random.nextInt(4);
      if(numVar == 0) {
      	randomPw.append(upperCase.charAt(random.nextInt(upperCaseLength)));
      } else if (numVar == 1) {
      	randomPw.append(lowerCase.charAt(random.nextInt(lowerCaseLength)));
			} else if (numVar == 2) {
				randomPw.append(numbers.charAt(random.nextInt(numbersLength)));
			} else if (numVar == 3) {
				randomPw.append(specialChar.charAt(random.nextInt(specialCharLenth)));
			}
    }
    String newPw = randomPw.toString();
    memberRepository.resetUserPw(newPw, userId);
    model.addAttribute("newPw", newPw);
	}

}
