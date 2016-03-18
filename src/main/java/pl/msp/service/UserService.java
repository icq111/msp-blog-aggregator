package pl.msp.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import pl.msp.entity.Blog;
import pl.msp.entity.Item;
import pl.msp.entity.User;
import pl.msp.repository.BlogRepository;
import pl.msp.repository.ItemRepository;
import pl.msp.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	public List<User> findAll(){
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}

	public User findOneWithBlogs(int id) {
		User user = findOne(id);
		List<Blog> blogs = blogRepository.findByUser(user);
		for (Iterator iterator = blogs.iterator(); iterator.hasNext();) {
			Blog blog = (Blog) iterator.next();
			List<Item> items = itemRepository.findByBlog(blog, new PageRequest(0, 200, Direction.ASC, "name"));
			blog.setItems(items);
		}
		user.setBlogs(blogs);
		return user;
	}
	
}
