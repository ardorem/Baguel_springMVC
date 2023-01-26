package com.project.baguel.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IBoardRepository;
import com.project.baguel.model.BoardDTO;

@Service
public class BInsertArticle implements IBoardService {

	@Autowired
	IBoardRepository iBoardRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> BInsertArticle");
		Map<String, Object> map = model.asMap();
		BoardDTO boardDTO = (BoardDTO) map.get("boardDTO");
		String eventFrom = boardDTO.getEventFrom();
		String eventTo = boardDTO.getEventTo();
		String eventPlace  = boardDTO.getEventPlace();
		String eventType = boardDTO.getEventType();
		String event = boardDTO.getEvent();
		String eventDesc = boardDTO.getEventDesc();
		String userId = boardDTO.getUserId();
		
		iBoardRepository.insertArticle(eventFrom, eventTo, eventPlace, eventType, event, eventDesc, userId);
//		model.addAttribute("eventPlace", eventPlace);
//		model.addAttribute("event", event);
	}

}
