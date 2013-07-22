package com.advmon.webapp.datamodel;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Advertiser {
	private String name;
	
	private String mailId;
	
	private String password;
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="advertiser")
	private List<Advertisement> adList;
}
