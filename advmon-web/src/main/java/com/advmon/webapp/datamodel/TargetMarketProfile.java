package com.advmon.webapp.datamodel;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.advmon.webapp.datamodel.profiles.Profile;

/**
 * An {@link Advertisement} will have a target market profile which will consist of a
 * list of profiles (defined at the time of creating {@link Advertisement}) based on which {@link TargetMarket} will be selected.
 */
@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class TargetMarketProfile {
	private String segmentName;
	
	private String description;
	
	@ManyToMany(targetEntity = Advertisement.class, cascade = {
		CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "TMP_AD", joinColumns = @JoinColumn(name = "TMP_ID"), inverseJoinColumns = @JoinColumn(name = "AD_ID"))
	private List<Advertisement> advertisement;
	
	@ManyToMany(targetEntity = Profile.class, cascade = {
		CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "TMP_PROFILE", joinColumns = @JoinColumn(name = "TMP_ID"), inverseJoinColumns = @JoinColumn(name = "PROFILE_ID"))
	private List<Profile> profiles;
}
