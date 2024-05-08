package com.org.project.dto;

import java.util.List;

import com.org.project.entity.Sellers;

public class SellerPagedDTO {

	private long totalPages;
	private int pageNumber;
	private int pageSize;
	private List<Sellers> sellers;
	private String sortby;

	public long getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(long totalPages) {
		this.totalPages = totalPages;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<Sellers> getSellers() {
		return sellers;
	}

	public void setSellers(List<Sellers> sellers) {
		this.sellers = sellers;
	}

	public String getSortby() {
		return sortby;
	}

	public void setSortby(String sortby) {
		this.sortby = sortby;
	}

}
