package pl.msp.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import pl.msp.entity.Blog;
import pl.msp.entity.Item;
import pl.msp.entity.Role;
import pl.msp.entity.User;
import pl.msp.repository.BlogRepository;
import pl.msp.repository.ItemRepository;
import pl.msp.repository.RoleRepository;
import pl.msp.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	public List<User> findAll(){
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}

	public User findOneWithBlogs(int id) {
		//handle lazy initialization exception - use this method!!! not a filter in application context
		User user = findOne(id);
		List<Blog> blogs = blogRepository.findByUser(user);
		for (Iterator iterator = blogs.iterator(); iterator.hasNext();) {
			Blog blog = (Blog) iterator.next();
			List<Item> items = itemRepository.findByBlog(blog, new PageRequest(0, 200, Direction.ASC, "name"));
			blog.setItems(items);
		}
		user.setBlogs(blogs);
		//----------------------------------------------------------------------------------------------
		return user;
	}

	public void save(User user) {
		user.setStatus(true);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
		
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleRepository.findByName("ROLE_USER"));
		user.setRoles(roles);
		userRepository.save(user);
	}

	public User findOneWithBlogs(String name) {
		User user = userRepository.findByName(name);
		return findOneWithBlogs(user.getId());
	}

	public void delete(int id) {
		userRepository.delete(id);
	}

	
	
}
