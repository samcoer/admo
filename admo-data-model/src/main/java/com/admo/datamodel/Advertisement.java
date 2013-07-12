package com.admo.datamodel;

import java.util.List;

import com.admo.datamodel.content.AdContent;

public class Advertisement {
	private Long id;
	private AdContent content;
	private TargetMarketProfile targetMarket;
	private Advertiser advertiser;
	private TargetMarket market;
	private PaymentInfo paymentInfo;
	private List<AdCategory> categories;
	
	/**
	 * Tells number of times an ad can be repeated to a user. 
	 */
	private int recurrence;
	
}
