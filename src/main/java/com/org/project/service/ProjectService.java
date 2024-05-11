package com.org.project.service;

import java.util.List;
import java.util.UUID;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.project.dao.SellersDao;
import com.org.project.dao.Test;
import com.org.project.dto.SellerPagedDTO;
import com.org.project.entity.Sellers;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;

@Service
public class ProjectService {
	@Autowired
	private SellersDao sellerDao;

	@PersistenceContext
	private EntityManager entityMgr;

	private static final Integer ITEMS_PER_PAGE = 10;

	public List<Sellers> getAllSeller() {
		return sellerDao.findAll();
	}

	public List<Sellers> filterSellerByProducerId(UUID id) {
		return sellerDao.findByProducerId(id);
	}

	public List<Sellers> filterSellerByName(String name) {
		return sellerDao.filterSellerByName(name);
	}

	public List<Sellers> filterSellerByMarketplaceId(String id) {
		return sellerDao.filterSellerByMarketplaceId(id);
	}

	public List<Sellers> getSellersBySortCriteria(String criteria) {
		switch (criteria) {
		case "SELLER_INFO_EXTERNAL_ID_ASC": {
			return sellerDao.getSellerInfoExtIdAsc();
		}
		case "SELLER_INFO_EXTERNAL_ID_DESC": {
			return sellerDao.getSellerInfoExtIdDesc();
		}
		case "NAME_ASC": {
			return sellerDao.getNameAsc();
		}
		case "NAME_DESC": {
			return sellerDao.getNameDesc();
		}
		case "MARKETPLACE_ID_ASC": {
			return sellerDao.getMarketplaceIdAsc();
		}
		case "MARKETPLACE_ID_DESC": {
			return sellerDao.getMarketplaceIdDesc();
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + criteria);
		}
	}

	public SellerPagedDTO getSellersbyPage(int pageNum) {
		List<Sellers> sellersbyPage = sellerDao.getSellersbyPage((pageNum - 1) * ITEMS_PER_PAGE, ITEMS_PER_PAGE);
		SellerPagedDTO sellersDto = new SellerPagedDTO();
		sellersDto.setPageNumber(pageNum);
		sellersDto.setPageSize(ITEMS_PER_PAGE);
		sellersDto.setSellers(sellersbyPage);
		sellersDto.setTotalPages(sellerDao.count());
		sellersDto.setSortby("ID");
		return sellersDto;
	}

}
