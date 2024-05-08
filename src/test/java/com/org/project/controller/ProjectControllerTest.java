package com.org.project.controller;

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

import com.org.project.entity.Producers;
import com.org.project.entity.SellerInfos;
import com.org.project.entity.Sellers;
import com.org.project.service.ProjectService;

@RunWith(MockitoJUnitRunner.class)
public class ProjectControllerTest {

	@InjectMocks
	private ProjectController controller;
	@Mock
	private ProjectService service;

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
	public void shouldGetAllSellers() {
		controller.getAllSeller();

		Mockito.verify(service).getAllSeller();
	}

	@Test
	public void shouldFilterSellerByProducerId() {
		Mockito.when(service.filterSellerByProducerId(producerUUID)).thenReturn(getSellers());

		List<Sellers> sellers = controller.filterSellerByProducerId(producerUUID);

		Assert.assertTrue(sellers.size() == 1);
		Assert.assertEquals(sellersUUID, sellers.get(0).getId());
	}

	@Test
	public void shouldFilterSellerByName() {
	}

	@Test
	public void shouldFilterSellerByMarketplaceId() {
		Mockito.when(service.filterSellerByMarketplaceId("amazon")).thenReturn(getSellers());

		List<Sellers> sellers = controller.filterSellerByMarketplaceId("amazon");

		Assert.assertTrue(sellers.size() == 1);
		Assert.assertEquals(sellersUUID, sellers.get(0).getId());
		Mockito.verify(service, times(1)).filterSellerByMarketplaceId("amazon");
	}

	@Test
	public void shouldGetSellersBySortCriteria() {
	}

	@Test
	public void shouldGetSellersByPage() {
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
