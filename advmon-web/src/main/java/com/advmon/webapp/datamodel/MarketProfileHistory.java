package com.advmon.webapp.datamodel;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.advmon.webapp.datamodel.profiles.Profile;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class MarketProfileHistory {
	@ManyToMany(targetEntity = Profile.class, cascade = {
		CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "PROFILE_MKT_HISTORY", joinColumns = @JoinColumn(name = "MKT_PROF_HISTORY_ID"), inverseJoinColumns = @JoinColumn(name = "PROFILE_ID"))
	private List<Profile> historicalProfile;

	@ManyToOne
	@JoinColumn(name = "USER_ID", nullable = false)
	private EndUser endUser;

	private Long startTime;
	
	private Long endTime;

}
