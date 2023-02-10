package com.project.baguel.service.place;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IPlaceRepository;

@Service
public class PGetXys implements IPlaceService {

	@Autowired
	IPlaceRepository iPlaceRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> PGetXys");
		String[] xys = iPlaceRepository.getXys();
		model.addAttribute("xys",xys);
	}

}
