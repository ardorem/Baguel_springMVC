package com.project.baguel.controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.baguel.model.MemberDTO;
import com.project.baguel.service.member.*;

@Controller
public class MController {
	
	@Autowired
	@Qualifier("MLoginCheck")
	IMemberService mLoginCheck;

	@Autowired
	@Qualifier("MLogin")
	IMemberService mLogin;

	@Autowired
	@Qualifier("MInsertIdCheck")
	IMemberService mInsertIdCheck;

	@Autowired
	@Qualifier("MInsertNickCheck")
	IMemberService mInsertNickCheck;

	@Autowired
	@Qualifier("MInsertMember")
	IMemberService mInsertMember;
	
	@Autowired
	@Qualifier("MDeactiveMember")
	IMemberService mDeactiveMember;
	
	@Autowired
	@Qualifier("MUpdateNickCheck")
	IMemberService mUpdateNickCheck;
	
	@Autowired
	@Qualifier("MUpdateMember")
	IMemberService mUpdateMember;
	
	@Autowired
	@Qualifier("MFindUserId")
	IMemberService mFindUserId;
	
	@Autowired
	@Qualifier("MResetUserPwCheck")
	IMemberService mResetUserPwCheck;
	
	@Autowired
	@Qualifier("MResetUserPw")
	IMemberService mResetUserPw;

	@RequestMapping("login")
	public String loginPage() {
		return "login";
	}

	@RequestMapping("loginCheck")
	public String loginCheck(String userId, String userPw, Model model, HttpServletResponse response, HttpSession session)
			throws Exception {
		System.out.println("> Controller → loginCheck");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		model.addAttribute("userId", userId);
		model.addAttribute("userPw", userPw);
		mLoginCheck.execute(model);
		Map<String, Object> loginCheckmap = model.asMap();

		int result = (int) loginCheckmap.get("result");
		if (result == IMemberService.MEMBER_LOGIN_IS_NOT) {
			out.println("<script>");
			out.println("alert(\"아이디가 존재하지 않습니다.\");");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return "home"; // return을 해주지 않으면 오류 발생
		} else if (result == IMemberService.MEMBER_LOGIN_PW_NO_GOOD) {
			out.println("<script>");
			out.println("alert(\"비밀번호가 일치하지 않습니다.\");");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return "home";
		} else if (result == 1) {
			mLogin.execute(model);
			Map<String, Object> loginMemberMap = model.asMap();
			MemberDTO loginMember = (MemberDTO) loginMemberMap.get("loginMember");
			if (loginMember == null) {
				out.println("<script>");
				out.println("alert(\"존재하지 않는 회원입니다.\");");
				out.println("history.back();");
				out.println("</script>");
				return "home";
			} else {
				session.setAttribute("userLogin", "logined");
				session.setAttribute("userId", loginMember.getUserId());
				session.setAttribute("userNick", loginMember.getUserNick());
				return "login_ok";
			}
		}
		return "login_ok";
	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register() {
		System.out.println("> Controller → register(GET)");
		return "register";
	}

	@RequestMapping("mypage")
	public String mypage() {
		System.out.println("> Controller → mypage");
		return "mypage";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(MemberDTO memberDTO, Model model, HttpServletResponse response) throws Exception {
		System.out.println("> Controller → register(POST)");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		model.addAttribute("memberDTO", memberDTO);
		mInsertIdCheck.execute(model);
		mInsertNickCheck.execute(model);
		Map<String, Object> insertCheck = model.asMap();

		int idResult = (int) insertCheck.get("idResult");
		int nickResult = (int) insertCheck.get("nickResult");

		if (idResult == IMemberService.MEMBER_EXISTENT) {
			out.println("<script>");
			out.println("alert(\"아이디가 이미 존재합니다.\");");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return "register";
		} else if (nickResult == IMemberService.MEMBER_EXISTENT) {
			out.println("<script>");
			out.println("alert(\"닉네임 이미 존재합니다.\");");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return "register";
		} else {
			mInsertMember.execute(model);
			model.addAttribute("userId", memberDTO.getUserId());
			return "register_ok";
		}

	}

	@RequestMapping(value = "modify_pw_check", method = RequestMethod.GET)
	public String pwCheckNevigate() {
		System.out.println("> Controller → modify_pw_check(GET)");
		return "modify_pw_check";
	}

	@RequestMapping(value = "modify_pw_check", method = RequestMethod.POST)
	public String pwCheck(String userId, String userPw, Model model, HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("> Controller → modify_pw_check(POST)");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		model.addAttribute("userId", session.getAttribute("userId"));
		model.addAttribute("userPw", userPw);
		mLoginCheck.execute(model);
		Map<String, Object> loginCheckmap = model.asMap();

		int result = (int) loginCheckmap.get("result");
		if (result == 0) {
			out.println("<script>");
			out.println("alert(\"비밀번호가 일치하지 않습니다.\");");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return "modify_pw_check";
		} else if (result == 1) {
			mLogin.execute(model);
			Map<String, Object> loginMemberMap = model.asMap();
			MemberDTO loginMember = (MemberDTO) loginMemberMap.get("loginMember");
			model.addAttribute("userName", loginMember.getUserName());
			model.addAttribute("userEmail", loginMember.getUserEmail());
			return "modify";
		}

		return "modify_pw_check";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		System.out.println("> Controller → logout");
		session.invalidate();
		return "logout";
	}
	
	@RequestMapping("deactive")
	public String deactive(Model model, HttpSession session) {
		System.out.println("> Controller → deactive");
		String userId = String.valueOf(session.getAttribute("userId"));
		model.addAttribute("userId", userId);
		session.invalidate();
		mDeactiveMember.execute(model);
		return "goodbye";
	}

	
	@RequestMapping("modify")
	public String modify(MemberDTO memberDTO, Model model, HttpSession session,  HttpServletResponse response) throws Exception {
		System.out.println("> Controller → modify");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println(memberDTO.getUserId());
		System.out.println(memberDTO.getUserEmail());
		model.addAttribute("memberDTO", memberDTO);
		mUpdateNickCheck.execute(model);
		Map<String, Object> updateCheck = model.asMap();

		int nickResult = (int) updateCheck.get("nickResult");
		
		if (nickResult == IMemberService.MEMBER_EXISTENT) {
			out.println("<script>");
			out.println("alert(\"닉네임 이미 존재합니다.\");");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return "modify";
			
		} else {
			mUpdateMember.execute(model);
			return "modify_ok";
		}
	}
	
	@RequestMapping(value = "find_id", method = RequestMethod.GET)
	public String finIdNevigate() {
		return "find_id";
	}
	
	@RequestMapping(value = "find_pw", method = RequestMethod.GET)
	public String finPwNevigate() {
		return "find_pw";
	}
	
	@RequestMapping("found_id")
	public String findUserId(MemberDTO memberDTO, Model model, HttpServletResponse response) throws Exception {
		System.out.println("> Controller → findUserId(POST)");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		model.addAttribute("memberDTO", memberDTO);
		
		mFindUserId.execute(model);
		Map<String, Object> map = model.asMap();
		MemberDTO founMember = (MemberDTO) map.get("founMember");
		System.out.println("> Controller → findUserId(POST) " + founMember);
		if(founMember == null) {
			out.println("<script>");
			out.println("alert(\"입력한 정보와 일치하는 계정이 없습니다.\");");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return "find_id";
		} else {
			Timestamp sqlJoinDate = founMember.getJoindate();
			String joindate = sqlJoinDate.toString().substring(0, 10);
			String foundId = String.valueOf(founMember.getUserId());
			model.addAttribute("joindate", joindate);
			model.addAttribute("foundId", foundId);
			
			return "found_id";
		}

	}
	
	@RequestMapping("found_pw")
	public String resetUserId(MemberDTO memberDTO, Model model, HttpServletResponse response) throws Exception {
		System.out.println("> Controller → resetUserId(POST)");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		model.addAttribute("memberDTO", memberDTO);
		
		mResetUserPwCheck.execute(model);
		Map<String, Object> map = model.asMap();
		int result = (int) map.get("result");
		if(result == IMemberService.MEMBER_NOEXISTENT) {
			out.println("<script>");
			out.println("alert(\"입력한 정보와 일치하는 계정이 없습니다.\");");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return "find_pw";
		} else if(result == IMemberService.MEMBER_EXISTENT){
			mResetUserPw.execute(model);
			return "found_pw";
		} else {
			out.println("<script>");
			out.println("alert(\"다시 시도해 주세요\");");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return "find_pw";
		}
		
	}
	
}
