package com.org.project.dao;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.org.project.entity.Sellers;

public interface SellersDao extends JpaRepository<Sellers, UUID> {

	@Query(value = "from Sellers s where s.producers.id = ?1 ")
	List<Sellers> findByProducerId(UUID id);

	@Query(value = "from Sellers s where s.producers.name = ?1 ")
	List<Sellers> filterSellerByName(String name);

	@Query(value = "from Sellers s where s.sellerInfo.marketplaceId = ?1 ")
	List<Sellers> filterSellerByMarketplaceId(String id);

	@Query(value = "from Sellers s order by s.sellerInfo.externalId")
	List<Sellers> getSellerInfoExtIdAsc();

	@Query(value = "from Sellers s order by s.sellerInfo.externalId DESC")
	List<Sellers> getSellerInfoExtIdDesc();

	@Query(value = "from Sellers s order by s.producers.name")
	List<Sellers> getNameAsc();

	@Query(value = "from Sellers s order by s.producers.name DESC")
	List<Sellers> getNameDesc();

	@Query(value = "from Sellers s order by s.sellerInfo.marketplaceId")
	List<Sellers> getMarketplaceIdAsc();

	@Query(value = "from Sellers s order by s.sellerInfo.marketplaceId DESC")
	List<Sellers> getMarketplaceIdDesc();

	@Query(value = "from Sellers s order by s.id offset ?1 fetch next ?2 rows only ")
	List<Sellers> getSellersbyPage(int offset, Integer itemsPerPage);

}
