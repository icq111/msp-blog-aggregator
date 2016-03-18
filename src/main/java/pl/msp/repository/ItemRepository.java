package pl.msp.repository;


import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import pl.msp.entity.Blog;
import pl.msp.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {
	
	List<Item> findByBlog(Blog blog, Pageable pageRequest);

}
