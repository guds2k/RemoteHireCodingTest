package com.org.project.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.org.project.entity.Marketplaces;

public interface MarketplacesDao extends JpaRepository<Marketplaces, String> {

}
