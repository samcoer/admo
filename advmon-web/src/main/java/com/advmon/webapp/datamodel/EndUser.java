package com.advmon.webapp.datamodel;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.advmon.webapp.datamodel.profiles.Profile;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class EndUser {
	/**
	 * Created with info provided by user at the time of account creation and
	 * these profiles will be regularly updated with information provided by
	 * client apps. currentProfile list determines user's latest profile
	 * whenever currentProfile changes a historical entry is created at
	 * profileHistory
	 */
	@ManyToMany(targetEntity = Profile.class, cascade = { CascadeType.ALL })
	@JoinTable(name = "USR_PROFILE", joinColumns = @JoinColumn(name = "USR_ID"), inverseJoinColumns = @JoinColumn(name = "PROFILE_ID"))
	private List<Profile> currentProfile;
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="endUser")
	private List<MarketProfileHistory> profileHistory;
	
	@ManyToMany(targetEntity = Advertisement.class, cascade = {
		CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "USER_AD", joinColumns = @JoinColumn(name = "USER_ID"), inverseJoinColumns = @JoinColumn(name = "AD_ID"))
	private List<Advertisement> servedAds;
	
	private String emailId;
	
	private String name;
	
	private String password;
	
	/**
	 * Different users have different ratings and paymentMultiplier is used to
	 * determine payment to be received using formula (payment_for_ad =
	 * ad_payment*paymentMultiplier). This field is calculated automatically by
	 * UserRatingService.
	 */
	private Float paymentMultiplier;
}
