package com.advmon.webapp.datamodel.content;
import javax.persistence.DiscriminatorValue;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.advmon.webapp.utils.Util;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@DiscriminatorValue(Util.AD_CONTENT_TYPES.IMAGE_CONTENT)
public class ImageContent extends AdContent{
	private String imageURL;
}
