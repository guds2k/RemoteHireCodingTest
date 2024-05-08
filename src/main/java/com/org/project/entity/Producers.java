package com.org.project.entity;

import java.sql.Timestamp;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "producers")
public class Producers {

	@Id
	private UUID id;

	@Column(name = "name")
	private String name;

	@Column(name = "created_at")
	private Timestamp createdAt;

	@JsonBackReference
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "producers", cascade = CascadeType.ALL)
	private Sellers sellers;

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public void setSellers(Sellers sellers) {
		this.sellers = sellers;
	}

	public Sellers getSellers() {
		return sellers;
	}
}
