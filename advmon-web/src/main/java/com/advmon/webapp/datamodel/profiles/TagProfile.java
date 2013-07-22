package com.advmon.webapp.datamodel.profiles;
import java.util.List;

import javax.persistence.OneToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.advmon.webapp.datamodel.Tag;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
//@DiscriminatorValue(Util.PROFILE_TYPES.TAG_PROFILE)
public class TagProfile extends Profile{
	@OneToMany
	private List<Tag> tags;
}
