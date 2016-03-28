package pl.msp.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import pl.msp.repository.UserRepository;

public class UniqueUserNameValidator implements ConstraintValidator<UniqueUserName, String> {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public void initialize(UniqueUserName constraintAnnotation) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if(userRepository == null){
			return true;
		}
		return userRepository.findByName(value) == null;
	}

}
