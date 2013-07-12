package com.admo.datamodel;

public class PaymentInfo {
	/**
	 * Total budget for ad
	 */
	private Double budget;

	/**
	 * If true payments will differ from user to user based on paymentMultiplier
	 * field of {@link EndUser}
	 */
	private Boolean isDifferential;
	
	/**
	 * Payment per impression for this advertisement.
	 */
	private Double ppi;
}
