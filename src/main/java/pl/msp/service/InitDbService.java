package pl.msp.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
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

@Transactional
@Service
public class InitDbService {

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BlogRepository blogRepository;

	@Autowired
	private ItemRepository itemRepository;

	@PostConstruct
	public void init() {
		if (roleRepository.findByName("ROLE_ADMIN") == null) {
			Role roleUser = new Role();
			roleUser.setName("ROLE_USER");
			roleRepository.save(roleUser);

			Role roleAdmin = new Role();
			roleAdmin.setName("ROLE_ADMIN");
			roleRepository.save(roleAdmin);

			User userAdmin = new User();
			userAdmin.setName("admin");
			userAdmin.setStatus(true);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			userAdmin.setPassword(encoder.encode("admin"));
			List<Role> roles = new ArrayList<Role>();
			roles.add(roleAdmin);
			roles.add(roleUser);
			userAdmin.setRoles(roles);
			userRepository.save(userAdmin);

			Item item1 = new Item();
			item1.setName("Item 1");
			itemRepository.save(item1);

			Item item2 = new Item();
			item1.setName("Item 2");
			itemRepository.save(item2);

			Blog blog = new Blog();
			blog.setName("Jakis blog");
			blog.setUser(userAdmin);
			List<Item> items = new ArrayList<Item>();
			items.add(item1);
			items.add(item2);
			blog.setItems(items);
			blogRepository.save(blog);

		}
	}
}
