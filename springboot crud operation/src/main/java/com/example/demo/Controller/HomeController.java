package com.example.demo.Controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Model.DemoModel;
import com.example.demo.Service.Demoservice;
import com.example.demo.excelview.DemoExcelview;

  
@RestController
public class HomeController {
	
	@Autowired
	Demoservice demoservice;
	
	@GetMapping(value="/")
	public ModelAndView page(Model model)
	{
		List<DemoModel> listobj = demoservice.demodetails();
		model.addAttribute("demolist", listobj);
		return new ModelAndView("Demo");
	}
	
/*	@RequestMapping(value="/Insert",method=RequestMethod.POST)*/
	@PostMapping(value="/Insert")
	public ModelAndView page(Model model,@RequestParam String name,@RequestParam Date date,@RequestParam String gender,@RequestParam String address,@RequestParam String hobbies,@RequestParam String status)
	{
		//System.out.println("name"+name+date+gender+address+hobbies+status);
		//System.out.println("date"+date);
		DemoModel insobj = new DemoModel();
		insobj.setName(name);
		insobj.setDate(date);
		insobj.setGender(gender);
		insobj.setAddress(address);
		insobj.setHobbies(hobbies);
		insobj.setStatus(status);
		demoservice.save(insobj);
		//System.out.println("name"+insobj);
		List<DemoModel> listobj = demoservice.demodetails();
		model.addAttribute("demolist", listobj);
		return new ModelAndView("Demo");
	}
	@PostMapping(value="/Edit")
	public ModelAndView Edit(Model model,@RequestParam int id)
	{
		DemoModel editobj = demoservice.demoedit(id);
		model.addAttribute("editobj", editobj);
		List<DemoModel> listobj = demoservice.demodetails();
		model.addAttribute("demolist", listobj);
		return new ModelAndView("Demo");

	}
	@PostMapping(value="/Update")
	public ModelAndView Update(Model model,@RequestParam int id,@RequestParam String name,@RequestParam Date date,@RequestParam String gender,@RequestParam String address,@RequestParam String hobbies,@RequestParam String status)
	{
		DemoModel updateobj = new DemoModel();
		updateobj.setid(id);
		updateobj.setName(name);
		updateobj.setDate(date);
		updateobj.setGender(gender);
		updateobj.setAddress(address);
		updateobj.setHobbies(hobbies);
		updateobj.setStatus(status);
		demoservice.update(updateobj);
		List<DemoModel> listobj = demoservice.demodetails();
		model.addAttribute("demolist", listobj);
		return new ModelAndView("Demo");
	}
	@PostMapping(value="/Delete")
	public ModelAndView Delete(Model model,@RequestParam int id)
	{
		demoservice.delete(id);
		List<DemoModel> listobj = demoservice.demodetails();
		model.addAttribute("demolist", listobj);
		return new ModelAndView("Demo");
	}
	@GetMapping(value="DemodetailExcel")
	public ModelAndView DemoExcel(Model model)
	{
		System.out.println("controller");
		DemoExcelview excel = new DemoExcelview();
		List<DemoModel> listobj = demoservice.demodetails();
		
		return new ModelAndView(excel,"demolist",listobj);

	}
	
}
