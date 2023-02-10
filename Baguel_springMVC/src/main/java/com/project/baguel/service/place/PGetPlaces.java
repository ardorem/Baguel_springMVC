package com.project.baguel.service.place;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IPlaceRepository;
import com.project.baguel.model.PlaceDTO;

@Service
public class PGetPlaces implements IPlaceService {

	@Autowired
	IPlaceRepository iPlaceRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> PGetPlaces");
		
		ArrayList<PlaceDTO> places = new ArrayList<PlaceDTO>();
		
		places = iPlaceRepository.getPlaces();
		System.out.println(places.size());
		model.addAttribute("places", places);
	}

}
