package net.icdpublishing.exercise2.myapp;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import junit.framework.Assert;
import net.icdpublishing.exercise2.myapp.charging.ChargingException;
import net.icdpublishing.exercise2.myapp.charging.services.ChargingService;
import net.icdpublishing.exercise2.myapp.customers.dao.HardcodedListOfCustomersImpl;
import net.icdpublishing.exercise2.searchengine.domain.Address;
import net.icdpublishing.exercise2.searchengine.domain.Person;
import net.icdpublishing.exercise2.searchengine.domain.Record;
import net.icdpublishing.exercise2.searchengine.domain.SourceType;
import net.icdpublishing.exercise2.searchengine.requests.SimpleSurnameAndPostcodeQuery;
import net.icdpublishing.exercise2.searchengine.services.SearchEngineRetrievalService;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.BDDMockito;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class MySearchControllerTest {

	@Mock private SearchEngineRetrievalService retrievalService;
	@Mock private ChargingService chargingService;
	private MySearchController controller;
	private Collection<Record> records = null;
	private HardcodedListOfCustomersImpl customers = null;
	private SearchRequest mockedSearchRequest;

	@Before
	public void setUp() throws Exception 
	{
		customers = new HardcodedListOfCustomersImpl();
		controller = new MySearchController(retrievalService, chargingService);

		mockedSearchRequest = new SearchRequest(
				new SimpleSurnameAndPostcodeQuery("Vamshi", "AAA"),
				customers.findCustomerByEmailAddress("john.doe@192.com"));

		// Mockito.doReturn((getDummyRecords())).when(retrievalService).search(mockedSearchRequest.getQuery());
		// above statement can be written in BDD style using BDD Mockito
		BDDMockito.willReturn(getDummyRecords()).given(retrievalService)
				.search(mockedSearchRequest.getQuery());
	}

	@Test
	public void shouldReturnAllRecords() 
	{
		Collection<Record> results = controller.handleRequest(mockedSearchRequest);
		Assert.assertEquals(records.size(), results.size());
	}

	@Test
	public void shouldGetSortedRecords() 
	{
		List<Record> results = (List<Record>) controller.handleRequest(mockedSearchRequest);
		Assert.assertTrue(results.get(0).getPerson().getSurname()
				.compareTo(results.get(1).getPerson().getSurname()) < 0);
	}

	@Test
	public void shouldReturnBTRecordsOnlyForNonPayingCustomer() 
	{
		mockedSearchRequest = new SearchRequest(
				new SimpleSurnameAndPostcodeQuery("Vamshi", "GVV"),
				customers.findCustomerByEmailAddress("harry.lang@192.com"));
		Mockito.doReturn((getDummyRecords())).when(retrievalService)
				.search(mockedSearchRequest.getQuery());

		List<Record> results = (List<Record>) controller
				.handleRequest(mockedSearchRequest);
		
		Assert.assertTrue(results.get(0).getSourceTypes()
				.contains(SourceType.BT));
		Assert.assertFalse(results.get(0).getSourceTypes()
				.contains(SourceType.DNB));
		Assert.assertFalse(results.get(0).getSourceTypes()
				.contains(SourceType.ELECTORAL_ROLL));
		Assert.assertEquals(countofExclusiveBTRecords(), results.size());
	}

	@Test(expected=ChargingException.class)
	public void shouldChargeNonBTPremiumCustomers() throws ChargingException 
	{
		mockedSearchRequest = new SearchRequest(
				new SimpleSurnameAndPostcodeQuery("GVK", "GVK"),
				customers.findCustomerByEmailAddress("sally.smith@192.com"));
		BDDMockito.willReturn(getDummyRecords()).given(retrievalService)
		.search(mockedSearchRequest.getQuery());
		//Mockito.doThrow(new ChargingException("Charged")).when(chargingService).charge("sally.smith@192.com", 1);
		BDDMockito.willThrow(new ChargingException("Charged")).given(chargingService).charge("sally.smith@192.com", 1);
		controller.handleRequest(mockedSearchRequest);
	}

	// Creates list of person records with different sources
	private Collection<Record> getDummyRecords() 
	{
		records = new ArrayList<Record>();
		records.add(createDummyRecord("GG", "Gulapally", "GAA",
				SourceType.ELECTORAL_ROLL));
		records.add(createDummyRecord("VV", "Vamshi", "GVV", SourceType.BT));
		records.add(createDummyRecord("KK", "Krishna", "KAA", SourceType.DNB));
		records.add(createDummyRecord("GVK", "GVK", "GVK", SourceType.BT));
		records.add(createDummyRecord("GG1", "Gulapally1", "GAA1",
				SourceType.ELECTORAL_ROLL, SourceType.BT, SourceType.DNB));
		records.add(createDummyRecord("VV1", "Vamshi1", "GVV1",
				SourceType.ELECTORAL_ROLL, SourceType.BT));
		records.add(createDummyRecord("KK1", "Krishna1", "KAA1",
				SourceType.DNB, SourceType.BT));
		records.add(createDummyRecord("GVK1", "GVK1", "GVK1",
				SourceType.ELECTORAL_ROLL, SourceType.DNB));
		return records;
	}

	// Creates a new dummy record
	private Record createDummyRecord(String surname, String foreName,
			String postCode, SourceType... sourceTypes) 
	{
		Set<SourceType> sources = new HashSet<SourceType>();
		for (SourceType sourceType : sourceTypes) {
			sources.add(sourceType);
		}
		Person p = new Person();
		p.setSurname(surname);
		p.setForename(foreName);
		Address address = new Address();
		address.setPostcode(postCode);
		p.setAddress(address);
		return new Record(p, sources);
	}
	
	private int countofExclusiveBTRecords()
	{
		int count = 0;
		for (Record record : records) {
			if (record.getSourceTypes().size() == 1 &&
					record.getSourceTypes().contains(SourceType.BT))
				count++;
		}
		return count;
	}
}
