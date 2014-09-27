package net.icdpublishing.exercise2.myapp;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import net.icdpublishing.exercise2.myapp.charging.services.ChargingService;
import net.icdpublishing.exercise2.myapp.customers.domain.CustomerType;
import net.icdpublishing.exercise2.searchengine.domain.Record;
import net.icdpublishing.exercise2.searchengine.domain.SourceType;
import net.icdpublishing.exercise2.searchengine.requests.SimpleSurnameAndPostcodeQuery;
import net.icdpublishing.exercise2.searchengine.services.SearchEngineRetrievalService;

public class MySearchController {
	private SearchEngineRetrievalService retrievalService;
	private ChargingService chargingService;

	public MySearchController(SearchEngineRetrievalService retrievalService,
			ChargingService chargingService) {
		this.retrievalService = retrievalService;
		this.chargingService = chargingService;
	}

	/**
	 * Handles the Search Request and retrieve results from Search engine
	 * @param request search request
	 * @return results from search engine
	 */
	public Collection<Record> handleRequest(SearchRequest request) {
		Collection<Record> resultSet = getResults(request.getQuery());

		Iterator<Record> iterator = resultSet.iterator();
		while (iterator.hasNext()) {
			Record record = iterator.next();
			// check if source type is BT
			boolean isBT = (record.getSourceTypes().size() == 1 &&
					record.getSourceTypes().contains(SourceType.BT)) ? true : false;

			if (!isBT && request.getCustomer().getCustomType().equals(CustomerType.PREMIUM)) {
				// charge premium customers
				chargePremiumCustomers(request.getCustomer().getEmailAddress(),	1);
			} else if (!isBT && request.getCustomer().getCustomType().equals(CustomerType.NON_PAYING)) {
				iterator.remove();
			}
		}

		sortRecords(resultSet);
		return resultSet;
	}

	/**
	 * Charge Premium Customers.
	 * 
	 * @param emailAddress
	 *            email address of the premium customer
	 * @param credits
	 *            credits to be added
	 */
	private void chargePremiumCustomers(String emailAddress, int credits) {
		chargingService.charge(emailAddress, credits);
	}

	/**
	 * Fetch Results from search engines.
	 * 
	 * @param query
	 *            criteria built using postcode and surname
	 * @return search engine results
	 */
	private Collection<Record> getResults(SimpleSurnameAndPostcodeQuery query) {
		return retrievalService.search(query);
	}

	/**
	 * Sorting the Person records from search engine.
	 * 
	 * @param records
	 *            records to be sorted
	 */
	private void sortRecords(Collection<Record> records) {
		Collections.sort((List<Record>) records, new Comparator<Record>() {
			public int compare(Record r1, Record r2) {
				return r1.getPerson().getSurname().compareTo(r2.getPerson().getSurname());
			}
		});
	}

}