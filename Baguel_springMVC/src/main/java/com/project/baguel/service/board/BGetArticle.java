package com.project.baguel.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IBoardRepository;
import com.project.baguel.model.BoardDTO;
@Service
public class BGetArticle implements IBoardService {

	@Autowired
	IBoardRepository iBoardRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> BGetArticle");
		
		Map<String, Object> map = model.asMap();
		String boardNum = String.valueOf(map.get("boardNum"));
		
		BoardDTO boardArticle = iBoardRepository.getArticle(boardNum);
		model.addAttribute("boardArticle", boardArticle);
	}

}
