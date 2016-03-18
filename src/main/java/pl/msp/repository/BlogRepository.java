package pl.msp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.msp.entity.Blog;
import pl.msp.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer> {
	
	List<Blog> findByUser(User user);

}
