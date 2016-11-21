package com.tep.meetings.validator;

import org.codehaus.plexus.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tep.meetings.model.MeetingsModel;

public class MeetingsValidator implements Validator{

	@Override
	public boolean supports(Class<?> cls) {
		return MeetingsModel.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mt_category", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mt_title", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mt_addr", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mt_subject", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mt_content", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mt_total_pnum", "required");

		MeetingsModel mm = (MeetingsModel) target;
		if(StringUtils.isBlank(mm.getMt_rsdate()) || StringUtils.isBlank(mm.getMt_redate())){
			errors.rejectValue("mt_rsdate", "required");
		}
		if(StringUtils.isBlank(mm.getMt_msdate()) || StringUtils.isBlank(mm.getMt_medate())){
			errors.rejectValue("mt_msdate", "required");
		}
		if(mm.getMt_total_pnum() < 2){
			errors.rejectValue("mt_total_pnum", "meet.total.pnum.limit");
		}
	}

}
