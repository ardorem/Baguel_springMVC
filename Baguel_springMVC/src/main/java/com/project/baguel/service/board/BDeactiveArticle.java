package com.project.baguel.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IBoardRepository;
@Service
public class BDeactiveArticle implements IBoardService {

	@Autowired
	IBoardRepository iBoardRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> BDeactiveArticle");
		Map<String, Object> map = model.asMap();
		String boardNum = String.valueOf(map.get("boardNum"));
		iBoardRepository.deactiveArticle(boardNum);
	}

}
