// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.etc;

import com.advmon.webapp.datamodel.etc.IntRange;
import com.advmon.webapp.datamodel.profiles.IntRangeProfile;
import java.util.List;

privileged aspect IntRange_Roo_JavaBean {
    
    public String IntRange.getName() {
        return this.name;
    }
    
    public void IntRange.setName(String name) {
        this.name = name;
    }
    
    public String IntRange.getDescription() {
        return this.description;
    }
    
    public void IntRange.setDescription(String description) {
        this.description = description;
    }
    
    public Integer IntRange.getMin() {
        return this.min;
    }
    
    public void IntRange.setMin(Integer min) {
        this.min = min;
    }
    
    public Integer IntRange.getMax() {
        return this.max;
    }
    
    public void IntRange.setMax(Integer max) {
        this.max = max;
    }
    
    public List<IntRangeProfile> IntRange.getProfiles() {
        return this.profiles;
    }
    
    public void IntRange.setProfiles(List<IntRangeProfile> profiles) {
        this.profiles = profiles;
    }
    
}
