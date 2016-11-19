package com.tep.members.validator;

import org.codehaus.plexus.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tep.members.model.MembersModel;

public class LoginValidator implements Validator {

	@Override
	public boolean supports(Class<?> cls) {
		return MembersModel.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_password", "required");
		
		MembersModel mem = (MembersModel) target;
		String email_regex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
		if(StringUtils.isBlank(mem.getM_email())){
			errors.rejectValue("m_email", "required");
		} else if(!mem.getM_email().matches(email_regex)){
			errors.rejectValue("m_email", "reg.email.invalid");
		}
	}

}
