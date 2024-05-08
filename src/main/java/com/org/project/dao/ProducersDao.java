package com.org.project.dao;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.org.project.entity.Producers;

public interface ProducersDao extends JpaRepository<Producers, UUID>{

}
