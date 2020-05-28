package com.myhome.www.member.service;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class RegisterRequestValidator implements Validator{
 
	
//	private static final String emailRegExp = 
//			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
//			"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
//	private Pattern pattern;
//
//	public RegisterRequestValidator() {
//		pattern = Pattern.compile(emailRegExp);
//		System.out.println("RegisterRequestValidator#new(): " + this);
//	}

	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterRequest.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegisterRequest regReq = (RegisterRequest) target;
		if (regReq.getMemberId() == null || regReq.getMemberId().trim().isEmpty()) {
			errors.rejectValue("memberId", "required");
		} /*
			 * else { Matcher matcher = pattern.matcher(regReq.getMemberId()); if
			 * (!matcher.matches()) { errors.rejectValue("memberId", "bad"); } }
			 */
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberId", "required");
		ValidationUtils.rejectIfEmpty(errors, "memberPw", "required");
		ValidationUtils.rejectIfEmpty(errors, "confirmPassword", "required");
		if (!regReq.getMemberPw().isEmpty()) {
			if (!regReq.isPasswordEqualToConfirmPassword()) {
				errors.rejectValue("confirmPassword", "nomatch");
			}
		}
	}
}
