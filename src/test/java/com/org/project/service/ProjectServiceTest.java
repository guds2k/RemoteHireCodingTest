package com.org.project.service;

import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;

import java.util.List;
import java.util.UUID;

import org.assertj.core.util.Lists;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;

import com.org.project.dao.SellersDao;
import com.org.project.entity.Producers;
import com.org.project.entity.SellerInfos;
import com.org.project.entity.Sellers;

@RunWith(MockitoJUnitRunner.class)
public class ProjectServiceTest {
	@InjectMocks
	private ProjectService service;
	@Mock
	private SellersDao dao;

	private UUID producerUUID;
	private UUID sellerInfoUUID;
	private UUID sellersUUID;

	@Before
	public void setUp() {
		producerUUID = UUID.randomUUID();
		sellerInfoUUID = UUID.randomUUID();
		sellersUUID = UUID.randomUUID();
	}

	@Test
	public void shouldGetSellersBySortCriteriaSellerInfoExtIdAsc() {
		Mockito.when(dao.getSellerInfoExtIdAsc()).thenReturn(getSellers());

		List<Sellers> sellers = service.getSellersBySortCriteria("SELLER_INFO_EXTERNAL_ID_ASC");

		Assert.assertTrue(sellers.size() == 1);
		Assert.assertEquals(sellersUUID, sellers.get(0).getId());
		Mockito.verify(dao, times(1)).getSellerInfoExtIdAsc();
	}

	@Test
	public void shouldGetSellersBySortCriteriaSellerInfoExtIdDesc() {
		Mockito.when(dao.getNameAsc()).thenReturn(getSellers());

		List<Sellers> sellers = service.getSellersBySortCriteria("NAME_ASC");

		Assert.assertTrue(sellers.size() == 1);
		Mockito.verify(dao, times(1)).getNameAsc();
		Mockito.verify(dao, never()).getSellerInfoExtIdAsc();

	}

	private List<Sellers> getSellers() {
		Sellers sellers = new Sellers();
		sellers.setId(sellersUUID);
		sellers.setState("GENERAL");

		Producers producers = new Producers();
		producers.setId(producerUUID);
		sellers.setProducers(producers);

		SellerInfos sellerInfo = new SellerInfos();
		sellerInfo.setId(sellerInfoUUID);
		sellers.setSellerInfo(sellerInfo);

		return Lists.newArrayList(sellers);
	}
}
