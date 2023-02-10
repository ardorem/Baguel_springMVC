package com.project.baguel.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class StationDTO {
	private String stationName;
	private String stationNo;
	private String line;
	private String lineNo;
	private String lat;
	private String lng;
	private String err; //Expected rush ratio
	private String selectDate;
}
