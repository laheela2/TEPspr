package com.tep.members.validator;

import org.codehaus.plexus.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.tep.members.model.MembersModel;

public class FindEmailValidator implements Validator {

	@Override
	public boolean supports(Class<?> cls) {
		return MembersModel.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MembersModel mem = (MembersModel) target;
		String name = mem.getM_name();
		String phone = mem.getM_phone();
		
		String num_regex = "^[+-]?\\d*(\\.?\\d*)$";
		String phone_regex = "^[0-9]+$";
		
		if(StringUtils.isBlank(name)){
			errors.rejectValue("m_name", "required");
		} else if(name.matches(num_regex)){
			errors.rejectValue("m_name", "reg.name.invalid");
		}
		
		if(StringUtils.isBlank(phone)){
			errors.rejectValue("m_phone", "required");
		} else if(!mem.getM_phone().matches(phone_regex)){
			errors.rejectValue("m_phone", "reg.phone.invalid");
		}
	}

}
