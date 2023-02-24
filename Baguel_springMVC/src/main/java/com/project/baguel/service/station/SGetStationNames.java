package com.project.baguel.service.station;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IStationRepository;

@Service
public class SGetStationNames implements IStationService {

	@Autowired
	IStationRepository iStationRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> SGetStationNames");
		String[] lines = {"1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선"};
		
		for(String line : lines) {
			if(line.equals("1호선")) {
				model.addAttribute("line1", iStationRepository.getStationNames(line));
			}
			if(line.equals("2호선")) {
				model.addAttribute("line2", iStationRepository.getStationNames(line));
			}
			if(line.equals("3호선")) {
				model.addAttribute("line3", iStationRepository.getStationNames(line));
			}
			if(line.equals("4호선")) {
				model.addAttribute("line4", iStationRepository.getStationNames(line));
			}
			if(line.equals("5호선")) {
				model.addAttribute("line5", iStationRepository.getStationNames(line));
			}
			if(line.equals("6호선")) {
				model.addAttribute("line6", iStationRepository.getStationNames(line));
			}
			if(line.equals("7호선")) {
				model.addAttribute("line7", iStationRepository.getStationNames(line));
			}
			if(line.equals("8호선")) {
				model.addAttribute("line8", iStationRepository.getStationNames(line));
			}
		}
		
	}

}
