package com.project.baguel.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MemberDTO {
	private String userId;
	private String userPw;
	private String userName;
	private String userNick;
	private String userEmail;
	private Timestamp joindate;
}
