package com.advmon.webapp.datamodel.profiles;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
//@DiscriminatorValue(Util.PROFILE_TYPES.GENDER_PROFILE)
public class GenderProfile extends Profile{
	public enum Gender {
		MALE, FEMALE
	}
	@Enumerated(EnumType.STRING)
	private Gender gender;
}
