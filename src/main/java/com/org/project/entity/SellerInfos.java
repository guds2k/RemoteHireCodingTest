package com.org.project.entity;

import java.util.List;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "seller_infos")
public class SellerInfos {

	@Id
	private UUID id;

	@Column(name = "marketplace_id")
	private String marketplaceId;

	@Column(name = "name")
	private String name;

	@Column(name = "url")
	private String url;

	@Column(name = "country")
	private String country;

	@Column(name = "external_id")
	private String externalId;

	@JsonBackReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sellerInfo", cascade = CascadeType.ALL)
	private List<Sellers> sellers;

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public String getMarketplaceId() {
		return marketplaceId;
	}

	public void setMarketplaceId(String marketplaceId) {
		this.marketplaceId = marketplaceId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getExternalId() {
		return externalId;
	}

	public void setExternalId(String externalId) {
		this.externalId = externalId;
	}

	public List<Sellers> getSellers() {
		return sellers;
	}

	public void setSellers(List<Sellers> sellers) {
		this.sellers = sellers;
	}
}
