package com.advmon.webapp.datamodel;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class PaymentInfo {
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private Advertisement advertisement;
	
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
