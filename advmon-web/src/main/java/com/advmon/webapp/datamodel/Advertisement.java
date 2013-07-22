package com.advmon.webapp.datamodel;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.advmon.webapp.datamodel.content.AdContent;
import com.advmon.webapp.datamodel.profiles.Profile;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Advertisement {
	private String name;
	
	private String description;
	
	@OneToOne(mappedBy = "advertisement", cascade = {CascadeType.PERSIST, CascadeType.MERGE }, fetch = FetchType.LAZY)
	private AdContent content;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, mappedBy="advertisement")
	private List<TargetMarketProfile> targetMarket;

	@ManyToOne
	@JoinColumn(name = "ADVERTISER_ID", nullable = false)
	private Advertiser advertiser;

	/**
	 * An algorithm maps {@link EndUser}s for an advertisement. An
	 * {@link Advertisement} defines a list of {@link Profile}s. Algorithm matches
	 * user profiles with {@link TargetMarketProfile} mentioned in
	 * {@link Advertisement} and all {@link EndUser}s matching a certain percentage
	 * of {@link Profile}s are added to targets in {@link TargetMarket}.
	 */
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, mappedBy = "servedAds")
	private List<EndUser> targets;

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "advertisement", cascade = CascadeType.ALL)
	private PaymentInfo paymentInfo;

	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE }, mappedBy = "ads", targetEntity = AdCategory.class)
	private List<AdCategory> categories;

	/**
	 * Tells number of times an ad can be repeated to a user.
	 */
	private int recurrence;
}
