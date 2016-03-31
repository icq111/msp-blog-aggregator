package pl.msp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.msp.entity.Unit;

public interface UnitRepository  extends JpaRepository<Unit, Integer> {

}
