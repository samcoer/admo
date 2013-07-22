package com.advmon.webapp.datamodel.profiles;
import java.util.List;

import javax.persistence.ElementCollection;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
//@DiscriminatorValue(Util.PROFILE_TYPES.OCCUPATION_PROFILE)
public class OccupationProfile extends Profile{
	// TODO enum for now but it may be too restrictive and also require code
	// changes, might remove later
	private enum Occupation {
		DOCTOR, ENGINEER
	}

	@ElementCollection
	private List<String> occupations;
}
