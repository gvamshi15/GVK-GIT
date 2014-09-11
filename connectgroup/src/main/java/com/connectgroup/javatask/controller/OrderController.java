package com.connectgroup.javatask.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connectgroup.javatask.dom.JsonResponse;
import com.connectgroup.javatask.dom.Order;
import com.connectgroup.javatask.service.OrderService;
import com.connectgroup.javatask.validator.OrderValidator;

/**
 * Handles requests for the order page.
 */

@Controller
public class OrderController {

	private static final Logger logger = LoggerFactory
			.getLogger(OrderController.class);

	private OrderService orderService;
	private OrderValidator orderValidator;

	/**
	 * @param orderValidator the orderValidator to set
	 */
	@Autowired
	public void setOrderValidator(OrderValidator orderValidator) {
		this.orderValidator = orderValidator;
	}

	/**
	 * @param orderService
	 *            the orderService to set
	 */
	@Autowired
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Model model) {
		logger.info("In Setup method");
		model.addAttribute("order", new Order());
		return "order";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody JsonResponse createOrder(
			@RequestBody @Validated Order order,
			BindingResult bindingResult, Model model) {

		JsonResponse response = new JsonResponse();
		logger.info("Received json request, in Create Order method");
		if (bindingResult.hasErrors()) {
			logger.info("view page");
			response.setStatus("FAIL");
			response.setLocation("order");
			response.setResult(bindingResult.getAllErrors());
			return response;
		}
		// use ResponseEntity if needed
		orderService.createOrder(order);
		response.setStatus("SUCCESS");
		response.setLocation("view");
		return response;
	}

	@RequestMapping(value = { "/view", "/" }, method = RequestMethod.GET)
	public String view(Model model) {
		logger.info("view page");
		List<Order> orderlist = orderService.getOrders();
		model.addAttribute("orderlist", orderlist);
		return "orderview";
	}

	@InitBinder
	public void initBind(WebDataBinder binder) {
		binder.setDisallowedFields("orderId");
		binder.addValidators(orderValidator);
	}

}
