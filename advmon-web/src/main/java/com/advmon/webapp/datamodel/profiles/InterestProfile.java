package com.advmon.webapp.datamodel.profiles;
import java.util.List;

import javax.persistence.ElementCollection;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
//@DiscriminatorValue(Util.PROFILE_TYPES.INTEREST_PROFILE)
public class InterestProfile extends Profile{
	// TODO Subclass later on for more customization of specific interests
	@ElementCollection
	private List<String> interests;
}
