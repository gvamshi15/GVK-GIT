/**
 * 
 */
package com.connectgroup.javatask.validator;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.connectgroup.javatask.common.AppConstants;
import com.connectgroup.javatask.dom.Order;

/**
 * @author Lenovo
 *
 */
public class OrderValidatorImpl implements OrderValidator {

	private static final Logger logger = LoggerFactory
			.getLogger(OrderValidatorImpl.class);

	private MessageSource messages;

	@Autowired
	public void setMessages(MessageSource messages) {
		this.messages = messages;
	}

	@Override
	public boolean supports(Class<?> paramClass) {
		return Order.class.equals(paramClass);
	}

	private boolean isValidPhoneNumber(BigInteger phoneNo) throws UnsupportedEncodingException {
		// validate phone numbers of format "1234567890"
		logger.debug("Phone number" + phoneNo.toString());
		return phoneNo.toString().matches("\\d{9,10}");
	}

	// private method for getting message from message resources
	private String getMessage(String requiredField) {
		return this.messages.getMessage(AppConstants.REQUIRED,
				new Object[] { requiredField }, null);
	}


	@Override
	public void validate(Object obj, Errors errors) {
		Order order = (Order) obj;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name",
				getMessage("Name"));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dob",
				getMessage("Date of Birth"));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone",
				getMessage("Mobile"));
		if (null == errors.getFieldError("phone")) {
			try {
				if (!(isValidPhoneNumber(order.getPhone()))) {
					errors.rejectValue("phone",
							this.messages.getMessage("phone.invalid", null, null));
				}
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMessageException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pin",
				getMessage("PostCode"));
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "product",
				getMessage("Product"));
	}
}
