package com.admo.datamodel;

import java.util.List;
import java.util.Map;

import com.admo.datamodel.profiles.Profile;

/**
 * 
 * 
 * @author bhatt
 * 
 */
public class EndUser {
	private Long id;
	/**
	 * Created with info provided by user at the time of account creation and
	 * these profiles will be regularly updated with information provided by
	 * client apps. currentProfile list determines user's latest profile
	 * whenever currentProfile changes a historical entry is created at
	 * profileHistory
	 */
	private List<Profile> currentProfile;
	private List<ProfileHistory> profileHistory;
	private List<Advertisement> advertisements;
	private String emailId;
	private String name;
	/**
	 * Different users have different ratings and paymentMultiplier is used to
	 * determine payment to be received using formula (payment_for_ad =
	 * ad_payment*paymentMultiplier). This field is calculated automatically by
	 * UserRatingService.
	 */
	private Float paymentMultiplier;
	
}
