package pl.msp.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pl.msp.entity.Stock;
import pl.msp.entity.Unit;
import pl.msp.service.UnitService;

@Controller
public class UnitController {

	@Autowired
	private UnitService unitService;
	
	@ModelAttribute("unit")
	public Unit constructFormModelToAddUnit(){
		return new Unit();
	}
	
	@RequestMapping(value="/units", method=RequestMethod.POST)
	public String saveUnitToDb(@Valid @ModelAttribute("unit") Unit unit, BindingResult result, RedirectAttributes redirectAttributes) {
		if(result.hasErrors()){
			return "units";
		}
		unitService.save(unit);
		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/units.html";
	}
	
	@RequestMapping("/units")
	public String showUnitsList(Model model){
		model.addAttribute("units", unitService.findAll());
		return "units";
	}
}
