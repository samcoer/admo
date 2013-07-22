package com.advmon.webapp.datamodel.profiles;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.advmon.webapp.datamodel.EndUser;
import com.advmon.webapp.datamodel.MarketProfileHistory;
import com.advmon.webapp.datamodel.TargetMarketProfile;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@Inheritance(strategy=InheritanceType.JOINED)
//@DiscriminatorColumn(
//    name="profileType",
//    discriminatorType=DiscriminatorType.STRING
//)
//@DiscriminatorValue(Util.PROFILE_TYPES.PROFILE)
//Add more and more demographic profiles to target bull's eye.
public class Profile {
	protected String name;
	
	protected String description;
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, mappedBy = "profiles", targetEntity = TargetMarketProfile.class)
	protected List<TargetMarketProfile> mktProfiles;
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, mappedBy = "currentProfile", targetEntity = EndUser.class)
	protected List<EndUser> endUserList;
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, mappedBy = "historicalProfile", targetEntity = MarketProfileHistory.class)
	protected List<MarketProfileHistory> mktProfileHistory;
}
