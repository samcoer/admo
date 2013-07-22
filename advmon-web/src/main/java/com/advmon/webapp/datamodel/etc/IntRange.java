package com.advmon.webapp.datamodel.etc;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.advmon.webapp.datamodel.profiles.IntRangeProfile;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class IntRange {
	private String name;
	private String description;
	private Integer min;
	private Integer max;
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE }, mappedBy = "ranges", targetEntity = IntRangeProfile.class)
	private List<IntRangeProfile> profiles;
}
