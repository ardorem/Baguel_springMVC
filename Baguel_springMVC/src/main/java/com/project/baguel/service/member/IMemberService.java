package com.project.baguel.service.member;

import org.springframework.ui.Model;

public interface IMemberService {
	public static final int MEMBER_NOEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	void execute(Model model);
}
