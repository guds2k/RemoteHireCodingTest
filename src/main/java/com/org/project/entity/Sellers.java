package com.org.project.entity;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "sellers")
public class Sellers {

	@Id
	private UUID id;

	@Column(name = "state")
	private String state;

	@JsonManagedReference
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "seller_info_id")
	private SellerInfos sellerInfo;

	@JsonManagedReference
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "producer_id")
	private Producers producers;

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public SellerInfos getSellerInfo() {
		return sellerInfo;
	}

	public void setSellerInfo(SellerInfos sellerInfo) {
		this.sellerInfo = sellerInfo;
	}

	public Producers getProducers() {
		return producers;
	}

	public void setProducers(Producers producers) {
		this.producers = producers;
	}
}
