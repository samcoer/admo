package com.advmon.webapp.datamodel.profiles;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
//@DiscriminatorValue(Util.PROFILE_TYPES.LOCATION_PROFILE)
public class LocationProfile extends Profile{
	private String country;
	private String state;
	private String city;
	private String zip;
	private String gps;
}
