package pl.msp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.msp.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

	Role findByName(String string);

}
