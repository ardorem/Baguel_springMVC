package com.project.baguel.model;

import java.sql.Date;

import java.util.Calendar;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class StationDTO {
	
	private Calendar now = Calendar.getInstance();
	private int weekOfYear = now.get(Calendar.WEEK_OF_YEAR);
	private int dayOfWeek = now.get(Calendar.DAY_OF_WEEK);
	
	
	private Date selectDate;
	private String line;
	private String stationName;
	private String ERR;
	private int dayNumber;
	private String direction;
	private String t55_65;
	private String t70_95;
	private String t100_165;
	private String t170_195;
	private String t200_215;
	private String t220_last;
}
