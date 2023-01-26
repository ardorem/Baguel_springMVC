package com.project.baguel.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.ICommentsRepository;

@Service
public class BDeactiveComment implements IBoardService {

	@Autowired
	ICommentsRepository ICommentsRepository;
	
	@Override
	public void execute(Model model) {
		System.out.println(">> BDeactiveArticle");
		Map<String, Object> map = model.asMap();
		String commentNum = String.valueOf(map.get("commentNum"));
		ICommentsRepository.deactiveComment(commentNum);
	}

}
