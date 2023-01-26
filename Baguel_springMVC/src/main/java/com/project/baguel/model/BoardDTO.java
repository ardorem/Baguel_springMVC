package com.project.baguel.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class BoardDTO {
	private String rownumber;
	private String boardNum; //
	private String eventFrom;
	private String eventTo;
	private String eventPlace;
	private String eventType;
	private String event;
	private String writeDate; //
	private String editDate;
	private String eventDesc;
	private String adminMSG;
	private String userId;
	private String viewcount;
	private String approval; //
	private String status; //
	private String userNick;
}
