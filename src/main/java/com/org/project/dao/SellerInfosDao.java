package com.org.project.dao;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.org.project.entity.SellerInfos;

public interface SellerInfosDao extends JpaRepository<SellerInfos, UUID> {

}
