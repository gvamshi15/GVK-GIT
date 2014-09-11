/**
 * 
 */
package com.ram.sai.controller;

import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.ram.sai.business.EmployeeManager;
import com.ram.sai.business.SpringException;
import com.ram.sai.model.Employee;
import com.ram.sai.model.Interests;
import com.ram.sai.model.Skills;

/**
 * @author Lenovo
 *
 */
@Controller
@SessionAttributes(value = "{employee}")
public class EmployeeController {

	// private static final String saveDirectory = "C:/Vamshi/Uploads/";
	@Autowired
	private EmployeeManager employeeManager;

	// private File file1;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(byte[].class,
				new ByteArrayMultipartFileEditor());
		binder.registerCustomEditor(Set.class, "skills",
				new CustomCollectionEditor(Set.class) {
					@Override
					protected Object convertElement(Object element) {

						try {
							Integer id = null;

							if (element instanceof Set<?>) {
								System.out
										.println("Converting from Set to Skill: "
												+ element.getClass().getName());

								// return element.Skill();
							}
							if (element instanceof Skills) {
								System.out
										.println("Converting from Skills to Skill: "
												+ element);
								return ((Skills) element).getSkill();
							} else if (element instanceof String
									&& !((String) element).equals("")) {
								// From the JSP 'element' will be a String
								try {
									id = Integer.parseInt((String) element);
								} catch (NumberFormatException e) {
									System.out.println("Element was "
											+ ((String) element));
									e.printStackTrace();
									throw new SpringException(e.getMessage());
								}
							} else if (element instanceof Integer) {
								// From the database 'element' will be a Long
								id = (Integer) element;
							} else {
								System.out.println("Finally Else(Skills): "
										+ element.getClass().getName());
							}
							return id != null ? employeeManager.loadSkill(id)
									: null;
						} catch (Exception e) {
							System.out.println("Exception" + e);
							throw new SpringException(e.getMessage());
						}
					}
				});

		binder.registerCustomEditor(Set.class, "interests",
				new CustomCollectionEditor(Set.class) {
					@Override
					protected Object convertElement(Object element) {
						try {
							Integer id = null;
							if (element instanceof Interests) {
								System.out
										.println("Converting from Interests to Interest: "
												+ element);
								return ((Interests) element).getInterest();
							} else if (element instanceof String
									&& !((String) element).equals("")) {
								// From the JSP 'element' will be a String
								try {
									id = Integer.parseInt((String) element);
								} catch (NumberFormatException e) {
									System.out.println("Element was "
											+ ((String) element));
									throw new SpringException(e.getMessage());
								}
							} else if (element instanceof Integer) {
								// From the database 'element' will be a Long
								id = (Integer) element;
							} else {
								System.out.println("Finally Else(Skills): "
										+ element.getClass().getName());
							}
							return id != null ? employeeManager
									.loadInterest(id) : null;
						} catch (Exception e) {
							System.out.println("Exception" + e);
							throw new SpringException(e.getMessage());
						}
					}
				});
	}

	@RequestMapping("/employee")
	public Employee setup(ModelMap model, SessionStatus status) {
		model = createModelWithDefault(model);
		// status.setComplete();
		return employeeManager.getInstance();
	}

	@ExceptionHandler({ SpringException.class })
	private ModelMap createModelWithDefault(ModelMap model) {
		try {
			model.addAttribute("skillValues", employeeManager.loadSkills());
			model.addAttribute("interestsValues",
					employeeManager.loadInterests());
		} catch (Exception e) {
			throw new SpringException(e.getMessage());
		}
		String house[] = { "UK", "US", "IN", "AUS", "DE", "NL", "Hyd", "Hnk" };
		model.addAttribute("houseValues", house);
		// System.out.println(employeeManager.loadEmployee().toString());
		return model;
	}

	@RequestMapping(value = "/addemployee", method = RequestMethod.POST)
	@ExceptionHandler({ SpringException.class })
	public String addEmployee(@Valid Employee employee, BindingResult result,
			ModelMap model, SessionStatus status) {
		try {
			if (result.hasErrors()) {
				model = createModelWithDefault(model);
				// employee.setFile_2(new File(employee.getFile_1()));
				employeeManager.setEmployee(employee);
				status.setComplete();
				return "employee";
			} else {
				/*
				 * if (employee.getFile_2() != null) { file1 = new
				 * File(saveDirectory +
				 * employee.getFile_2().getOriginalFilename()); // file1 = new
				 * // File(employee.getFile_2().getOriginalFilename());
				 * employee.getFile_2().transferTo(file1);
				 * employee.setFile_1(file1);
				 * 
				 * } else if (employeeManager.getInstance().getFile_1() != null)
				 * { employee.setFile_1(employeeManager.getInstance()
				 * .getFile_1()); }
				 */
				employeeManager.addEmployee(employee);
				employeeManager.setEmployee(employee);
				model.addAttribute("employee", employee);
				status.setComplete();
				return "employeeDetails";
			}
		} /*
		 * catch (IllegalStateException e) { throw new
		 * SpringException(e.getMessage()); } catch (IOException e) { throw new
		 * SpringException(e.getMessage()); }
		 */
		catch (Exception e) {
			throw new SpringException(e.getMessage());
		}

	}

	@RequestMapping(value = "/updateEmployee", method = RequestMethod.GET)
	public String updateEmployee(ModelMap model, SessionStatus status) {
		employeeManager.setEmployee(employeeManager
				.loadEmployee(employeeManager.getInstance().getEmpId()));
		createModelWithDefault(model);
		return "redirect:employee";
	}

}
