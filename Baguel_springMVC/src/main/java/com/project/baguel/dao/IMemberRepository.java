package com.project.baguel.dao;

import java.sql.Timestamp;

import org.apache.ibatis.annotations.Param;

import com.project.baguel.model.MemberDTO;

public interface IMemberRepository {
//	MemberDTO testing(@Param("memnum") String memnum);
//	void testing0();
		String userCheck(@Param("userId")String userId);
		MemberDTO getMember(@Param("userId")String userId);
		
		String insertIdCheck(@Param("userId")String userId);
		String insertNickCheck(@Param("userNick")String userNick);
		String updateNickCheck(@Param("userId")String userId, @Param("userNick")String userNick);
		void insertMember(@Param("userId")String userId,
				@Param("userPw")String userPw,
				@Param("userName")String userName,
				@Param("userNick")String userNick,
				@Param("userEmail")String userEmail,
				@Param("joinDate")Timestamp joinDate);
		
		void updateMember(@Param("userId")String userId,
				@Param("userPw")String userPw,
				@Param("userName")String userName,
				@Param("userNick")String userNick,
				@Param("userEmail")String userEmail);
		void deactiveMember(@Param("userId")String userId);
		
		MemberDTO findUserId(@Param("userName")String userName, @Param("userEmail")String userEmail);
		String resetUserPwCheck(@Param("userId")String userId, @Param("userName")String userName, @Param("userEmail")String userEmail);
		void resetUserPw(@Param("newPw")String newPw, @Param("userId")String userId);
}
