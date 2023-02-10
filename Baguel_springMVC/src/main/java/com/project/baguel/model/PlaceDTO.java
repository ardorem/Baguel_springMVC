package com.project.baguel.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class PlaceDTO {
	private String place;
	private String placeName;
	private String fcstDate;
	private String avgTemp;
	private String precipitation;
	private String inputDate;
	private String day;
	private String xy;
	private String visitors;
	
	private String lng;
	private String lat;
	
}
