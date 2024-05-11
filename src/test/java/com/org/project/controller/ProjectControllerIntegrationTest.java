package com.org.project.controller;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.LinkedHashMap;
import java.util.List;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.jdbc.Sql;

import com.org.project.ProjectApplication;

@SpringBootTest(classes = ProjectApplication.class, webEnvironment = WebEnvironment.RANDOM_PORT)
@Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_CLASS, scripts = { "file:src/test/resources/data.sql" })
public class ProjectControllerIntegrationTest {
	@LocalServerPort
	private int port;

	@Autowired
	private TestRestTemplate restTemplate;

//	@Test
	public void testAllSellers() {
		assertTrue(
				this.restTemplate.getForObject("http://localhost:" + port + "/getAllSeller", List.class).size() == 17);
	}

	@Test
	public void testFilterSellerByProducerId() {
		List obj = this.restTemplate.getForObject(
				"http://localhost:" + port + "/filterSellerByProducerId/3dcd0b3a-bdb7-4a66-b3b7-cc7286c8cf22",
				List.class);
		assertTrue(obj.size() == 1);
		((LinkedHashMap) ((LinkedHashMap) obj.get(0)).get("sellerInfo")).get("id");
		Assert.assertEquals(((LinkedHashMap) ((LinkedHashMap) obj.get(0)).get("sellerInfo")).get("id"),
				"cc6a7635-4cef-40ad-967d-9ebac1af7099");
	}
}
