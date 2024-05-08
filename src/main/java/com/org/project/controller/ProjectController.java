package com.org.project.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.org.project.dto.SellerPagedDTO;
import com.org.project.entity.Sellers;
import com.org.project.service.ProjectService;

@RestController
public class ProjectController {

	@Autowired
	private ProjectService service;

	@GetMapping("/getAllSeller")
	public List<Sellers> getAllSeller() {
		return service.getAllSeller();
	}

	@GetMapping("/filterSellerByProducerId/{id}")
	public List<Sellers> filterSellerByProducerId(@PathVariable UUID id) {
		return service.filterSellerByProducerId(id);
	}

	@GetMapping("/filterSellerByName/{name}")
	public List<Sellers> filterSellerByName(@PathVariable String name) {
		return service.filterSellerByName(name);
	}

	@GetMapping("/filterSellerByMarketplaceId/{id}")
	public List<Sellers> filterSellerByMarketplaceId(@PathVariable String id) {
		return service.filterSellerByMarketplaceId(id);
	}

	@GetMapping("/getSellersBySortCriteria/{criteria}")
	public List<Sellers> getSellersBySortCriteria(@PathVariable String criteria) {
		return service.getSellersBySortCriteria(criteria);
	}

	@GetMapping("/getSellersByPage/{pageNum}")
	public SellerPagedDTO getSellersByPage(@PathVariable int pageNum) {
		return service.getSellersbyPage(pageNum);
	}
}
