package pl.msp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.msp.entity.Stock;


public interface StockRepository extends JpaRepository<Stock, Integer> {

}
