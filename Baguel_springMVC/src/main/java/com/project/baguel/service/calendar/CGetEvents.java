package com.project.baguel.service.calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IBoardRepository;
@Service
public class CGetEvents implements ICalendarService {

	@Autowired
	IBoardRepository iBoardRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> CGetEvents");
		model.addAttribute("events", iBoardRepository.getEvents());
		
	}

}
