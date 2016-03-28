package pl.msp.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.msp.entity.User;
import pl.msp.service.UserService;

@Controller
public class RegiterController {

	@Autowired
	private UserService userService;

	@ModelAttribute("user")
	public User construcUser() {
		return new User();
	}

	@RequestMapping("/register")
	public String showRegister() {
		return "user-register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String doRegister(@Valid @ModelAttribute("user") User user, BindingResult result) {
		if (result.hasErrors()) {
			return "user-register";
		}
		userService.save(user);
		return "redirect:/register.html?success=true";
	}
	
	@RequestMapping("/register/available")
	@ResponseBody
	public String available(@RequestParam String name){
		Boolean userNotExist = userService.findOne(name) == null;
		return userNotExist.toString();
	}
}
