package com.project.baguel.service.map;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IMapRepository;
import com.project.baguel.model.StationDTO;

@Service
public class MGetAllErr implements IMapService {

	@Autowired
	IMapRepository iMapRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> MGetAllErr");
		
		String[] lines = iMapRepository.getAllLines();
		System.out.println("getAllLines D O N E");
		Map<String, Object> map = model.asMap();
		String selectDate = String.valueOf(map.get("selectDateStation"));
		ArrayList<StationDTO> errTmp = new ArrayList<StationDTO>();
		for(String line : lines) {
			if(line.equals("1호선")) {
				System.out.println("selectDate : " + selectDate);
				System.out.println("line : " + line);
				errTmp = iMapRepository.getAllErr(selectDate, line);
				model.addAttribute("line1", errTmp);
				System.out.println(errTmp.size());
				System.out.println(line + " D O N E");
			}
			if(line.equals("2호선")) {
				model.addAttribute("line2", iMapRepository.getAllErr(selectDate, line));
				System.out.println(line + " D O N E");
			}
			if(line.equals("3호선")) {
				model.addAttribute("line3", iMapRepository.getAllErr(selectDate, line));
				System.out.println(line + " D O N E");
			}
			if(line.equals("4호선")) {
				model.addAttribute("line4", iMapRepository.getAllErr(selectDate, line));
				System.out.println(line + " D O N E");
			}
			if(line.equals("5호선")) {
				model.addAttribute("line5", iMapRepository.getAllErr(selectDate, line));
				System.out.println(line + " D O N E");
			}
			if(line.equals("6호선")) {
				model.addAttribute("line6", iMapRepository.getAllErr(selectDate, line));
				System.out.println(line + " D O N E");
			}
			if(line.equals("7호선")) {
				model.addAttribute("line7", iMapRepository.getAllErr(selectDate, line));
				System.out.println(line + " D O N E");
			}
			if(line.equals("8호선")) {
				model.addAttribute("line8", iMapRepository.getAllErr(selectDate, line));
				System.out.println(line + " D O N E");
			}
			
		}
	}

}
