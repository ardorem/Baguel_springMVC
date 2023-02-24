package com.project.baguel.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class StationDTO {
	private String selectDate;
	private String line;
	private String stationName;
	private String err;
	private int dayNumber;
	private String direction;
	private String t55_65;
	private String t70_95;
	private String t100_165;
	private String t170_195;
	private String t200_215;
	private String t220_last;
}
