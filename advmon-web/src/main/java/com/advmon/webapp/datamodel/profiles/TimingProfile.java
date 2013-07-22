package com.advmon.webapp.datamodel.profiles;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
// @DiscriminatorValue(Util.PROFILE_TYPES.TIMING_PROFILE)
/**
 * Long range values inherited from LongRangeProfile here represent timestamps
 */
public class TimingProfile extends LongRangeProfile {

}
