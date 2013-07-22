package com.advmon.webapp.datamodel;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class AdCategory {
	private String name;
	
	private String description;
	
	@ManyToMany(targetEntity = Tag.class, cascade = {
		CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "CAT_TAG", joinColumns = @JoinColumn(name = "CAT_ID"), inverseJoinColumns = @JoinColumn(name = "TAG_ID"))
	private List<Tag> tags;

	@ManyToMany(targetEntity = Advertisement.class, cascade = {
			CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "CAT_AD", joinColumns = @JoinColumn(name = "CAT_ID"), inverseJoinColumns = @JoinColumn(name = "AD_ID"))
	private List<Advertisement> ads;
}
