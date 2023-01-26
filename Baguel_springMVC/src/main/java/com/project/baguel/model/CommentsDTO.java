package com.project.baguel.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class CommentsDTO {
	private String commentNum;
	private String parentComment;
	private String boardNum;
	private String writeDate;
	private String content;
	private String userId;
	private String isEdited;
	private String commentType;
	private String status;
	private String userNick;
}
