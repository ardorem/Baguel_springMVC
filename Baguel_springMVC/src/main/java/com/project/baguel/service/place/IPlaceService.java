package com.project.baguel.service.place;

import org.springframework.ui.Model;

public interface IPlaceService {
	public static final int WEATHER_NOEXISTENT = 0;
	public static final int WEATHER_EXISTENT = 1;
	
	
	void execute(Model model);
}
