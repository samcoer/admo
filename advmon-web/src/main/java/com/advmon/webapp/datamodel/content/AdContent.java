package com.advmon.webapp.datamodel.content;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.advmon.webapp.datamodel.Advertisement;
import com.advmon.webapp.utils.Util;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
    name="adContentType",
    discriminatorType=DiscriminatorType.STRING
)
@DiscriminatorValue(Util.AD_CONTENT_TYPES.AD_CONTENT)
public class AdContent {
	
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	protected Advertisement advertisement;

	/**
	 * In case of TextContent it will be main content of Ad, in other cases it
	 * will be meta text of message.
	 */
	protected String text;

}
