package com.advmon.webapp.datamodel.profiles;
import java.util.List;

import javax.persistence.ElementCollection;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
//@DiscriminatorValue(Util.PROFILE_TYPES.EDUCATION_PROFILE)
public class EducationProfile extends Profile{
	private enum EDUCATION{
		MATRIC, GRADUATE, POST_GRADUATE
	}
	@ElementCollection
	private List<String> educationList;
}
