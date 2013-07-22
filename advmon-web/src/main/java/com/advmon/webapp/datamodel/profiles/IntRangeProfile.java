package com.advmon.webapp.datamodel.profiles;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.advmon.webapp.datamodel.etc.IntRange;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class IntRangeProfile extends Profile{
	@ManyToMany(targetEntity = IntRange.class, cascade = {
		CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "PROFILE_INT_RANGE", joinColumns = @JoinColumn(name = "PROFILE_ID"), inverseJoinColumns = @JoinColumn(name = "RANGE_ID"))
	protected List<IntRange> ranges;
}
