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
import pl.msp.service.StockService;

@Controller
public class StockController {
	
	@Autowired
	private StockService stockService;
	
	@ModelAttribute("stock")
	public Stock constructFormModelToAddStock() {
		return new Stock();
	}
	
	@RequestMapping(value="/stocks", method=RequestMethod.POST)
	public String saveStockToDb(@Valid @ModelAttribute("stock") Stock stock, BindingResult result, RedirectAttributes redirectAttributes) {
		if(result.hasErrors()){
			return "stocks";
		}
		stockService.save(stock);
		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/stocks.html";
	}
	
	@RequestMapping("/stocks")
	public String showStocksList(Model model){
		model.addAttribute("stocks", stockService.findAll());
		return "stocks";
	}
	


}
