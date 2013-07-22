package com.advmon.webapp.datamodel.profiles;
import java.util.List;

import javax.persistence.ElementCollection;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
//@DiscriminatorValue(Util.PROFILE_TYPES.LANGUAGE_PROFILE)
public class LanguageProfile extends Profile{
	@ElementCollection
	private List<String> languages;
}
