package pl.msp.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.msp.entity.Unit;
import pl.msp.repository.UnitRepository;

@Service
public class UnitService {

	@Autowired
	UnitRepository unitRepository;
	
	public List<Unit> findAll() {
		return unitRepository.findAll();
	}

	public void save(Unit unit) {
		Date date = new Date();
		unit.setInsertDate(date);
		//stock.setStatus(true);
		unitRepository.save(unit);
	}
	
}
