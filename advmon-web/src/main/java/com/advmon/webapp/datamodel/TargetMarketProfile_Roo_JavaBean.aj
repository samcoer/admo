// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel;

import com.advmon.webapp.datamodel.Advertisement;
import com.advmon.webapp.datamodel.TargetMarketProfile;
import com.advmon.webapp.datamodel.profiles.Profile;
import java.util.List;

privileged aspect TargetMarketProfile_Roo_JavaBean {
    
    public String TargetMarketProfile.getSegmentName() {
        return this.segmentName;
    }
    
    public void TargetMarketProfile.setSegmentName(String segmentName) {
        this.segmentName = segmentName;
    }
    
    public String TargetMarketProfile.getDescription() {
        return this.description;
    }
    
    public void TargetMarketProfile.setDescription(String description) {
        this.description = description;
    }
    
    public List<Advertisement> TargetMarketProfile.getAdvertisement() {
        return this.advertisement;
    }
    
    public void TargetMarketProfile.setAdvertisement(List<Advertisement> advertisement) {
        this.advertisement = advertisement;
    }
    
    public List<Profile> TargetMarketProfile.getProfiles() {
        return this.profiles;
    }
    
    public void TargetMarketProfile.setProfiles(List<Profile> profiles) {
        this.profiles = profiles;
    }
    
}
