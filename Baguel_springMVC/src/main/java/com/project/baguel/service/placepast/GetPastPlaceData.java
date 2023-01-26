package com.project.baguel.service.placepast;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.baguel.dao.IPLacePastRepository;
import com.project.baguel.model.PlaceDTO;
import com.project.baguel.model.PlacePastDTO;

@Service
public class GetPastPlaceData implements IPlacePastService {

	@Autowired
	IPLacePastRepository iPLacePastRepository;

	@Override
	public void execute(Model model) {
		System.out.println(">> GetPastPlaceData");
		Map<String, Object> map = model.asMap();
		PlaceDTO placeDTO = (PlaceDTO) map.get("placeDTO");
		String place = placeDTO.getPlace();
		String fcstDate = placeDTO.getFcstDate();
		String month = fcstDate.substring(4, 6);
		String baseDate = null;

		if (month.equals("01")) {
			baseDate = "'2019-01%'";
		} else if (month.equals("02")) {
			baseDate = "'2019-02%'";
		} else if (month.equals("03")) {
			baseDate = "'2019-03%'";
		} else if (month.equals("04")) {
			baseDate = "'2019-04%'";
		} else if (month.equals("05")) {
			baseDate = "'2019-05%'";
		} else if (month.equals("06")) {
			baseDate = "'2019-06%'";
		} else if (month.equals("07")) {
			baseDate = "'2019-07%'";
		} else if (month.equals("08")) {
			baseDate = "'2019-08%'";
		} else if (month.equals("09")) {
			baseDate = "'2019-09%'";
		} else if (month.equals("10")) {
			baseDate = "'2019-10%'";
		} else if (month.equals("11")) {
			baseDate = "'2019-11%'";
		} else if (month.equals("12")) {
			baseDate = "'2019-12%'";
		}

		ArrayList<PlacePastDTO> pastData = new ArrayList<PlacePastDTO>();

		if (place.equals("gBpalace")) {
			pastData = iPLacePastRepository.getGbpData(baseDate);
		} else if (place.equals("dSpalace")) {
			pastData = iPLacePastRepository.getDspData(baseDate);
		} else if (place.equals("cGpalace")) {
			pastData = iPLacePastRepository.getCgpData(baseDate);
		} else if (place.equals("cDpalace")) {
			pastData = iPLacePastRepository.getCdpData(baseDate);
		} else if (place.equals("cGarden")) {
			pastData = iPLacePastRepository.getCgardenData(baseDate);
		} else if (place.equals("sema")) {
			pastData = iPLacePastRepository.getSemaData(baseDate);
		}
		System.out.println(pastData);
		model.addAttribute("pastData", pastData);
	}

}
