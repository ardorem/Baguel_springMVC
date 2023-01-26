package com.project.baguel.service.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IBoardRepository;

@Service
public class BCalcPages implements IBoardService {

	@Autowired
	IBoardRepository iBoardRepository;

	@Override
	public void execute(Model model) {
		System.out.println(">> BCalcPages");
		Map<String, Integer> pagination = new HashMap<String, Integer>();
		Map<String, Object> map = model.asMap();

		int minArticle = 0; // init
		int maxArticle = 0; // init
		int totalArticles = iBoardRepository.countArticles();
		int articlesToShow = 10;

		int currentPage = (int) map.get("currentPage");
		int startPage = 0; // init
		int endPage = 0; // init
		int totalPages = 0; // init
		int pagesToShow = 2;
		boolean pageOutOfRange = false;

		if (totalArticles != 0) {
			while (!(pageOutOfRange)) {
				// minArticle, maxArticle 계산
				minArticle = articlesToShow * (currentPage - 1) + 1;
				maxArticle = articlesToShow * (currentPage - 1) + articlesToShow;
				if (maxArticle > totalArticles) {
					maxArticle = totalArticles;
				}
				// startPage, endPage 계산
				startPage = currentPage / pagesToShow * pagesToShow + 1;
				if ((currentPage % pagesToShow) == 0) {
					startPage -= pagesToShow;
				}

				// totalPages
				totalPages = totalArticles / articlesToShow + 1;
				if (totalArticles % articlesToShow == 0) {
					totalPages -= 1;
				}

				endPage = startPage + pagesToShow - 1;
				if (endPage > totalPages) {
					endPage = totalPages;
				}

				// 시작-끝 페이지의 범위를 벗어난 페이지를 요청 할 경우
				if (currentPage < 1 || currentPage > endPage) {
					currentPage = 1;
				} else {
					pageOutOfRange = true;
				}
			}
		} else {
			minArticle = 0;
			maxArticle = 0;
			startPage = 0;
			endPage = 0;
			totalPages = 0;
		}
		pagination.put("minArticle", minArticle);
		pagination.put("maxArticle", maxArticle);
		pagination.put("totalArticles", totalArticles);
		pagination.put("currentPage", currentPage);
		pagination.put("startPage", startPage);
		pagination.put("endPage", endPage);
		pagination.put("pagesToShow", pagesToShow);
		pagination.put("totalPages", totalPages);
		
		model.addAttribute("pagination", pagination);
	}

}
