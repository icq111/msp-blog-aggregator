package pl.msp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.msp.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByName(String name);

}
