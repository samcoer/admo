// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.etc.LongRange;
import com.advmon.webapp.datamodel.profiles.LongRangeProfile;
import java.util.List;

privileged aspect LongRangeProfile_Roo_JavaBean {
    
    public List<LongRange> LongRangeProfile.getRanges() {
        return this.ranges;
    }
    
    public void LongRangeProfile.setRanges(List<LongRange> ranges) {
        this.ranges = ranges;
    }
    
}
