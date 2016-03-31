package pl.msp.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.msp.entity.Stock;
import pl.msp.repository.StockRepository;

@Service
@Transactional
public class StockService {
	
	@Autowired
	private StockRepository stockRepository;

	public List<Stock> findAll() {
		return stockRepository.findAll();
	}

	public void save(Stock stock) {
		Date date = new Date();
		stock.setInsertDate(date);
		//stock.setStatus(true);
		stockRepository.save(stock);
	}
	
	

}
